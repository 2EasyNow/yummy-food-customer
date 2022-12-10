import 'package:cached_network_image/cached_network_image.dart';
import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:get/get.dart';
import 'package:intelligent_food_delivery/app/common/theme/app_colors.dart';
import 'package:intelligent_food_delivery/app/common/widgets/food_item_card.dart';

import '../../../common/utils/firebase.dart';
import '../../../data/food_item/models/food_item.dart';
import '../controllers/restaurant_controller.dart';

class RestaurantView extends GetView<RestaurantController> {
  const RestaurantView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<RestaurantController>(builder: (_) {
          return Scrollbar(
            radius: const Radius.circular(8),
            notificationPredicate: (notification) {
              controller.valueScroll.value = notification.metrics.extentInside;
              return true;
            },
            child: StreamBuilder<double>(
              stream: controller.globalOffsetValue.stream,
              builder: (_, snapshot) {
                return CustomScrollView(
                  physics: const BouncingScrollPhysics(),
                  controller: controller.globalScrollController,
                  slivers: [
                    _FlexibleSpaceBarHeader(
                      valueScroll: snapshot.data ?? 0.0,
                    ),
                    if (!controller.isCategoriesFetched || !controller.isFoodItemsFetched || !controller.isItemsGrouped)
                      SliverToBoxAdapter(
                        child: SizedBox(
                          height: 200,
                          child: Center(
                            child: SpinKitCircle(
                              color: AppColors(context).primary,
                            ),
                          ),
                        ),
                      ),
                    if (controller.isCategoriesFetched || controller.isFoodItemsFetched || controller.isItemsGrouped)
                      SliverPersistentHeader(
                        pinned: true,
                        delegate: _HeaderSliver(),
                      ),
                    if (controller.isCategoriesFetched || controller.isFoodItemsFetched || controller.isItemsGrouped)
                      for (int i = 0; i < controller.foodCategories.length; i++) ...[
                        SliverPersistentHeader(
                          delegate: MyHeaderTitle(
                            controller.foodCategories[i].name,
                            (visible) => controller.updateCategoryTabHeader(
                              i,
                              visible,
                              i - 1 != 0 ? i - 1 : null,
                            ),
                          ),
                        ),
                        SliverBodyItems(
                          items: controller.groupedFoodItems[controller.foodCategories[i].name] ?? [],
                        ),
                      ]
                  ],
                );
              },
            ),
          );
        }),
      ),
    );
  }
}

class _FlexibleSpaceBarHeader extends GetView<RestaurantController> {
  const _FlexibleSpaceBarHeader({
    Key? key,
    required this.valueScroll,
  }) : super(key: key);

