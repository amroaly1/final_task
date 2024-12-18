import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:final_task/core/constant/firebase_constant.dart';
import 'package:final_task/core/function/snakbar.dart';
import 'package:final_task/core/helper/app_regexp.dart';
import 'package:final_task/core/route/page_path.dart';
import 'package:final_task/core/service/firebase.dart';
import 'package:final_task/feature/auth/sign_up/model/sing_up_model.dart';

import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

// import 'package:project/core/function/snakbar.dart';
// import 'package:project/core/helper/app_regexp.dart';
// import 'package:project/core/route/page_path.dart';
// // import 'package:project/core/service/firebase.dart';
// import 'package:project/feature/auth/sign_up/model/sing_up_model.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitial());
  final globalKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  bool hidePassword = true;
  IconData passwordIcon = Icons.visibility_off;
  bool hideConfirmPassword = true;
  IconData confirmPasswordIcon = Icons.visibility_off;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  String? validatorName(String? name) {
    if (name == null || name.isEmpty) {
      return "name is empty";
    } else {
      return null;
    }
  }

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

  String? validatorConfirmPassword(String? password) {
    if (password == null || password.isEmpty) {
      return "field is empty";
    } else if (!AppRegex.isPasswordValid(password)) {
      return "password should contain capital character and\n small character and special character";
    } else if (passwordController.text != password) {
      return "Confirm Password is not Match with password";
    } else {
      log("${passwordController.text}");
      return null;
    }
  }

  void onPressIconPassword() {
    if (hidePassword) {
      hidePassword = !hidePassword;
      passwordIcon = Icons.visibility;
      emit(SignupShowPassword());
    } else {
      hidePassword = !hidePassword;
      passwordIcon = Icons.visibility_off;
      emit(SignupHidePassword());
    }
  }

  void onPressIconConfirmPassword() {
    if (hideConfirmPassword) {
      hideConfirmPassword = !hideConfirmPassword;
      confirmPasswordIcon = Icons.visibility;
      emit(SignupShowConfirmPassword());
    } else {
      hideConfirmPassword = !hideConfirmPassword;
      confirmPasswordIcon = Icons.visibility_off;
      emit(SignupHideConfirmPassword());
    }
  }

  Future<void> onTapSignUp(BuildContext context) async {
    emit(SignupLoding());

    if (globalKey.currentState!.validate()) {
      SingUpModel singUpModel = SingUpModel(
          name: nameController.text,
          email: emailController.text,
          password: passwordController.text);

      AppFirebase.signUp(singUpModel).then(
        (value) {
          value.fold((ifLeft) {
            showSnakBar(context, ifLeft);
            emit(SignupError(errMessage: ifLeft));
          }, (ifRight) {
            showSnakBar(context, "Go to verify Your Email");
            AppFirebase.addData(FirebaseConstant.usersCollection, {
              FirebaseConstant.usersId: emailController.text,
              FirebaseConstant.usersName: nameController.text,
            });
            emit(SignupSuccess());
            Navigator.pushReplacementNamed(context, PagePath.kSignIn);
          });
        },
      );
    } else {
      autovalidateMode = AutovalidateMode.always;
      log('unvalidate');
      emit(SignupFails());
    }
  }
}
