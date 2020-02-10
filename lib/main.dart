import 'package:flutter/material.dart';
import 'package:restofood_api/ui/screens/home_screeen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Restofood",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.orange,
        accentColor: Colors.orange
      ),
      routes: {
        "/home": (context) => HomeScreen()
      },
      home: HomeScreen(),
    );
  }
}
