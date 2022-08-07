import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import '../theme/app_colors.dart';

enum LoadingTextButtonState { idle, loading }

class LoadingTextButton extends StatelessWidget {
  const LoadingTextButton({
    Key? key,
    this.text,
    this.normalWidget,
    required this.onPressed,
    this.state = LoadingTextButtonState.idle,
    this.loadingWidget,
    this.backgroundColor,
  }) : super(key: key);
  final String? text;
  final Widget? normalWidget;
  final LoadingTextButtonState state;
  final Callback? onPressed;
  final Widget? loadingWidget;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: state == LoadingTextButtonState.idle
          ? text != null
              ? Text(text!)
              : normalWidget!
          : loadingWidget ??
              const SpinKitCircle(
                color: Colors.white,
                size: 32,
              ),
      style: TextButton.styleFrom(
        backgroundColor: getBackgroundColor(context),
      ),
    );
  }

  getBackgroundColor(context) {
    if (backgroundColor == null) {
      if (onPressed == null) {
        return AppColors(context).isDark ? AppColors(context).grey600 : AppColors(context).grey300;
      }
      return AppColors(context).primary;
    }
    return backgroundColor;
  }
}
