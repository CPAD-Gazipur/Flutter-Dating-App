import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

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

  void signupWithCredentials() async {
    if (!state.isValid) {
      return;
    }
    try {
      await _authRepository.signUp(
        email: state.email,
        password: state.password,
      );

      emit(
        state.copyWith(
          status: SignupStatus.success,
        ),
      );
    } catch (_) {}
  }
}
