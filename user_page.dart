import 'flutter_navigate_pages/listview_navigation.dart';
import 'package:flutter/material.dart';

class UserPage extends StatelessWidget {
  const UserPage({Key? key, required this.user}) : super(key: key);

  final User user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: user.color,
      appBar: AppBar(title: Text(user.username)),
      body: Center(child: Text(user.email)),
    );
  }
}
