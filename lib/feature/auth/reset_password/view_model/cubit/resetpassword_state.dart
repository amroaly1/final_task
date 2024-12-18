part of 'resetpassword_cubit.dart';

@immutable
sealed class ResetpasswordState {}

final class ResetpasswordInitial extends ResetpasswordState {}

final class ResetpasswordSuccess extends ResetpasswordState {}

final class ResetpasswordFails extends ResetpasswordState {}

final class ResetpasswordError extends ResetpasswordState {}

final class ResetpasswordLoading extends ResetpasswordState {}
