import 'package:blocemployee/homePage.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My Employee App",
      theme: ThemeData(
          primarySwatch: Colors.green, primaryColor: Colors.blueAccent),
      debugShowCheckedModeBanner: false,
      home: homePage(),
    );
  }
}
