import 'package:cd_app/src/constants/color_constants.dart';
import 'package:cd_app/src/utils/text_utils.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.borderRadius = 4,
    this.titleColor = ColorConstants.whiteColor,
    this.borderColor = ColorConstants.primaryColor,
    this.color = ColorConstants.primaryColor,
    this.fontSize = 14,
  });

  final String title;
  final Color? titleColor;
  final Color borderColor;
  final Color color;
  final double fontSize;
  final double borderRadius;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(borderRadius),
          border: Border.all(
            color: borderColor,
            width: 1,
          ),
        ),
        child: Text(
          title,
          style: TextUtils.poppins(
            TextStyle(
              color: titleColor,
              fontSize: fontSize,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
