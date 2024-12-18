import 'package:final_task/feature/on_boarding/view/widget/on_boarding_body.dart';
import 'package:final_task/feature/on_boarding/view_model/cubit/onboarding_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnboardingCubit(),
      child: const Scaffold(
        body: OnBoardingBody(),
      ),
    );
  }
}
