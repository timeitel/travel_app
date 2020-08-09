import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_app/services/auth_service.dart';
import 'package:travel_app/widgets/destination_carousel.dart';
import 'package:travel_app/widgets/hotel_carousel.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  int _currentTab = 0;
  List<IconData> _icons = [
    FontAwesomeIcons.plane,
    FontAwesomeIcons.bed,
    FontAwesomeIcons.walking,
    FontAwesomeIcons.biking,
  ];
  final AuthService _auth = AuthService();

  Widget _buildIcon(int index) {
    return GestureDetector(
      onTap: (() {
        setState(() {
          _selectedIndex = index;
        });
      }),
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
            color: _selectedIndex == index
                ? Theme.of(context).accentColor
                : Color(0xFFE7EBEE),
            borderRadius: BorderRadius.circular(30.0)),
        child: Icon(_icons[index],
            size: 25.0,
            color: _selectedIndex == index
                ? Theme.of(context).primaryColor
                : Color(0xFFB4C1C4)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        padding: EdgeInsets.symmetric(vertical: 30.0),
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 20.0, right: 120.0),
            child: Text(
              'What would you like to find?',
              style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: _icons
                .asMap()
                .entries
                .map((MapEntry map) => _buildIcon(map.key))
                .toList(),
          ),
          SizedBox(
            height: 20.0,
          ),
          DestinationCarousel(),
          HotelCarousel()
        ],
      )),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentTab,
          onTap: (int value) async {
            if (value == 2) {
              await _auth.signOut();
            }

            setState(() {
              _currentTab = value;
            });
          },
          items: [
            BottomNavigationBarItem(
                title: SizedBox.shrink(),
                icon: Icon(
                  Icons.search,
                  size: 30.0,
                )),
            BottomNavigationBarItem(
                title: SizedBox.shrink(),
                icon: Icon(
                  Icons.local_pizza,
                  size: 30.0,
                )),
            BottomNavigationBarItem(
                title: SizedBox.shrink(),
                icon: Icon(
                  Icons.power_settings_new,
                  size: 30.0,
                )),
          ]),
    );
  }
}
