import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/helpers/spacing.dart';
import 'package:flutter_complete_project/core/theming/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextButton extends StatelessWidget {
  final double? borderRadius;
  final Color? backgroundColor;
  final double? horizontalPadding;
  final double? verticalPadding;
  final double? buttonWidth;
  final double? buttonHeight;
  final String buttonText;
  final TextStyle textStyle;
  final VoidCallback onPressed;

  const AppTextButton({super.key, this.borderRadius, this.backgroundColor, this.horizontalPadding, this.verticalPadding, this.buttonWidth, this.buttonHeight, required this.buttonText, required this.textStyle, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 16.0)
            ),
          ),
          backgroundColor: MaterialStatePropertyAll(
            backgroundColor ?? ColorsManager.mainBlue,
          ),
          padding: MaterialStateProperty.all<EdgeInsets>(
            EdgeInsets.symmetric(
              horizontal: horizontalPadding ?? 12.w,
              vertical: verticalPadding ?? 14.h,
            ),
          ),
          fixedSize: MaterialStateProperty.all(
            Size(buttonWidth ?? double.maxFinite, buttonHeight ?? 50.h),
          ),
        ),

        onPressed: onPressed, 
        child: Text(
          buttonText,
          style: textStyle
        )
    );
  }
}
