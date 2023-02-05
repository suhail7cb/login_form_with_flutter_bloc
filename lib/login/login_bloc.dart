import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'models/email_model.dart';
import 'models/password_model.dart';
part 'login_state.dart';

class LoginBloc extends Cubit<LoginFormState> {
  LoginBloc() : super(const LoginFormState());

  void onEmailChanged(String value) {
    final email = Email.dirty(value);
    emit(
      state.copyWith(
        email: email.valid ? email : Email.pure(value),
        status: Formz.validate([email, state.password]),
      ),
    );
  }


  void onPasswordChanged(String value) {
    final password = Password.dirty(value);
    emit(
      state.copyWith(
        password: password.valid ? password : Password.pure(value),
        status: Formz.validate([state.email, password]),
      ),
    );
  }

  void onEmailUnfocused() {
    final email = Email.dirty(state.email.value);
    emit(
      state.copyWith(
        email: email,
        status: Formz.validate([email, state.password]),
      ),
    );
  }

  void onPasswordUnfocused() {
    final password = Password.dirty(state.password.value);
    emit(
      state.copyWith(
        password: password,
        status: Formz.validate([state.email, password]),
      ),
    );
  }

  Future<void> submitForm() async {
    final email = Email.dirty(state.email.value);
    final password = Password.dirty(state.password.value);
    emit(
      state.copyWith(
        email: email,
        password: password,
        status: Formz.validate([email, password]),
      ),
    );
    if (state.status.isValidated) {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      await Future<void>.delayed(const Duration(seconds: 1));
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    }
  }
}