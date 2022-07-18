import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dating_app/models/models.dart';
import 'package:image_picker/image_picker.dart';

import '../../repositories/repositories.dart';

part 'onboarding_event.dart';
part 'onboarding_state.dart';

class OnBoardingBloc extends Bloc<OnBoardingEvent, OnBoardingState> {
  final DatabaseRepository _databaseRepository;
  final StorageRepository _storageRepository;

  OnBoardingBloc({
    required DatabaseRepository databaseRepository,
    required StorageRepository storageRepository,
  })  : _databaseRepository = databaseRepository,
        _storageRepository = storageRepository,
        super(OnBoardingLoading()) {
    on<StartOnBoardingEvent>(_onStartOnBoardingEvent);
    on<UpdateUser>(_onUpdateUser);
    on<UpdateUserImages>(_onUpdateUserImages);
  }

  void _onStartOnBoardingEvent(
    StartOnBoardingEvent event,
    Emitter<OnBoardingState> emit,
  ) async {
    await _databaseRepository.createUser(event.user);

    emit(OnBoardingLoaded(user: event.user));
  }

  void _onUpdateUser(UpdateUser event, Emitter<OnBoardingState> emit) {
    if (state is OnBoardingLoaded) {
      _databaseRepository.updateUser(event.user);
      emit(OnBoardingLoaded(user: event.user));
    }
  }

  void _onUpdateUserImages(
    UpdateUserImages event,
    Emitter<OnBoardingState> emit,
  ) async {
    if (state is OnBoardingLoaded) {
      User user = (state as OnBoardingLoaded).user;

      await _storageRepository.uploadImage(user, event.image);

      _databaseRepository.getUser(user.id).listen((user) {
        add(UpdateUser(user: user));
      });
    }
  }
}
