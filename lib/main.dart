import 'package:flutter/material.dart';
import 'package:reddit_clone/home/view/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reddit Clone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        primaryColor: Colors.orange,
        accentColor: Colors.red,
      ),
      home: HomePage(),
    );
  }
}
