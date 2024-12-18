import 'package:bloc/bloc.dart';
import 'package:final_task/core/function/snakbar.dart';
import 'package:final_task/core/helper/app_regexp.dart';
import 'package:final_task/core/route/page_path.dart';
import 'package:final_task/core/service/firebase.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'resetpassword_state.dart';

class ResetpasswordCubit extends Cubit<ResetpasswordState> {
  ResetpasswordCubit() : super(ResetpasswordInitial());

  final globalKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  TextEditingController emailController = TextEditingController();
  String? validatorEmail(String? email) {
    if (email == null || email.isEmpty) {
      return "feild is empty";
    } else if (!AppRegex.isEmailValid(email)) {
      return "Email is not valid";
    } else {
      return null;
    }
  }

  Future<void> ontap(BuildContext context) async {
    emit(ResetpasswordLoading());
    if (globalKey.currentState!.validate()) {
      AppFirebase.resetPassword(emailController.text).then((value) {
        value.fold((ifLeft) {
          showSnakBar(context, ifLeft);
          emit(ResetpasswordError());
        }, (ifRight) {
          showSnakBar(context, 'Go to email to rest password');
          Navigator.pushReplacementNamed(context, PagePath.kSignIn);
          emit(ResetpasswordSuccess());
        });
      });
    } else {
      autovalidateMode = AutovalidateMode.always;
      emit(ResetpasswordFails());
    }
  }
}
