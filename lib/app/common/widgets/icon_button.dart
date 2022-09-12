import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

import '../theme/app_colors.dart';
import '../theme/text_theme.dart';

enum IconPosition {
  left,
  right,
  startOfText,
  endOfText,
}

class AppIconnedButton extends StatelessWidget {
  const AppIconnedButton({
    Key? key,
    required this.icon,
    required this.text,
    required this.onPressed,
    this.iconPosition = IconPosition.startOfText,
    this.borderWidth = 0,
    this.backgroundColor,
    this.splashColor,
    this.textColor,
    this.borderColor = const Color(0xFF000000),
  }) : super(key: key);
  final Widget icon;
  final String text;
  final Callback onPressed;
  final IconPosition iconPosition;
  final Color? backgroundColor, splashColor, textColor;
  final Color borderColor;
  final double borderWidth;

  @override
  Widget build(BuildContext context) {
    var colors = AppColors(context);
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        minimumSize: Size(Get.width, 60),
        // backgroundColor: colors.isDark ? colors.grey900 : colors.white,
        backgroundColor: backgroundColor ?? colors.primary,
        // primary: colors.isDark ? colors.grey100 : colors.grey500,
        primary: splashColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: borderWidth.isGreaterThan(0)
              ? BorderSide(
                  // color: colors.grey200,
                  color: borderColor,
                  // width: colors.isDark ? 0 : 1,
                  width: borderWidth,
                )
              : BorderSide.none,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Expanded(
              child: Stack(
                children: [
                  if (iconPosition == IconPosition.left || iconPosition == IconPosition.right)
                    Align(
                      alignment: iconPosition == IconPosition.left ? Alignment.centerLeft : Alignment.centerRight,
                      child: SizedBox(
                        height: 22,
                        width: 22,
                        child: FittedBox(
                          fit: BoxFit.fill,
                          child: icon,
                        ),
                      ),
                    ),

                  // Positioned(
                  //   left: 20,
                  //   child: SizedBox(
                  //     height: 22,
                  //     width: 22,
                  //     child: FittedBox(
                  //       fit: BoxFit.fill,
                  //       child: icon,
                  //     ),
                  //   ),
                  // ),
                  Align(
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (iconPosition == IconPosition.startOfText)
                          SizedBox(
                            height: 22,
                            width: 22,
                            child: FittedBox(
                              fit: BoxFit.fill,
                              child: icon,
                            ),
                          ),
                        if (iconPosition == IconPosition.startOfText) const SizedBox(width: 12),
                        Text(
                          text,
                          style: AppTextStyle(
                            // color: colors.isDark ? colors.white : colors.grey800,
                            color: textColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        if (iconPosition == IconPosition.endOfText) const SizedBox(width: 12),
                        if (iconPosition == IconPosition.endOfText)
                          SizedBox(
                            height: 22,
                            width: 22,
                            child: FittedBox(
                              fit: BoxFit.fill,
                              child: icon,
                            ),
                          ),
                      ],
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
