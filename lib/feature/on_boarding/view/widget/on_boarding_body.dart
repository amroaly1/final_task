import 'dart:developer';

import 'package:final_task/feature/on_boarding/view/widget/custom_on_baording_page.dart';
import 'package:final_task/feature/on_boarding/view_model/cubit/onboarding_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnBoardingBody extends StatelessWidget {
  const OnBoardingBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingCubit, OnboardingState>(
      builder: (context, state) {
        return PageView.builder(
          itemCount: BlocProvider.of<OnboardingCubit>(context).lenght,
          controller: BlocProvider.of<OnboardingCubit>(context).controller,
          onPageChanged: (value) {
            log('$value');
            BlocProvider.of<OnboardingCubit>(context).changeIndex(value);
          },
          itemBuilder: (BuildContext context, index) {
            return SafeArea(
              child: CustomOnBoardingPage(
                onboarding: BlocProvider.of<OnboardingCubit>(context)
                    .currentOnBoarding(),
              ),
            );
          },
        );
      },
    );
  }
}
