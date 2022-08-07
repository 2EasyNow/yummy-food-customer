import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';

import '../../utils/dialogs.dart';
import '../theme/app_colors.dart';
import 'spacers.dart';

class ImageAvatarPicker extends StatelessWidget {
  const ImageAvatarPicker({Key? key, required this.onImageSelected, required this.image}) : super(key: key);
  final Function(File) onImageSelected;
  final Widget image;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 100,
        width: 100,
        clipBehavior: Clip.none,
        decoration: BoxDecoration(
          color: AppColors(context).grey900,
          border: Border.all(
            color: AppColors(context).grey600,
          ),
          shape: BoxShape.circle,
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned.fill(
              child: Container(
                height: 100.h,
                width: 100.w,
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: image,
              ),
            ),
            Positioned(
              right: 0,
              bottom: 2,
              child: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  color: AppColors(context).primary,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: FittedBox(
                  child: IconButton(
                    splashRadius: 20,
                    icon: Icon(
                      FontAwesomeIcons.pen,
                      size: 24,
                      color: AppColors(context).black,
                    ),
                    onPressed: () => pickNewImage(context),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _pickNewImageFromSource(ImageSource source) async {
    if (Get.isDialogOpen!) {
      Get.back();
    }
    var image = await ImagePicker().pickImage(
      source: source,
      imageQuality: 50,
    );
    if (image != null) {
      onImageSelected(File(image.path));
    }
  }

  pickNewImage(context) {
    return showAppDialog(
      context,
      icon: const Icon(FontAwesomeIcons.cameraRetro),
      title: 'Pick a new image',
      body: Column(
        children: [
          TextButton(
            onPressed: () => _pickNewImageFromSource(ImageSource.camera),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(FontAwesomeIcons.cameraRetro),
                HorizontalSpacer(),
                Text("Take a new photo"),
              ],
            ),
          ),
          VerticalSpacer(space: 2.h),
          TextButton(
            onPressed: () => _pickNewImageFromSource(ImageSource.gallery),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(FontAwesomeIcons.images),
                HorizontalSpacer(),
                Text("Choose from gallery"),
              ],
            ),
          ),
          VerticalSpacer(space: 2.h),
        ],
      ),
    );
  }
}
