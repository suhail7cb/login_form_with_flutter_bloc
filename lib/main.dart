import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login/login_page.dart';
import 'theme_switcher/theme_switcher_cubit.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ThemeSwitcherCubit>(
      create: (context) => ThemeSwitcherCubit(),
      child: BlocBuilder<ThemeSwitcherCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Flutter Demo',
            themeMode: state.theme,
            darkTheme: ThemeData.dark(),
            theme: ThemeData.light(),
            home: const LoginPage(),
          );
        },
      ),
    );
  }
}