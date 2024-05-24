import 'package:hakanflix/colors.dart';
import 'package:hakanflix/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp(
    key: null,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({required Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hakanflix',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colours.scaffoldBgColor,
        //useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
