import 'package:bloc/bloc.dart';
import 'package:final_task/core/constant/on_boardin_list.dart';
import 'package:final_task/core/route/page_path.dart';
import 'package:final_task/feature/on_boarding/model/on_boarding_model.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingInitial());

  PageController controller = PageController();
  int currentIndex = 0;
  int lenght = konbaordinglist.length;
  void changeIndex(int index) {
    currentIndex = index;
    emit(OnboardingChangeIndex());
  }

  void skip(BuildContext context) {
    Navigator.pushReplacementNamed(context, PagePath.kSignIn);
    emit(OnboardingSkip());
  }

  void nextPage(BuildContext context) {
    if (currentIndex == lenght - 1) {
      skip(context);
    } else {
      currentIndex += 1;
      controller.animateToPage(currentIndex,
          duration: const Duration(milliseconds: 250), curve: Curves.easeInOut);
      emit(OnboardingNextPage());
    }
  }

  OnBoardingModel currentOnBoarding() {
    return konbaordinglist[currentIndex];
  }

  bool isLastPage() {
    if (currentIndex == lenght - 1) {
      return true;
    } else {
      return false;
    }
  }
}
