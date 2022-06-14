import 'package:flutter_navigate_pages/navigate_pages.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigate Pages',      
      ),
      home: const NavigatePages(),
    );
  }
}
