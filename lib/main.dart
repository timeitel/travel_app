import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/screens/auth_state.dart';
import 'package:travel_app/services/auth_service.dart';
import 'package:travel_app/models/user_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        title: 'Travel App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: Color(0xFF3EBACE),
            accentColor: Color(0xFFD8ECF1),
            scaffoldBackgroundColor: Color(0xFFF3F5F7)),
        home: AuthState(),
      ),
    );
  }
}
