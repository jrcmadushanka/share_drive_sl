import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:share_drive_sl/ui/screen/splash_screen.dart';
import 'package:share_drive_sl/utilities/custom_resources.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
        light: ThemeData(
          brightness: Brightness.light,
          primarySwatch: const MaterialColor(1, CustomResource.primaryColorMid),
          primaryColor: const MaterialColor(1, CustomResource.primaryColorMid),
          primaryColorDark: const MaterialColor(1, CustomResource.primaryColorDark),
          primaryColorLight: const MaterialColor(1, CustomResource.primaryColorSoft),
        ),
        dark: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: const MaterialColor(1, CustomResource.darkPrimaryColorMid),
          primaryColor: const MaterialColor(1, CustomResource.darkPrimaryColorMid),
          primaryColorDark: const MaterialColor(1, CustomResource.darkPrimaryColorDark),
          primaryColorLight: const MaterialColor(1, CustomResource.darkPrimaryColorSoft),
        ),
        initial: AdaptiveThemeMode.system,
        builder: (theme, darkTheme) => MaterialApp(
              title: 'Drive Share SL',
              theme: theme,
              darkTheme: darkTheme,
              home: const SplashScreen(),
            ));
  }
}