  final double valueScroll;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: true,
      backgroundColor: Colors.transparent,
      stretch: true,
      leading: const SizedBox.shrink(),
      expandedHeight: 250,
      pinned: valueScroll < 90,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: EdgeInsets.zero,
        collapseMode: CollapseMode.pin,
        stretchModes: const [StretchMode.zoomBackground],
        background: Stack(
          fit: StackFit.expand,
          children: [
            Positioned.fill(
              child: controller.initialImageUrl == null
                  ? FutureBuilder<String>(
                      future: FirebaseUtils.fileUrlFromFirebaseStorage(
                        controller.restaurant.bannerImagePath,
                      ),
                      builder: (context, snap) {
                        if (!snap.hasData) {
                          return const FadeShimmer(
                            width: double.infinity,
                            height: double.infinity,
                            fadeTheme: FadeTheme.light,
                          );
                        }
                        return Hero(
                          tag: controller.restaurant.id,
                          child: CachedNetworkImage(
                            imageUrl: snap.data ?? '',
                            height: double.infinity,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                    )
                  : Hero(
                      tag: controller.restaurant.id,
                      child: CachedNetworkImage(
                        imageUrl: controller.initialImageUrl!,
                        height: double.infinity,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
            ),
            Positioned(
              right: 20,
              top: (MediaQuery.of(context).size.height - 32) - controller.valueScroll.value,
              child: const Icon(
                Icons.favorite,
                size: 30,
                color: Colors.white,
              ),
            ),
            Positioned(
              left: 20,
              top: (MediaQuery.of(context).size.height - 32) - controller.valueScroll.value,
              child: GestureDetector(
                onTap: Get.back,
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HeaderSliver extends SliverPersistentHeaderDelegate {
  final _headerExtent = 100.0;
  final controller = Get.find<RestaurantController>();
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    final percent = shrinkOffset / _headerExtent;
    if (percent > 0.1) {
      controller.isCategoriesTabsVisible.value = true;
    } else {
      controller.isCategoriesTabsVisible.value = false;
    }
    return Stack(
      children: [
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            height: _headerExtent,
            color: AppColors(context).background,
            child: Column(
              children: [
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      AnimatedOpacity(
                        opacity: percent > 0.1 ? 1 : 0,
                        duration: const Duration(milliseconds: 300),
                        child: GestureDetector(
                          onTap: Get.back,
                          child: const Icon(Icons.arrow_back),
                        ),
                      ),
                      AnimatedSlide(
                        offset: Offset(percent < 0.1 ? -0.18 : 0.1, 0),
                        curve: Curves.easeInOut,
                        duration: const Duration(milliseconds: 300),
                        child: Text(
                          controller.restaurant.name,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child: percent > 0.1 ? const ListItemHeaderSliver() : const _RestaurantInfomationHeader(),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: AnimatedOpacity(
            opacity: percent > 0.1 ? 1 : 0,
            duration: const Duration(milliseconds: 300),
            child: Container(
              height: 1,
              color: AppColors(context).inverseBackground,
            ),
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => _headerExtent;

  @override
  double get minExtent => _headerExtent;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => false;
}

class _RestaurantInfomationHeader extends StatelessWidget {
  const _RestaurantInfomationHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Pizza . Italian . Fast Food',
            style: TextStyle(
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 6),
          Row(
            children: const [
              Icon(
                Icons.access_time,
                size: 14,
              ),
              SizedBox(width: 4),
              Text(
                '30-40 min   4.3',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              SizedBox(width: 6),
              Icon(
                Icons.star,
                size: 14,
              ),
              SizedBox(width: 8),
              Text(
                '\$6.5 Fee',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ListItemHeaderSliver extends GetWidget<RestaurantController> {
  const ListItemHeaderSliver({super.key});

  @override
  Widget build(BuildContext context) {
    final itemsHeaderOffsetList = controller.itemsHeaderOffsetList;
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: NotificationListener(
          onNotification: (_) => false,
          child: SingleChildScrollView(
            padding: itemsHeaderOffsetList.length > 1
                ? EdgeInsets.only(
                    right: Get.width -
                        (itemsHeaderOffsetList[itemsHeaderOffsetList.length - 1] - itemsHeaderOffsetList[itemsHeaderOffsetList.length - 2]),
                  )
                : null,
            scrollDirection: Axis.horizontal,
            controller: controller.categoriesTabsScrollController,
            physics: const NeverScrollableScrollPhysics(),
            child: StreamBuilder<MyHeader?>(
                stream: controller.currentHeader.stream,
                builder: (context, snapshot) {
                  return Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: List.generate(
                      controller.foodCategories.length,
                      (index) => GetBoxOffset(
                        offset: (widgetOffset) {
                          itemsHeaderOffsetList[index] = widgetOffset.dx;
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: const EdgeInsets.only(
                            top: 8,
                            bottom: 8,
                            right: 8,
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4),
                          decoration: BoxDecoration(
                            color: index == (snapshot.data?.index ?? 0) ? Colors.black : Colors.white,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Text(
                            controller.foodCategories[index].name,
                            style: TextStyle(
                              color: index == (snapshot.data?.index ?? 0) ? Colors.white : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ),
      ),
    );
  }
}

class MyHeaderTitle extends SliverPersistentHeaderDelegate {
  final String title;
  final Function(bool visible) onHeaderChange;
  final double _headerExtent = 80.0;
  MyHeaderTitle(this.title, this.onHeaderChange);

  @override
  Widget build(Object context, double shrinkOffset, bool overlapsContent) {
    if (shrinkOffset > 0) {
      onHeaderChange(true);
    } else {
      onHeaderChange(false);
    }
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }

  @override
  double get maxExtent => _headerExtent;

  @override
  double get minExtent => _headerExtent;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => false;
}

class SliverBodyItems extends StatelessWidget {
  const SliverBodyItems({super.key, required this.items});
  final List<FoodItem> items;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final item = items[index];
          return Column(
            children: [
              GestureDetector(
                onTap: () {
                  // open the bottom sheet
                  Get.bottomSheet(ProductBottomSheet(
                    item: item,
                  ));
                },
                child: FoodItemCard(item: item),
              ),
              if (index != items.length - 1) const SizedBox(height: 16),
              if (index == items.length - 1) ...[
                const SizedBox(height: 16),
                Container(
                  height: 0.5,
                  width: double.infinity,
                  color: Colors.grey,
                ),
                const SizedBox(height: 16),
              ],
            ],
          );
        },
        childCount: items.length,
      ),
    );
  }
}

class GetBoxOffset extends StatefulWidget {
  const GetBoxOffset({super.key, required this.child, required this.offset});
  final Widget child;
  final Function(Offset widgetOffset) offset;
  @override
  State<GetBoxOffset> createState() => _GetBoxOffsetState();
}

class _GetBoxOffsetState extends State<GetBoxOffset> {
  final GlobalKey _key = GlobalKey();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final RenderBox box = _key.currentContext?.findRenderObject() as RenderBox;
      final Offset offset = box.localToGlobal(Offset.zero);
      widget.offset(offset);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      key: _key,
      child: widget.child,
    );
  }
}

// Bottom sheet to show the product and with a counter of quantity and add to cart button
class ProductBottomSheet extends StatefulWidget {
  const ProductBottomSheet({
    super.key,
    required this.item,
  });
  final FoodItem item;

  @override
  State<ProductBottomSheet> createState() => _ProductBottomSheetState();
}

class _ProductBottomSheetState extends State<ProductBottomSheet> {
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<RestaurantController>(builder: (controller) {
      return Container(
        height: 300,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(16),
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 16),
            Container(
              height: 4,
              width: 40,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const SizedBox(width: 16),
                Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: FutureBuilder<String>(
                    future: FirebaseUtils.fileUrlFromFirebaseStorage(widget.item.imagePath),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return const FadeShimmer(
                          height: 80,
                          width: 80,
                          radius: 4,
                          fadeTheme: FadeTheme.light,
                        );
                      }
                      return CachedNetworkImage(
                        imageUrl: snapshot.data!,
                        height: 80,
                        width: 80,
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.item.name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      widget.item.description,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Rs. ${widget.item.price}',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            Container(
              height: 0.5,
              width: double.infinity,
              color: Colors.grey,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(width: 16),
                    TextButton(
                      style: TextButton.styleFrom(
                        minimumSize: Size.zero,
                        disabledBackgroundColor: Colors.grey,
                      ),
                      onPressed: quantity == 1
                          ? null
                          : () {
                              if (quantity > 1) {
                                setState(() {
                                  quantity--;
                                });
                              }
                            },
                      child: const Icon(
                        Icons.remove,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Text(
                      quantity.toString(),
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(width: 16),
                    TextButton(
                      style: TextButton.styleFrom(minimumSize: Size.zero),
                      onPressed: () {
                        setState(() {
                          quantity++;
                        });
                      },
                      child: const Icon(
                        Icons.add,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Text(
                  'Rs. ${widget.item.price * quantity}',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(width: 20),
              ],
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () {
                controller.addToCart(context, widget.item, quantity);
                Navigator.pop(context);
              },
              child: const Text('Add to cart'),
            ).paddingSymmetric(horizontal: 20),
          ],
        ),
      );
    });
  }
}
