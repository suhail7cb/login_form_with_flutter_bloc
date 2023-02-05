import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import '../login_bloc.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginFormState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return ElevatedButton(
          // onPressed: null,
          onPressed:  state.status.isValid
              ? () => context.read<LoginBloc>().submitForm
              : null,
          child: const Text('Submit'),
        );
      },
    );
  }
}

