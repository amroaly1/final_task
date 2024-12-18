import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:final_task/core/function/snakbar.dart';
import 'package:final_task/core/helper/app_regexp.dart';
import 'package:final_task/core/route/page_path.dart';
import 'package:final_task/core/service/firebase.dart';
import 'package:final_task/feature/auth/sign_in/model/sign_in_model.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'signin_state.dart';

class SigninCubit extends Cubit<SigninState> {
  SigninCubit() : super(SigninInitial());
  final globalKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  bool hidePassword = true;
  IconData passwordIcon = Icons.visibility_off;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String? validatorEmail(String? email) {
    if (email == null || email.isEmpty) {
      return "field is empty";
    } else if (!AppRegex.isEmailValid(email)) {
      return "Email is not valid";
    } else {
      return null;
    }
  }

  String? validatorPassword(String? password) {
    if (password == null || password.isEmpty) {
      return "field is empty";
    } else if (!AppRegex.isPasswordValid(password)) {
      return "password should contain capital character and\n small character and special character";
    } else {
      return null;
    }
  }

  void onPressIconPassword() {
    if (hidePassword) {
      hidePassword = !hidePassword;
      passwordIcon = Icons.visibility;
      emit(SigninShowPassowrd());
    } else {
      hidePassword = !hidePassword;
      passwordIcon = Icons.visibility_off;
      emit(SigninHidePassowrd());
    }
  }

  Future<void> onTapSignIn(BuildContext context) async {
    log('loding');

    emit(SigninLoding());

    if (globalKey.currentState!.validate()) {
      SignInModel signin = SignInModel(
          email: emailController.text, password: passwordController.text);

      AppFirebase.signIn(signin).then((value) {
        value.fold((ifLeft) {
          showSnakBar(context, ifLeft);
          emit(SigninError(errMessage: ifLeft));
        }, (ifRight) {
          showSnakBar(context, "Success");
          Navigator.pushReplacementNamed(context, PagePath.kHome);
          emit(SigninSuccess());
        });
      });
    } else {
      autovalidateMode = AutovalidateMode.always;
      log('unvalidate');
      emit(SigninFails());
    }
  }
}
