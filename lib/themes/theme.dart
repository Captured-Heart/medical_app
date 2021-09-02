import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;

  bool get isDarkMode {
    if (themeMode == ThemeMode.system) {
      final brightness = SchedulerBinding.instance!.window.platformBrightness;
      return brightness == Brightness.light;
    } else {
      return themeMode == ThemeMode.light;
    }
  }

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.light : ThemeMode.dark;
    notifyListeners();
  }
}

class MyTheme {
  TextTheme _darkTextTheme(TextTheme base) {
    return base.copyWith(
      headline1: base.headline1!.copyWith(
        fontSize: 22.0,
        color: Color(0xffffffff),
      ),
      headline2: base.headline2!.copyWith(
        fontWeight: FontWeight.w500,
        fontSize: 9.0,
        color: Color(0xffffffff),
      ),
      headline3: base.headline3!.copyWith(
        fontWeight: FontWeight.w500,
        fontSize: 9.0,
        color: Color(0xff272c3a),
      ),
    );
  }

  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Color(0xff1c1f2a),
    primaryColor: Color(0xff272c3a),
    colorScheme: ColorScheme.dark(),
    iconTheme: IconThemeData(color: Color(0xff58A4EB), opacity: 0.8),
    buttonColor: Color(0xff58a4eb),
    highlightColor: Color(0xffffffff),
    accentColor: Color(0xffffffff),
    canvasColor: Color(0xff858585),
    textSelectionTheme: TextSelectionThemeData(
      selectionColor: Color(0xff58A4EB),
      selectionHandleColor: Color(0xff58A4EB),
      cursorColor: Color(0xff58A4EB),
    ),
  );

  //LIGHT MODE
  TextTheme _lightTextTheme(TextTheme base) {
    return base.copyWith(
      headline1: base.headline1!.copyWith(
        fontSize: 22.0,
        color: Colors.black,
      ),
      headline2: base.headline2!.copyWith(
        fontWeight: FontWeight.w500,
        fontSize: 9.0,
        color: Color(0xff3d3d3d),
      ),
      headline3: base.headline3!.copyWith(
        fontWeight: FontWeight.w500,
        fontSize: 9.0,
        color: Color(0xffffffff),
      ),
    );
  }

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Color(0xfff3f3f3),
    highlightColor: Color(0xff3D3D3D),
    primaryColor: Colors.white,
    colorScheme: ColorScheme.light(),
    iconTheme: IconThemeData(color: Color(0xff58A4EB), opacity: 0.8),
    buttonColor: Color(0xff58A4EB),
    accentColor: Color(0xff858585),
    canvasColor: Color(0xff858585),
    textSelectionTheme: TextSelectionThemeData(
      selectionColor: Color(0xff58A4EB),
      selectionHandleColor: Color(0xff58A4EB),
      cursorColor: Color(0xff58A4EB),
    ),
  );
}

//

// TextTheme _customTextTheme(TextTheme base) {
//   return base.copyWith(
//     headline1: base.headline1!.copyWith(
//       fontSize: 22.0,
//       color: Colors.black,
//     ),
//     headline2: base.headline2!.copyWith(
//       fontWeight: FontWeight.w500,
//       fontSize: 9.0,
//       color: Color(0xff3d3d3d),
//     ),
//     headline3: base.headline3!.copyWith(
//       fontWeight: FontWeight.w500,
//       fontSize: 9.0,
//       color: Color(0xffffffff),
//     ),
//   );
// }

// ThemeData _customLightTheme() {
//   final ThemeData base = ThemeData.light();
//   return ThemeData(
//     scaffoldBackgroundColor: Color(0xffdbdbdb),
//     textSelectionTheme: TextSelectionThemeData(
//       selectionColor: const Color(0xFFFEDBD0),
//     ),
//     textTheme: _customTextTheme(base.textTheme),
//     primaryTextTheme: _customTextTheme(base.primaryTextTheme),
//     accentTextTheme: _customTextTheme(base.accentTextTheme),
//   );
// }

// TextTheme _customDarkTextTheme(TextTheme base) {
//   return base.copyWith(
//     headline1: base.headline1!.copyWith(
//       fontSize: 22.0,
//       color: Color(0xffffffff),
//     ),
//     headline2: base.headline2!.copyWith(
//       fontWeight: FontWeight.w500,
//       fontSize: 9.0,
//       color: Color(0xffffffff),
//     ),
//     headline3: base.headline3!.copyWith(
//       fontWeight: FontWeight.w500,
//       fontSize: 9.0,
//       color: Color(0xff272c3a),
//     ),
//   );
// }

// ThemeData _darkCustomTheme() {
//   final ThemeData baseDark = ThemeData.dark();
//   return ThemeData(
//     scaffoldBackgroundColor: Color(0xff1c1f2a),
//     // cardColor: const Color(0xFF883B2D),
//     textSelectionTheme: TextSelectionThemeData(
//       selectionColor: const Color(0xFFFEDBD0),
//     ),

//     textTheme: _customDarkTextTheme(baseDark.textTheme),
//     primaryTextTheme: _customDarkTextTheme(baseDark.primaryTextTheme),
//     accentTextTheme: _customDarkTextTheme(baseDark.accentTextTheme),
//   );
// }
