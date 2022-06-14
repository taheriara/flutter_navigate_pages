import 'dart:math';
import 'package:flutter_navigate_pages/user_page.dart';
import 'package:flutter/material.dart';

class User {
  final String username;
  final String email;
  final Color color;

  const User({
    required this.username,
    required this.email,
    required this.color,
  });
}

class ListviewNavigation extends StatefulWidget {
  const ListviewNavigation({Key? key}) : super(key: key);

  @override
  State<ListviewNavigation> createState() => _ListviewNavigationState();
}

class _ListviewNavigationState extends State<ListviewNavigation> {
  List<User> users = [
    User(
      username: 'Ali',
      email: 'ali@email.com',
      color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
    ),
    User(
      username: 'Hassan',
      email: 'hassan@email.com',
      color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
    ),
    User(
      username: 'Hossein',
      email: 'hossein@email.com',
      color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
    ),
    User(
      username: 'Sajad',
      email: 'sajad@email.com',
      color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
    ),
    User(
      username: 'Baqir',
      email: 'baqir@email.com',
      color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView Navigation'),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: ((context, index) {
          final user = users[index];
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                radius: 28,
                backgroundColor: user.color,
              ),
              title: Text(user.username),
              subtitle: Text(user.email),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => UserPage(user: user)),
                  ),
                );
              },
            ),
          );
        }),
      ),
    );
  }
}
