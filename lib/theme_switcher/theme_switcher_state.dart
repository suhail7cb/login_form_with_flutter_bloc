part of 'theme_switcher_cubit.dart';

@immutable
abstract class ThemeState {
  late ThemeMode theme;
}

class InitialThemeState extends ThemeState {
  InitialThemeState() {
    theme = ThemeMode.dark;
  }
}

class LightThemeState extends ThemeState {
  LightThemeState() {
    theme = ThemeMode.light;
  }
}

class DarkThemeState extends ThemeState {
  DarkThemeState() {
    theme = ThemeMode.dark;
  }
}


