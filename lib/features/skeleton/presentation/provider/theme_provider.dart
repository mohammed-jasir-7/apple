import 'package:apple/core/plugins/shared_pref_storage.dart';
import 'package:apple/injectable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class ThemeProvider with ChangeNotifier {
  ThemeProvider() {
    // Load the theme mode from shared preferences
    getIt<SharedPrefStorage>().getBool(key: "isDarkMode").then((value) {
      value.fold(
        (l) {
          // Handle failure if needed
        },
        (r) {
          // If value is null, default to light mode
          if (r ) {
            _themeMode = ThemeMode.dark;
          }
          // If value is not null, set the theme mode accordingly
        },
      );

      notifyListeners();
    });
  }
  ThemeMode _themeMode = ThemeMode.light;

  ThemeMode get themeMode => _themeMode;

  void toggleTheme() {
    _themeMode =
        _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    //save the theme mode to shared preferences
    getIt<SharedPrefStorage>().writeBool(
      key: "isDarkMode",
      value: _themeMode == ThemeMode.light ? false : true,
    );
    notifyListeners();
  }
}
