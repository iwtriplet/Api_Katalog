import 'package:flutter/material.dart';
import 'package:flutter_ecatalog/themes/app_colors_extension.dart';

import 'app_text_theme_extension.dart';
import 'app_typography.dart';

class AppTheme {
  static final _lightAppColors = AppColorsExtension(
    primary: const Color(0xff6200ee),
    onPrimary: Colors.white,
    secondary: const Color(0xff03dac6),
    onSecondary: Colors.black,
    error: const Color(0xffb00020),
    onError: Colors.white,
    background: Colors.white,
    onBackground: Colors.black,
    surface: Colors.white,
    onSurface: Colors.black,
  );

  static final _lightTextTheme = SimpleAppTextThemeExtension(
    body1: AppTypography.body1.copyWith(color: _lightAppColors.onBackground),
    h1: AppTypography.h1.copyWith(color: Colors.black),
  );

  static final _darkAppColors = AppColorsExtension(
    primary: Color.fromARGB(255, 144, 144, 234),
    onPrimary: Colors.black,
    secondary: const Color(0xff03dac6),
    onSecondary: Colors.black,
    error: const Color(0xffcf6679),
    onError: Colors.black,
    background: const Color(0xff121212),
    onBackground: Colors.white,
    surface: const Color(0xff121212),
    onSurface: Colors.white,
  );

  static final _darkTextTheme = SimpleAppTextThemeExtension(
    body1: AppTypography.body1.copyWith(color: _darkAppColors.onBackground),
    h1: AppTypography.h1.copyWith(color: Colors.white),
  );

  static final light = () {
    final defaultTheme = ThemeData.light();

    return defaultTheme.copyWith(
      textTheme: defaultTheme.textTheme.copyWith(
        // Default text style for Text widget.
        bodyMedium: AppTypography.body1.copyWith(color: Colors.black),
      ),
      extensions: [
        _lightAppColors,
        _lightTextTheme,
      ],
    );
  }();

  static final dark = () {
    final defaultTheme = ThemeData.dark();

    return defaultTheme.copyWith(
      textTheme: defaultTheme.textTheme.copyWith(
        // Default text style for Text widget.
        bodyMedium: AppTypography.body1.copyWith(color: Colors.white),
      ),
      extensions: [
        _darkAppColors,
        _darkTextTheme,
      ],
    );
  }();
}

/// Here you should define getters for your `ThemeExtension`s.
///
/// Never use `Theme.of(context).extension<MyColors>()!`
/// how they do it in the [official documentation](https://api.flutter.dev/flutter/material/ThemeExtension-class.html),
/// because it's not safe. Always create a getter for your `ThemeExtension` and use it instead.
///
/// Usage example: `Theme.of(context).appColors`.
extension AppThemeExtension on ThemeData {
  AppColorsExtension get appColors =>
      extension<AppColorsExtension>() ?? AppTheme._lightAppColors;

  SimpleAppTextThemeExtension get appTextTheme =>
      extension<SimpleAppTextThemeExtension>() ?? AppTheme._lightTextTheme;
}

/// A more convenient way to get `ThemeData` from the `BuildContext`.
///
/// Usage example: `context.theme`.
extension ThemeGetter on BuildContext {
  ThemeData get theme => Theme.of(this);
}
