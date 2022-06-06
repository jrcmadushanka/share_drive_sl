import 'package:flutter/material.dart';
import 'package:share_drive_sl/ui/screens/splash_screen.dart';
import 'package:flutter/services.dart';
import 'package:share_drive_sl/utilities/main_model.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  final MainModel _model = MainModel();

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Drive Share SL',
      home: SplashScreen(),
    );
  }
}
