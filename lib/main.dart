import 'package:cleanerapp/providers/cleaner_app_provider.dart';
import 'package:cleanerapp/view/authentication/login/login_view/login_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: getProviders(),
    child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
        
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: LoginView());
  }
}
