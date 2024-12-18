import 'package:final_task/feature/auth/reset_password/view/widget/reset_password_body.dart';
import 'package:final_task/feature/auth/reset_password/view_model/cubit/resetpassword_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ResetpasswordCubit(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
        ),
        body: const ResetPasswordBody(),
      ),
    );
  }
}
