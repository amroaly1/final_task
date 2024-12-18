import 'package:final_task/core/constant/app_image.dart';
import 'package:final_task/feature/on_boarding/model/on_boarding_model.dart';

List<OnBoardingModel> konbaordinglist = [
  OnBoardingModel(
      shape: AppImage.kShapeOnBoarding1,
      icon: AppImage.kIconOnBoarding1,
      title: "Find Your Doctor",
      subtitle:
          "Discover experienced doctors in your area and book appointments with ease. Your health is now just a tap away!"),
  OnBoardingModel(
      shape: AppImage.kShapeOnBoarding2,
      icon: AppImage.kIconOnBoarding2,
      title: "Manage Appointments",
      subtitle:
          "Keep track of all your appointments and health records in one place. Convenient and accessible, whenever you need it!"),
  OnBoardingModel(
      shape: AppImage.kShapeOnBoarding3,
      icon: AppImage.kIconOnBoarding3,
      title: "Teleconsultation Available",
      subtitle:
          "Connect with doctors online for consultations from the comfort of your home. Health advice made simple and fast!"),
];
