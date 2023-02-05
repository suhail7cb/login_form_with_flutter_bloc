import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../login_bloc.dart';

class EmailInput extends StatelessWidget {
  const EmailInput({super.key, required this.focusNode});

  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginFormState>(
      builder: (context, state) {
        return TextFormField(
          initialValue: state.email.value,
          focusNode: focusNode,
          decoration: InputDecoration(
            icon: const Icon(Icons.email),
            labelText: 'Email',
            helperText: 'A complete, valid email e.g. joe@gmail.com',
            errorText: state.email.invalid
                ? 'Please ensure the email entered is valid'
                : null,
          ),
          keyboardType: TextInputType.emailAddress,
          onChanged: context.read<LoginBloc>().onEmailChanged,
          textInputAction: TextInputAction.next,
        );
      },
    );
  }
}