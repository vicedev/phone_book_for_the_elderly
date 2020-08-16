import 'package:flutter/material.dart';
import 'package:phonebookfortheelderly/pages/home/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: '老年人专用手机通讯录',
        theme: ThemeData(
          primarySwatch: Colors.white,
        ),
        home: HomePage());
  }
}