import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_form_with_flutter_bloc/login/widgets/email_field_widget.dart';
import 'package:login_form_with_flutter_bloc/login/widgets/password_field_widget.dart';
import 'package:login_form_with_flutter_bloc/login/widgets/submit_login_form_Widget.dart';
import '../theme_switcher/theme_switcher_cubit.dart';
import 'login_bloc.dart';

// part '../login/widgets/submit_login_form_Widget.dart';


class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Login Here'),
          actions: [
            IconButton(onPressed: (){
              BlocProvider.of<ThemeSwitcherCubit>(context).switchTheme();
            },
                icon: const Icon(Icons.brightness_6))
          ],
        ),
      body: BlocProvider<LoginBloc>(
        create: (context) => LoginBloc(),
        child: const _LoginUI(),
      ),
    );
  }
}

class _LoginUI extends StatefulWidget {
  const _LoginUI({Key? key}) : super(key: key);

  @override
  State<_LoginUI> createState() => _LoginUIState();
}

class _LoginUIState extends State<_LoginUI> {
  final _emailFocusNode = FocusNode();

  final _passwordFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _emailFocusNode.addListener(() {
      if (!_emailFocusNode.hasFocus) {
        context.read<LoginBloc>().onEmailUnfocused();
        FocusScope.of(context).requestFocus(_passwordFocusNode);
      }
    });
    _passwordFocusNode.addListener(() {
      if (!_passwordFocusNode.hasFocus) {
        context.read<LoginBloc>().onPasswordUnfocused();
      }
    });
  }

  @override
  void dispose() {
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        EmailInput(focusNode: _emailFocusNode,),
        PasswordInput(focusNode: _passwordFocusNode),
        const SubmitButton()
      ],
    );
  }
}