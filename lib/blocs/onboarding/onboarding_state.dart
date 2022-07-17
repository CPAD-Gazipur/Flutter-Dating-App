part of 'onboarding_bloc.dart';

abstract class OnBoardingState extends Equatable {
  const OnBoardingState();

  @override
  List<Object> get props => [];
}

class OnBoardingLoading extends OnBoardingState {}

class OnBoardingLoaded extends OnBoardingState {
  final User user;

  const OnBoardingLoaded({required this.user});

  @override
  List<Object> get props => [user];
}
