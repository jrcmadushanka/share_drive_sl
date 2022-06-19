import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:share_drive_sl/services/firebase_service.dart';
import 'package:share_drive_sl/ui/screens/splash_screen.dart';
import 'package:flutter/services.dart';
import 'package:share_drive_sl/utilities/main_model.dart';
import 'firebase_options.dart';

GetIt locator = GetIt.instance;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  setupSingletons();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyApp());
  });
}

void setupSingletons() async {
  locator.registerLazySingleton<FirebaseService>(() => FirebaseService());
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
