import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:gevinst_flutter_task/screens/UserDetails.dart';
import 'package:http/http.dart' as http;
import 'models/User.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<User> users = [];

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      List<User> usersList =
          body.map((dynamic item) => User.fromJson(item)).toList();

      if (this.mounted) {
        setState(() {
          users = usersList;
        });
      }
    } else {
      throw Exception('Failed to load users');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          final firstLetter = user.name.isNotEmpty ? user.name[0] : '';

          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.blueAccent,
              radius: 30,
              child: Text(
                firstLetter,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
            title: Text(user.name),
            subtitle: Text(user.email),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UserDetailsScreen(user: user),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
