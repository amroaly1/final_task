part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeUserNameLoading extends HomeState {}

final class HomeUserNameSuccess extends HomeState {}

final class HomeUserNameFailing extends HomeState {}

final class HomeUserChangeCategory extends HomeState {}

final class HomeUserGetDoctorLoading extends HomeState {}

final class HomeUserGetDoctorSuccess extends HomeState {}

final class HomeUserGetDoctorFailing extends HomeState {}

final class HomeUserNoSearch extends HomeState {}

final class HomeUserSearch extends HomeState {}

final class HomeUserAddFavorireSuccess extends HomeState {}

final class HomeUserAddFavorireFails extends HomeState {}

final class HomeUserGetFavoirteDataLoading extends HomeState {}

final class HomeUserGetFavoirteDataSuccess extends HomeState {}

final class HomeUserGetFavoirteDataFails extends HomeState {}

final class HomeUserDeletFavoirteDataFails extends HomeState {}

final class HomeUserDeletFavoirteDataSuccess extends HomeState {}
