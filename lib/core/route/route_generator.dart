import 'package:final_task/core/route/page_path.dart';
import 'package:final_task/feature/auth/reset_password/view/reset_password_view.dart';
import 'package:final_task/feature/auth/sign_in/view/sign_in.dart';
import 'package:final_task/feature/auth/sign_up/view/sign_up.dart';
import 'package:final_task/feature/details/view/details_view.dart';
import 'package:final_task/feature/home/model/docotor_model.dart';
import 'package:final_task/feature/home/view/home_view.dart';
import 'package:final_task/feature/on_boarding/view/on_boarding_view.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic>? route(RouteSettings settings) {
    var arg = settings.arguments;
    switch (settings.name) {
      case PagePath.kOnBoarding:
        return MaterialPageRoute(builder: (_) => const OnBoardingView());
      case PagePath.kSignIn:
        return MaterialPageRoute(builder: (_) => const SignIn());
      case PagePath.kSignUp:
        return MaterialPageRoute(builder: (_) => const SignUp());
      case PagePath.kResetPassword:
        return MaterialPageRoute(builder: (_) => const ResetPasswordView());
      case PagePath.kHome:
        return MaterialPageRoute(builder: (_) => const HomeView());
      case PagePath.kDeatils:
        return MaterialPageRoute(
            builder: (_) => DetailsView(
                  docotorModel: arg as DocotorModel,
                ));
      default:
        return null;
      //return _errorRoute();
    }
  }
}

Route<dynamic> _errorRoute() {
  return MaterialPageRoute(builder: (_) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Error'),
      ),
      body: const Center(
        child: Text('ERROR'),
      ),
    );
  });
}
