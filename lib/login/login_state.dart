part of 'login_bloc.dart';

class LoginFormState extends Equatable {
  const LoginFormState({
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.status = FormzStatus.pure,
  });

  final Email email;
  final Password password;
  final FormzStatus status;

  LoginFormState copyWith({
    Email? email,
    Password? password,
    FormzStatus? status,
  }) {
    return LoginFormState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [email, password, status];
}