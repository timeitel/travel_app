import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:travel_app/services/auth.dart';
import 'package:travel_app/widgets/constants.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF73AEF5),
                      Color(0xFF61A4F1),
                      Color(0xFF478DE0),
                      Color(0xFF398AE5),
                    ],
                    stops: [0.1, 0.4, 0.7, 0.9],
                  ),
                ),
              ),
              Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 120.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      _buildLoginHero(),
                      SizedBox(height: 30.0),
                      _buildEmailInput(),
                      SizedBox(height: 30.0),
                      _buildPasswordInput(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          FlatButton(
                            onPressed: () async {
                              dynamic result = await _auth.signInAnon();
                              if (result == null) {
                                print('error signing in');
                                print(result);
                              } else {
                                print('signedin');
                                print(result.uid);
                              }
                            },
                            padding: EdgeInsets.only(right: 0.0),
                            child: Text(
                              'Continue as guest',
                              style: kLabelStyle,
                            ),
                          ),
                          FlatButton(
                            onPressed: () =>
                                print('Forgot Password Button Pressed'),
                            padding: EdgeInsets.only(right: 0.0),
                            child: Text(
                              'Forgot password?',
                              style: kLabelStyle,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 25.0),
                        width: double.infinity,
                        child: RaisedButton(
                          elevation: 5.0,
                          onPressed: () {
                            print('Logging in ');
                          },
                          padding: EdgeInsets.all(15.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          color: Colors.white,
                          child: Text(
                            'LOGIN',
                            style: TextStyle(
                              color: Color(0xFF527DAA),
                              letterSpacing: 1.5,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'OpenSans',
                            ),
                          ),
                        ),
                      ),
                      _buildSignupBtn(),
                    ],
                  ),
                ),
              ),
              Positioned(
                  bottom: 0,
                  right: 0,
                  child: Image.asset(
                    'assets/images/footer.png',
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class _buildLoginHero extends StatelessWidget {
  const _buildLoginHero({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Travel Check',
      style: TextStyle(
        color: Colors.white,
        fontFamily: 'OpenSans',
        fontSize: 30.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

Widget _buildEmailInput() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        'Email',
        style: kLabelStyle,
      ),
      SizedBox(height: 10.0),
      Container(
        alignment: Alignment.centerLeft,
        decoration: kBoxDecorationStyle,
        height: 60.0,
        child: TextField(
          keyboardType: TextInputType.emailAddress,
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'OpenSans',
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(top: 14.0),
            prefixIcon: Icon(
              Icons.email,
              color: Colors.white,
            ),
            hintText: 'Enter your email',
            hintStyle: kHintTextStyle,
          ),
        ),
      ),
    ],
  );
}

Widget _buildPasswordInput() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        'Password',
        style: kLabelStyle,
      ),
      SizedBox(height: 10.0),
      Container(
        alignment: Alignment.centerLeft,
        decoration: kBoxDecorationStyle,
        height: 60.0,
        child: TextField(
          obscureText: true,
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'OpenSans',
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(top: 14.0),
            prefixIcon: Icon(
              Icons.lock,
              color: Colors.white,
            ),
            hintText: 'Enter your password',
            hintStyle: kHintTextStyle,
          ),
        ),
      ),
    ],
  );
}

Widget _buildSignupBtn() {
  return GestureDetector(
    onTap: () => print('Sign Up Button Pressed'),
    child: RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Don\'t have an account? ',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
              fontWeight: FontWeight.w400,
            ),
          ),
          TextSpan(
            text: 'Sign Up',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ),
  );
}
