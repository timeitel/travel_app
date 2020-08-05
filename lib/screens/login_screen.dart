import 'package:flutter/material.dart';
import 'package:travel_app/screens/home_screen.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              height: 300.0,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/background.png'),
                      fit: BoxFit.fill)),
              child: Stack(
                children: <Widget>[
                  Positioned(
                      left: 30.0,
                      width: 80.0,
                      height: 200.0,
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image:
                                    AssetImage('assets/images/light-1.png'))),
                      )),
                  Positioned(
                    child: Container(
                      child: Center(
                        child: Text(
                          'Login',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 40.0,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(30.0),
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromRGBO(143, 148, 251, 0.3),
                              blurRadius: 20.0,
                              offset: Offset(0, 10))
                        ]),
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(color: Colors.grey[200]))),
                          child: TextField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Username',
                                hintStyle: TextStyle(color: Colors.grey[400])),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(8.0),
                          child: TextField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Password',
                                hintStyle: TextStyle(color: Colors.grey[400])),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Container(
                    height: 50.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        gradient: LinearGradient(colors: [
                          Color.fromRGBO(143, 148, 251, 1),
                          Color.fromRGBO(143, 148, 251, 0.6)
                        ])),
                    child: Center(
                        child: Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    )),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  Text(
                    'Forgot password?',
                    style: TextStyle(
                        color: Color.fromRGBO(143, 148, 251, 1),
                        fontWeight: FontWeight.w700),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
