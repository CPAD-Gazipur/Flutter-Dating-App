part of 'login_cubit.dart';

enum LoginStatus { initial, submitting, success, error }

class LoginState extends Equatable {
  final String email;
  final String password;
  final bool isPasswordVisible;
  final LoginStatus status;
  final auth.User? user;

  bool get isValid => email.isNotEmpty && password.isNotEmpty;

  const LoginState({
    required this.email,
    required this.password,
    this.isPasswordVisible = true,
    required this.status,
    this.user,
  });

  factory LoginState.initial() {
    return const LoginState(
      email: '',
      password: '',
      isPasswordVisible: true,
      status: LoginStatus.initial,
      user: null,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [email, password, isPasswordVisible, status, user];

  LoginState copyWith({
    String? email,
    String? password,
    bool? isPasswordVisible,
    LoginStatus? status,
    auth.User? user,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
      status: status ?? this.status,
      user: user ?? this.user,
    );
  }
}
