part of 'onboarding_bloc.dart';

abstract class OnBoardingEvent extends Equatable {
  const OnBoardingEvent();

  @override
  List<Object?> get props => [];
}

class StartOnBoardingEvent extends OnBoardingEvent {
  final User user;

  const StartOnBoardingEvent({
    this.user = const User(
      id: '',
      name: '',
      age: 0,
      gender: '',
      imageUrls: [],
      jobTitle: '',
      interests: [],
      bio: '',
      location: '',
    ),
  });

  @override
  List<Object?> get props => [user];
}

class UpdateUser extends OnBoardingEvent {
  final User user;

  const UpdateUser({required this.user});

  @override
  List<Object?> get props => [user];
}

class UpdateUserImages extends OnBoardingEvent {
  final User? user;
  final XFile image;

  const UpdateUserImages({this.user, required this.image});

  @override
  List<Object?> get props => [user, image];
}
