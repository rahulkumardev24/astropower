import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_astro/screen/chat_screen.dart';
import 'package:my_astro/screen/home_screen.dart';
import 'package:my_astro/screen/login_screen.dart';
import 'package:my_astro/screen/payment/add_money_screen.dart';
import 'package:my_astro/screen/remedies/remedies_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
        home: RemediesScreen(),
      ),
    );
  }
  }

