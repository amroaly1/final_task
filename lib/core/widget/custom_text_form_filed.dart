import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.controller,
    required this.validator,
    this.onSaved,
    this.onChanged,
    this.obscureText,
    this.keyboardType,
    required this.hintText,
    this.hintStyle,
    this.suffixIcon,
    this.prefixIcon,
    this.enabledBorder,
    this.focusedBorder,
    this.errorBorder,
    this.focusedErrorBorder,
    this.contentPadding,
  });
  final TextEditingController? controller;
  final String? Function(String?) validator;
  final void Function(String?)? onSaved;
  final void Function(String)? onChanged;
  final bool? obscureText;
  final TextInputType? keyboardType;
  final String hintText;
  final TextStyle? hintStyle;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final InputBorder? errorBorder;
  final InputBorder? focusedErrorBorder;
  final EdgeInsetsGeometry? contentPadding;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 0.11.sh,
      width: 0.9.sw,
      child: TextFormField(
        controller: controller,
        onSaved: onSaved,
        onChanged: onChanged,
        validator: (value) {
          return validator(value);
        },

        obscureText: obscureText ?? false,
        keyboardType: keyboardType,
        // inputFormatters: [
        //   FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
        //   LengthLimitingTextInputFormatter(11),
        // ],
        decoration: InputDecoration(
          contentPadding: contentPadding ??
              EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          hintText: hintText,
          hintStyle: hintStyle,
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          enabledBorder: enabledBorder ?? _outlineInputBorder(),
          focusedBorder: focusedBorder ?? _outlineInputBorder(),
          errorBorder: errorBorder ?? _outlineInputBorder(color: Colors.red),
          focusedErrorBorder:
              focusedErrorBorder ?? _outlineInputBorder(color: Colors.red),
        ),
      ),
    );
  }

  OutlineInputBorder _outlineInputBorder({Color? color}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.sp),
      borderSide: BorderSide(
        color: color ?? const Color(0xff9EA1A8),
        width: 2,
      ),
    );
  }
}
