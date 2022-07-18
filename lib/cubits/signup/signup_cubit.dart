import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repositories/repositories.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final AuthRepository _authRepository;

  SignupCubit({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(SignupState.initial());

  void emailChanged(String value) {
    emit(state.copyWith(
      email: value,
      status: SignupStatus.initial,
    ));
  }

  void passwordChanged(String value) {
    emit(state.copyWith(
      password: value,
      status: SignupStatus.initial,
    ));
  }

  Future<void> signupWithCredentials() async {
    if (!state.isValid || state.status == SignupStatus.submitting) return;
    emit(state.copyWith(status: SignupStatus.submitting));
    try {
      var user = await _authRepository.signUp(
        email: state.email,
        password: state.password,
      );
      emit(
        state.copyWith(
          status: SignupStatus.success,
          user: user,
        ),
      );
    } catch (_) {}
  }
}
