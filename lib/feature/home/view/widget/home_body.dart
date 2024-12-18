import 'package:final_task/core/constant/app_color.dart';
import 'package:final_task/core/constant/app_image.dart';
import 'package:final_task/core/constant/app_style.dart';
import 'package:final_task/feature/home/view/widget/custom_doctor.dart';
import 'package:final_task/feature/home/view/widget/custom_specialize.dart';
import 'package:final_task/feature/home/view_model/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 30.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          state is HomeUserNameLoading
                              ? const Center(
                                  child: CircularProgressIndicator(),
                                )
                              : Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Hello",
                                      style: AppStyle.elMessiriRegular16
                                          .copyWith(color: AppColor.gray),
                                    ),
                                    Text(
                                      "Hi ${BlocProvider.of<HomeCubit>(context).user.name}",
                                      style:
                                          AppStyle.elMessiriRegular20.copyWith(
                                        color: AppColor.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                          CircleAvatar(
                            radius: 40.r,
                            backgroundImage:
                                const AssetImage(AppImage.personal),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      SizedBox(
                        height: 70.h,
                        child: TextField(
                          onChanged: (value) {
                            BlocProvider.of<HomeCubit>(context).search(value);
                          },
                          decoration: InputDecoration(
                            enabledBorder: outlineBoarder(),
                            border: outlineBoarder(),
                            focusedBorder: outlineBoarder(),
                            hintText: "search",
                            hintStyle: AppStyle.elMessiriRegular20,
                            suffixIcon: const Icon(Icons.search),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        "specialtize",
                        style: AppStyle.elMessiriBold26,
                      ),
                      SizedBox(height: 10.h),
                      SizedBox(
                        height: 50.h,
                        child: const CustomSpecialize(),
                      ),
                      SizedBox(height: 20.h),
                      Text(
                        "Docotor",
                        style: AppStyle.elMessiriBold26,
                      ),
                      SizedBox(height: 10.h),
                    ],
                  ),
                ),
              ),
            ),
            state is HomeUserSearch
                ? CustomDoctor(
                    docotrs: BlocProvider.of<HomeCubit>(context).listofSearch)
                : CustomDoctor(
                    docotrs: BlocProvider.of<HomeCubit>(context).listofdoctor,
                  ),
            SliverToBoxAdapter(
              child: SizedBox(height: 20.h),
            ),
          ],
        );
      },
    );
  }

  OutlineInputBorder outlineBoarder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(width: 2, color: AppColor.gray),
    );
  }
}
