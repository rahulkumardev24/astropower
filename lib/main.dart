import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_astro/screen/dashboard_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.pinkAccent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
      child: MaterialApp(
        title: 'Fact fuel',
        debugShowCheckedModeBanner: false,
        home: DashboardScreen(),
      ),
    );
  }
}
