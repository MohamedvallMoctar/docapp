import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/theming/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theming/styles.dart';

class AppTextFormField extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final String hintText;
  final bool? isObscureText;
  final Widget? suffixIcon;
  final Color? backgroundColor;


  const AppTextFormField({super.key, this.contentPadding, this.focusedBorder, this.enabledBorder, this.inputTextStyle, this.hintStyle, required this.hintText, this.suffixIcon, this.isObscureText,  this.backgroundColor});


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        isDense: true,
        contentPadding: contentPadding ?? EdgeInsets.symmetric( vertical: 18.h, horizontal: 20.w,),
        focusedBorder: focusedBorder ?? const OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorsManager.mainBlue,
            width: 1.3,
          )
        ),
        enabledBorder: enabledBorder ?? OutlineInputBorder(
            borderSide:  const BorderSide(
              color: ColorsManager.lighterGray,
              width: 1.3,
            ),
        borderRadius: BorderRadius.circular(16.0),
        ),
        hintStyle: hintStyle ?? TextStyles.font14LightRegular,
        hintText: hintText,
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: backgroundColor ?? Colors.white
        
      ),
      obscureText: isObscureText ?? false,
      style: TextStyles.font14DarkBlueMedium,
    );
  }
}
