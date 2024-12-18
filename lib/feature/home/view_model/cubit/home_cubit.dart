import 'package:bloc/bloc.dart';
import 'package:final_task/core/constant/specialize_list.dart';
import 'package:final_task/core/function/snakbar.dart';
import 'package:final_task/core/service/firebase.dart';
import 'package:final_task/feature/home/model/docotor_model.dart';
import 'package:final_task/feature/home/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(BuildContext contxet) : super(HomeInitial()) {
    getUserName(contxet);
  }

  int index = -1;
  late UserModel user;
  List<DocotorModel> listofdoctor = [];
  List<DocotorModel> listofSearch = [];
  List<DocotorModel> listofFavoirt = [];

  Future<void> getUserName(BuildContext context) async {
    emit(HomeUserNameLoading());
    await AppFirebase.getNameUser(
            FirebaseAuth.instance.currentUser?.email ?? "error@gmail.com")
        .then((value) {
      value.fold((ifLeft) {
        showSnakBar(context, ifLeft);
        emit(HomeUserNameFailing());
      }, (ifRight) {
        user = ifRight;
        emit(HomeUserNameSuccess());
      });
    });
  }

  selectCategory(BuildContext context, int i) {
    index = i;
    getDocotorData(context, index);
    emit(HomeUserChangeCategory());
  }

  Future<void> getDocotorData(BuildContext context, int i) async {
    emit(HomeUserGetDoctorLoading());
    await AppFirebase.getDoctors(kSpecializeList[i]).then((value) {
      value.fold((ifLeft) {
        showSnakBar(context, ifLeft);
        emit(HomeUserGetDoctorFailing());
      }, (ifRight) {
        listofdoctor = ifRight;
        emit(HomeUserGetDoctorSuccess());
      });
    });
  }

  void search(String? value) {
    if (value == null) {
      emit(HomeUserNoSearch());
    } else {
      listofSearch =
          listofdoctor.where((doc) => doc.name.contains(value)).toList();
      emit(HomeUserSearch());
    }
  }

  Future<void> addDoctor(BuildContext context, DocotorModel doctor) async {
    getFavoriteDocotor(context);
    List<DocotorModel>? test = listofFavoirt
        .where((element) => element.email == doctor.email)
        .toList();
    if (test == null || test.isEmpty) {
      AppFirebase.addFavorite(user.id, doctor.toMap()).then((onValue) {
        onValue.fold((ifLeft) {
          showSnakBar(context, ifLeft);
          emit(HomeUserAddFavorireFails());
        }, (ifRight) {
          showSnakBar(context, ifRight);
          emit(HomeUserAddFavorireSuccess());
        });
      });
    } else {
      showSnakBar(context, "this doctor add already");
    }
  }

  Future<void> getFavoriteDocotor(BuildContext context) async {
    emit(HomeUserGetFavoirteDataLoading());
    await AppFirebase.getFavoriteDoctor(user.id).then((onValue) {
      onValue.fold((ifLeft) {
        showSnakBar(context, ifLeft);
        emit(HomeUserGetFavoirteDataFails());
      }, (ifRight) {
        listofFavoirt = ifRight;
        emit(HomeUserGetFavoirteDataSuccess());
      });
    });
  }

  Future<void> deleteDoctor(BuildContext context, DocotorModel doctor) async {
    await AppFirebase.deleteFavoriteDoctor(user.id, doctor).then((onValue) {
      onValue.fold((ifLeft) {
        showSnakBar(context, ifLeft);
        emit(HomeUserDeletFavoirteDataFails());
      }, (ifRight) {
        showSnakBar(context, "success");
        getFavoriteDocotor(context);
        emit(HomeUserDeletFavoirteDataSuccess());
      });
    });
  }
}
