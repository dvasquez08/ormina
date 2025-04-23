import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ormina/screens/summary_detail_screen.dart';
import 'package:ormina/screens/upload_screen.dart';
import 'screens/login_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Ormina',
        theme: ThemeData(primarySwatch: Colors.deepPurple),
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const LoginScreen(),
          '/upload': (context) => const UploadScreen(),
          '/summary': (context) => const SummaryDetailScreen(summary: '')
        });
  }
}
