import 'package:flutter/material.dart';
import 'package:onboarding_screen/screens/home_page_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePageScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
