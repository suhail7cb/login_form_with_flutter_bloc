import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'theme_switcher_state.dart';

class ThemeSwitcherCubit extends Cubit<ThemeState> {
  ThemeSwitcherCubit() : super(InitialThemeState());

  void switchTheme(){
    if(state.theme == ThemeMode.light){
      emit(DarkThemeState());
    }
    else {
      emit(LightThemeState());
    }
  }
}
