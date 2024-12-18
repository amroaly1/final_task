import 'package:final_task/core/constant/app_color.dart';
import 'package:final_task/core/constant/on_boardin_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DottedIndicator extends StatelessWidget {
  const DottedIndicator({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
          konbaordinglist.length, (i) => Dot(isSelected: i == index)),
    );
  }
}

// (){ multi line}
// () => line;
class Dot extends StatelessWidget {
  const Dot({super.key, required this.isSelected});
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      height: 12.h,
      width: 12.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isSelected ? AppColor.blue : AppColor.blue.withOpacity(0.2),
      ),
    );
  }
}
