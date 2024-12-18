import 'package:final_task/feature/auth/sign_up/view/widget/body_sign_up.dart';
import 'package:final_task/feature/auth/sign_up/view_model/cubit/signup_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(),
      child: const Scaffold(
        body: BodySignUP(),
      ),
    );
  }
}
