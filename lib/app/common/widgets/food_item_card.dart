
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../data/food_item/models/food_item.dart';
import '../theme/text_theme.dart';
import '../utils/firebase.dart';

class FoodItemCard extends StatelessWidget {
  const FoodItemCard({
    Key? key,
    required this.item,
  }) : super(key: key);

  final FoodItem item;

  @override
  Widget build(BuildContext context) {
    final FoodItem foodItem = item;
    return SizedBox.fromSize(
      size: const Size.fromHeight(100),
      child: Card(
        elevation: 0.0,
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    foodItem.name,
                    style: AppTextStyle(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    foodItem.description,
                    style: AppTextStyle(
                      fontSize: 9.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey.shade500,
                    ),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Text(
                        'Rs. ${foodItem.price}',
                        style: AppTextStyle(
                          fontSize: 9.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                ],
              ).paddingSymmetric(vertical: 4, horizontal: 12),
            ),
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
              ),
              clipBehavior: Clip.antiAlias,
              child: FutureBuilder<String>(
                future: FirebaseUtils.fileUrlFromFirebaseStorage(foodItem.imagePath),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const FadeShimmer(
                      height: 100,
                      width: 100,
                      radius: 4,
                      fadeTheme: FadeTheme.light,
                    );
                  }
                  return CachedNetworkImage(
                    imageUrl: snapshot.data!,
                    fit: BoxFit.cover,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}