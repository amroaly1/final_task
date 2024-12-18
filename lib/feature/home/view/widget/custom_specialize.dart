import 'package:final_task/core/constant/app_color.dart';
import 'package:final_task/core/constant/app_style.dart';
import 'package:final_task/core/constant/specialize_list.dart';
import 'package:final_task/feature/home/view_model/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSpecialize extends StatelessWidget {
  const CustomSpecialize({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return ListView.separated(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: kSpecializeList.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                BlocProvider.of<HomeCubit>(context)
                    .selectCategory(context, index);
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: BlocProvider.of<HomeCubit>(context).index == index
                        ? AppColor.blue
                        : AppColor.gray,
                    width: 1.5,
                  ),
                ),
                child: Text(
                  kSpecializeList[index],
                  style:
                      AppStyle.elMessiriBold15.copyWith(color: AppColor.black),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(
              width: 10.w,
            );
          },
        );
      },
    );
  }
}
