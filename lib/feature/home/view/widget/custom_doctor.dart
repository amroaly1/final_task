import 'package:final_task/core/constant/app_color.dart';
import 'package:final_task/core/constant/app_image.dart';
import 'package:final_task/core/constant/app_style.dart';
import 'package:final_task/core/route/page_path.dart';
import 'package:final_task/core/widget/custom_button.dart';
import 'package:final_task/feature/home/model/docotor_model.dart';
import 'package:final_task/feature/home/view_model/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDoctor extends StatelessWidget {
  const CustomDoctor({super.key, required this.docotrs});
  final List<DocotorModel> docotrs;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return SliverList.separated(
          itemCount: docotrs.length,
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.all(10),
              margin: EdgeInsets.symmetric(horizontal: 25.w),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColor.gray, width: 1.5),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 30.r,
                        backgroundImage: docotrs[index].gender == 1
                            ? const AssetImage(AppImage.docorboy)
                            : const AssetImage(AppImage.docorgairl),
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      Text(
                        "Dr: ${docotrs[index].name}",
                        style: AppStyle.elMessiriRegular20.copyWith(
                          color: AppColor.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () async {
                          BlocProvider.of<HomeCubit>(context)
                              .addDoctor(context, docotrs[index]);
                        },
                        icon: const Icon(
                          Icons.favorite,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  CustomButton(
                    text: "Details",
                    height: 40.h,
                    onTap: () {
                      Navigator.pushNamed(context, PagePath.kDeatils,
                          arguments: docotrs[index]);
                    },
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(
              height: 20.h,
            );
          },
        );
      },
    );
  }
}
