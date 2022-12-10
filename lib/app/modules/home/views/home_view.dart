import 'package:badges/badges.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intelligent_food_delivery/app/common/theme/app_colors.dart';
import 'package:intelligent_food_delivery/app/common/theme/text_theme.dart';
import 'package:intelligent_food_delivery/app/core/controllers/authentication.controller.dart';
import 'package:intelligent_food_delivery/app/domain/app_user/use_cases/cart_use_case.dart';
import 'package:intelligent_food_delivery/app/routes/app_pages.dart';
import 'package:sizer/sizer.dart';
import '../../../common/utils/firebase.dart';
import '../../../data/app_user/models/app_user.dart';
import '../../../domain/app_settings/usecase/app_setttings_use_case.dart';
import '../controllers/home_controller.dart';
import '../widgets/add_new_address.dart';

class HomeView extends GetView<HomeController> {
  final int _selectedIndex = 0;

  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: AppColors(context).primary,
          statusBarIconBrightness: Brightness.dark,
        ),
        backgroundColor: AppColors(context).primary,
        actions: [
          IconButton(
            icon: Obx(
              () => Badge(
                badgeContent: Text(
                  Get.find<CartUseCase>().cartItems.value.length.toString(),
                ),
                child: const Icon(
                  Icons.shopping_cart_outlined,
                ),
              ),
            ),
            onPressed: () {
              Get.toNamed(Routes.CART);
            },
          ),
        ],
        title: const AddressSelectionBar(),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: TopSearchBar(height: 60),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const TopBar(),
              CardListView(),
            ],
          ),
        ),
      ),
    );
  }
}

class AppDrawer extends GetView<HomeController> {
  const AppDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: AppColors(context).primary,
            ),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const CircleAvatar(
                        radius: 30,
                        child: Icon(
                          Icons.person,
                          size: 40,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        controller.userUseCase.currentUser!.name,
                        style: GoogleFonts.catamaran(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.food_bank),
            title: const Text('Orders'),
            onTap: () {
              Get.back();
              Get.toNamed(Routes.ORDERS_LIST);
            },
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Log Out'),
            onTap: () {
              Get.find<AuthenticationController>().logOut();
            },
          ),
        ],
      ),
    );
  }
}

class AddressSelectionBar extends GetView<HomeController> {
  const AddressSelectionBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.bottomSheet(const _AddressSelectionSheet());
      },
      child: Obx(() => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                controller.userUseCase.userSelectedAddress?.address ?? '',
                style: AppTextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                controller.userUseCase.userSelectedAddress?.city ?? '',
                style: AppTextStyle(
                  fontSize: 9.sp,
                ),
              ),
            ],
          )),
    );
  }
}

class _AddressSelectionSheet extends StatelessWidget {
  const _AddressSelectionSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return Container(
          color: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              RadioListTile(
                value: 'current',
                groupValue: controller.userUseCase.currentUser!.selectedAddressId,
                title: const Text('Current Location'),
                onChanged: controller.onDeliveryAddressChange,
              ),
              for (int i = 0; i < controller.allAddresses.length; i++)
                RadioListTile(
                  value: controller.allAddresses[i].id,
                  groupValue: controller.userUseCase.currentUser!.selectedAddressId,
                  title: Text(controller.allAddresses[i].address),
                  secondary: IconButton(
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      controller.deleteAddress(controller.allAddresses[i].id);
                    },
                  ),
                  onChanged: controller.onDeliveryAddressChange,
                ),
              ListTile(
                leading: Icon(Icons.add, color: AppColors(context).primary),
                title: Text(
                  'Add New Address',
                  style: AppTextStyle(
                    color: AppColors(context).primary,
                  ),
                ),
                onTap: () async {
                  final address = await Get.generalDialog<Address?>(
                    pageBuilder: (context, animation, secondaryAnimation) {
                      return const AddNewAddressView();
                    },
                  );
                  if (address != null) {
                    controller.addAddress(address);
                  }
                  // get the result
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

class TopSearchBar extends StatelessWidget {
  const TopSearchBar({super.key, required this.height});
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => Get.toNamed(Routes.SEARCH),
          child: IgnorePointer(
            child: TextFormField(
              decoration: InputDecoration(
                hintText: 'Search',
                contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(999),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(999),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class IconBottomBar extends StatelessWidget {
  IconBottomBar({Key? key, required this.text, required this.icon, required this.selected, required this.onPressed}) : super(key: key);
  final String text;
  final IconData icon;
  final bool selected;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: onPressed,
          icon: Icon(
            icon,
            color: selected ? const Color(0xff15BE77) : Colors.grey,
          ),
        ),
        Text(
          text,
          style: TextStyle(fontSize: 14, height: .1, color: selected ? const Color(0xff15BE77) : Colors.grey),
        )
      ],
    );
  }
}

class TopBar extends StatelessWidget {
  const TopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            "Find your\nfavorie food",
            style: TextStyle(color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}

class CardListView extends StatelessWidget {
  CardListView({Key? key}) : super(key: key);
  final _settingsUseCase = Get.find<AppSettingsUseCase>();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Cuisine",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 175,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _settingsUseCase.tags.length,
            itemBuilder: (context, index) {
              return Card(
                _settingsUseCase.tags[index]['title']!,
                _settingsUseCase.tags[index]['imagePath']!,
              );
            },
          ),
        ),
      ],
    ).paddingSymmetric(horizontal: 20);
  }
}

class Card extends StatelessWidget {
  final String text;
  final String imageUrl;
  String? imageDownloadUrl;
  Card(this.text, this.imageUrl, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(
          Routes.RESTAURANT_LIST,
          arguments: {
            'title': text,
            'imageUrl': imageUrl,
            'imageDownloadUrl': imageDownloadUrl ?? '',
          },
        );
      },
      child: Container(
        width: 150,
        height: 150,
        padding: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.5),
          boxShadow: [
            BoxShadow(offset: const Offset(10, 20), blurRadius: 10, spreadRadius: 0, color: Colors.grey.withOpacity(.05)),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: FutureBuilder<String>(
                future: FirebaseUtils.fileUrlFromFirebaseStorage(imageUrl),
                builder: (context, snap) {
                  if (!snap.hasData) {
                    return const FadeShimmer(
                      height: 120,
                      width: 150,
                      fadeTheme: FadeTheme.light,
                    );
                  }
                  imageDownloadUrl = snap.data;
                  return Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.5),
                    ),
                    child: Hero(
                      tag: imageUrl,
                      child: CachedNetworkImage(
                        imageUrl: snap.data ?? '',
                        height: 120,
                        width: 150,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 4),
            Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 4),
          ],
        ),
      ),
    );
  }
}
