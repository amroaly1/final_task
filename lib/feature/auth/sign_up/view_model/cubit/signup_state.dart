part of 'signup_cubit.dart';

@immutable
sealed class SignupState {}

final class SignupInitial extends SignupState {}

final class SignupShowPassword extends SignupState {}

final class SignupHidePassword extends SignupState {}

final class SignupShowConfirmPassword extends SignupState {}

final class SignupHideConfirmPassword extends SignupState {}

final class SignupLoding extends SignupState {}

final class SignupSuccess extends SignupState {}

final class SignupFails extends SignupState {}

final class SignupError extends SignupState {
  final String errMessage;

  SignupError({required this.errMessage});
}
