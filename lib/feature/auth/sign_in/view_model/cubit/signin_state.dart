part of 'signin_cubit.dart';

@immutable
sealed class SigninState {}

final class SigninInitial extends SigninState {}

final class SigninShowPassowrd extends SigninState {}

final class SigninHidePassowrd extends SigninState {}

final class SigninLoding extends SigninState {}

final class SigninSuccess extends SigninState {}

final class SigninFails extends SigninState {}

final class SigninError extends SigninState {
  final String errMessage;

  SigninError({required this.errMessage});
}
