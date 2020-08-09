import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/models/user_model.dart';
import 'package:travel_app/screens/authenticate/login_screen.dart';
import 'package:travel_app/screens/home/home_screen.dart';

class AuthState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print(user);

    // return home or login screen
    return user == null ? LoginScreen() : HomeScreen();
  }
}
