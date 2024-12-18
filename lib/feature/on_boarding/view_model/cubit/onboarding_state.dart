part of 'onboarding_cubit.dart';

@immutable
sealed class OnboardingState {}

final class OnboardingInitial extends OnboardingState {}

final class OnboardingNextPage extends OnboardingState {}

final class OnboardingChangeIndex extends OnboardingState {}

final class OnboardingSkip extends OnboardingState {}
