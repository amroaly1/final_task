import 'package:final_task/core/constant/app_color.dart';
import 'package:final_task/core/constant/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      this.color,
      this.textColor,
      this.onTap,
      required this.text,
      this.height});
  final Color? color;
  final Color? textColor;
  final void Function()? onTap;
  final String text;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height ?? 60.h,
        decoration: BoxDecoration(
          color: color ?? AppColor.blue,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            text,
            style: textColor == null
                ? AppStyle.elMessiriSemiBold16
                : AppStyle.elMessiriSemiBold16.copyWith(color: textColor),
          ),
        ),
      ),
    );
  }
}
