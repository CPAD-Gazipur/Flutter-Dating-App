import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/models.dart';

part 'swipe_event.dart';
part 'swipe_state.dart';

class SwipeBloc extends Bloc<SwipeEvent, SwipeState> {
  SwipeBloc() : super(SwipeLoading()) {
    on<LoadUsers>(_onLoadUsers);
    on<SwipeLeft>(_onSwipeLeft);
    on<SwipeRight>(_onSwipeRight);
  }

  void _onLoadUsers(LoadUsers event, Emitter<SwipeState> emit) {
    emit(SwipeLoaded(users: event.userID));
  }

  void _onSwipeLeft(SwipeLeft event, Emitter<SwipeState> emit) {
    if (state is SwipeLoaded) {
      try {
        emit(
          SwipeLoaded(
            users: List.from((state as SwipeLoaded).users)..remove(event.user),
          ),
        );
      } on Exception {
        emit(SwipeError());
      }
    }
  }

  void _onSwipeRight(SwipeRight event, Emitter<SwipeState> emit) {
    if (state is SwipeLoaded) {
      try {
        emit(
          SwipeLoaded(
            users: List.from((state as SwipeLoaded).users)..remove(event.user),
          ),
        );
      } on Exception {
        emit(SwipeError());
      }
    }
  }
}
