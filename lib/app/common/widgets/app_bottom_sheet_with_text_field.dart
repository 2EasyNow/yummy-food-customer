import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'spacers.dart';
import 'package:sizer/sizer.dart';

import '../theme/app_colors.dart';
import '../theme/text_theme.dart';
import 'icon_button.dart';

class TextFieldInBottomSheet extends StatelessWidget {
  TextFieldInBottomSheet({
    Key? key,
    required this.title,
    required this.onSave,
    required this.onClose,
    initialValue = '',
    this.heightSize = MainAxisSize.min,
    this.expands = false,
    this.minLines,
    this.maxLines,
    this.minHeight,
    this.hintText,
  }) : super(key: key) {
    textController = TextEditingController(text: initialValue);
  }
  final int? minLines;
  final int? maxLines;
  final String title;
  final Function(String) onSave;
  final Callback onClose;
  final MainAxisSize heightSize;
  final bool expands;
  final double? minHeight;
  final String? hintText;
  late final TextEditingController textController;

  @override
  Widget build(BuildContext context) {
    final colors = AppColors(context);
    return Container(
      height: minHeight,
      decoration: BoxDecoration(
        color: colors.background,
        borderRadius: const BorderRadius.vertical(
          top: Radius.elliptical(
            200,
            50,
          ),
        ),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: heightSize,
        children: [
          Text(
            title,
            style: AppTextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.sp,
            ),
          ),
          const VerticalSpacer(),
          BuildCondition(
            condition: (expands || minLines != null),
            builder: (context) {
              return Expanded(
                child: _getInputFieldWidget(),
              );
            },
            fallback: (context) {
              return _getInputFieldWidget();
            },
          ),
          const VerticalSpacer(),
          Row(
            children: [
              Expanded(
                child: AppIconnedButton(
                  text: 'Save',
                  icon: const Icon(Icons.check),
                  onPressed: () => onSave(textController.text),
                ),
              ),
              const HorizontalSpacer(),
              Expanded(
                child: AppIconnedButton(
                  onPressed: onClose,
                  backgroundColor: Colors.transparent,
                  borderColor: colors.error,
                  textColor: colors.error,
                  splashColor: colors.error,
                  borderWidth: 1,
                  icon: const Icon(FontAwesomeIcons.xmark),
                  text: "Cancel",
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  _getInputFieldWidget() {
    return TextFormField(
      controller: textController,
      minLines: expands ? null : minLines,
      maxLines: expands ? null : maxLines,
      expands: expands,
      textAlignVertical: TextAlignVertical.top,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: (minLines == null && !expands) ? const Icon(FontAwesomeIcons.circleInfo) : null,
      ),
    );
  }
}
