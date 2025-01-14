import 'package:flutter/material.dart';
import 'package:todo_task/layout/home_layout.dart';
import 'package:todo_task/shared/styles/theming.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeLayout.routeName,
      routes: {
        HomeLayout.routeName: (_) => HomeLayout(),
      },
      themeMode: ThemeMode.light,
      theme: AppTheme.lightTheme,
    );
  }
}
