import 'package:cached_network_image/cached_network_image.dart';
import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intelligent_food_delivery/app/common/theme/app_colors.dart';
import 'package:intelligent_food_delivery/app/common/theme/text_theme.dart';
import 'package:intelligent_food_delivery/app/common/utils/firebase.dart';
import 'package:intelligent_food_delivery/app/common/utils/maps.dart';
import 'package:intelligent_food_delivery/app/domain/restaurant/use_cases/restaurant_use_case.dart';
import 'package:intelligent_food_delivery/app/routes/app_pages.dart';
import '../../../data/restaurant/models/restaurant.dart';
import '../controllers/restaurant_list_controller.dart';

class RestaurantListView extends GetView<RestaurantListController> {
  const RestaurantListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<RestaurantListController>(builder: (_) {
        return CustomScrollView(
          slivers: [
            SliverAppBar(
              // leading: const BackButton(color: Colors.white),
              pinned: true,
              expandedHeight: 250,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: false,
                title: Text(
                  controller.title,
                  style: AppTextStyle(
                    // color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                background: Stack(
                  fit: StackFit.expand,
                  children: [
                    Positioned.fill(
                      child: FlexibleSpaceBar(
                        background: controller.imageDownloadUrl.isEmpty
                            ? FutureBuilder<String>(
                                future: FirebaseUtils.fileUrlFromFirebaseStorage(controller.imagePath),
                                builder: (context, snap) {
                                  if (!snap.hasData) {
                                    return const FadeShimmer(
                                      height: 120,
                                      width: 150,
                                      fadeTheme: FadeTheme.light,
                                    );
                                  }
                                  return Hero(
                                    tag: controller.imagePath,
                                    child: CachedNetworkImage(
                                      imageUrl: snap.data ?? '',
                                      colorBlendMode: BlendMode.darken,
                                      color: Colors.black.withOpacity(0.3),
                                      fit: BoxFit.cover,
                                    ),
                                  );
                                },
                              )
                            : Hero(
                                tag: controller.imagePath,
                                child: CachedNetworkImage(
                                  imageUrl: controller.imageDownloadUrl,
                                  colorBlendMode: BlendMode.darken,
                                  color: Colors.black.withOpacity(0.3),
                                  fit: BoxFit.cover,
                                ),
                              ),
                        // background: Assets.images.pizza.image(
                        // fit: BoxFit.cover,
                        // colorBlendMode: BlendMode.darken,
                        // color: Colors.black.withOpacity(0.3),
                        // ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Obx(
              () {
                final restaurantUseCase = Get.find<RestaurantUseCase>();
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final restaurant = restaurantUseCase.allNearbyRestaurants[index];
                      return _RestaurantCard(
                        restaurant: restaurant,
                        restaurantDistanceMatric: restaurantUseCase.nearbyRestaurantsDistanceMatrics[restaurant.id]!,
                      ).paddingSymmetric(horizontal: 16).marginOnly(top: 16);
                    },
                    childCount: Get.find<RestaurantUseCase>().allNearbyRestaurants.length,
                  ),
                );
              },
            ),
          ],
        );
      }),
    );
  }
}

class _RestaurantCard extends StatelessWidget {
  _RestaurantCard({
    Key? key,
    required this.restaurant,
    required this.restaurantDistanceMatric,
  }) : super(key: key);

  final Restaurant restaurant;
  final MapDistanceMatric restaurantDistanceMatric;
  String? _imageDownloadUrl;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(
          Routes.Restaurant,
          arguments: {
            'restaurant': restaurant,
            'imageDownloadUrl': _imageDownloadUrl,
          },
        );
      },
      child: SizedBox(
        height: 210,
        width: double.infinity,
        child: Column(
          children: [
            Container(
              height: 140,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              clipBehavior: Clip.antiAlias,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Positioned.fill(
                    child: FutureBuilder<String>(
                      future: FirebaseUtils.fileUrlFromFirebaseStorage(restaurant.bannerImagePath),
                      builder: (context, snap) {
                        if (!snap.hasData) {
                          return const FadeShimmer(
                            width: double.infinity,
                            height: double.infinity,
                            fadeTheme: FadeTheme.light,
                          );
                        }
                        _imageDownloadUrl = snap.data;
                        return Hero(
                          tag: restaurant.id,
                          child: CachedNetworkImage(
                            imageUrl: snap.data ?? '',
                            height: double.infinity,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                    ),
                  ),
                  const Positioned(
                    right: 12,
                    top: 12,
                    child: Icon(
                      Icons.favorite,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                  Positioned(
                    left: 12,
                    bottom: 12,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors(context).primary,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        'Get in ${restaurantDistanceMatric.mins + restaurant.averageTimeToCompleteOrder} mins',
                        style: AppTextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 4),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(restaurant.name),
                      const Spacer(),
                      Icon(
                        Icons.star,
                        color: AppColors(context).primary,
                        size: 16,
                      ),
                      Text(
                        ' 5 (50)',
                        style: AppTextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    (restaurant.foodOfferingTypes.length > 3 ? restaurant.foodOfferingTypes.sublist(0, 3) : restaurant.foodOfferingTypes).join(', '),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: AppColors(context).grey500,
                    ),
                  ),
                  Text(
                    '${restaurantDistanceMatric.distance} away',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
