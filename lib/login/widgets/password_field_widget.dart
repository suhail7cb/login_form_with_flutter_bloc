import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../login_bloc.dart';

class PasswordInput extends StatelessWidget {
  const PasswordInput({super.key, required this.focusNode});

  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginFormState>(
      builder: (context, state) {
        return TextFormField(
          initialValue: state.password.value,
          focusNode: focusNode,
          decoration: InputDecoration(
            icon: const Icon(Icons.lock),
            helperText:
            '''Password should be at least 8 characters with at least one letter and number''',
            helperMaxLines: 2,
            labelText: 'Password',
            errorMaxLines: 2,
            errorText: state.password.invalid
                ? '''Password must be at least 8 characters and contain at least one letter and number'''
                : null,
          ),
          obscureText: true,
          onChanged: context.read<LoginBloc>().onPasswordChanged,
          textInputAction: TextInputAction.done,
        );
      },
    );
  }
}
