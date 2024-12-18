import 'package:final_task/core/constant/app_color.dart';
import 'package:final_task/core/constant/app_image.dart';
import 'package:final_task/core/constant/app_style.dart';
import 'package:final_task/feature/on_boarding/model/on_boarding_model.dart';
import 'package:final_task/feature/on_boarding/view/widget/dotted_indicator.dart';
import 'package:final_task/feature/on_boarding/view_model/cubit/onboarding_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomOnBoardingPage extends StatelessWidget {
  const CustomOnBoardingPage({
    super.key,
    required this.onboarding,
  });
  final OnBoardingModel onboarding;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingCubit, OnboardingState>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.7,
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      left: 0,
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          maxHeight: MediaQuery.of(context).size.height * 0.38,
                        ),
                        child: SvgPicture.asset(
                          onboarding.shape,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Positioned(
                      left:
                          BlocProvider.of<OnboardingCubit>(context).isLastPage()
                              ? null
                              : 25.w,
                      right:
                          BlocProvider.of<OnboardingCubit>(context).isLastPage()
                              ? 25.w
                              : null,
                      top: 130.h,
                      child: SizedBox(
                        height: 135.h,
                        width: 233.h,
                        child: SvgPicture.asset(
                          BlocProvider.of<OnboardingCubit>(context).isLastPage()
                              ? AppImage.kShapeOnBoardingText3
                              : AppImage.kShapeOnBoardingText,
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      left: 0,
                      child: SizedBox(
                        height: 345.h,
                        child: SvgPicture.asset(onboarding.icon),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40.h),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    onboarding.title,
                    style: AppStyle.elMessiriBold26,
                  ),
                  SizedBox(height: 10.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.h),
                    child: Text(
                      onboarding.subtitle,
                      style: AppStyle.elMessiriRegular16,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        BlocProvider.of<OnboardingCubit>(context).skip(context);
                      },
                      child: Text(
                        "skip",
                        style: AppStyle.elMessiriRegular20,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.2,
                      child: DottedIndicator(
                          index: BlocProvider.of<OnboardingCubit>(context)
                              .currentIndex),
                    ),
                    InkWell(
                      onTap: () {
                        BlocProvider.of<OnboardingCubit>(context)
                            .nextPage(context);
                      },
                      child: Container(
                        height: 39.h,
                        width: 81.w,
                        decoration: BoxDecoration(
                          color: AppColor.blue,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Text(
                            'Next',
                            style: AppStyle.elMessiriBold15,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30.h,
              )
            ],
          ),
        );
      },
    );
  }
}
