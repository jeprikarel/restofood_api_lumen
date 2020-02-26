import 'package:flutter/material.dart';
import 'package:restofood_api/ui/screens/cart_screen.dart';
import 'package:restofood_api/ui/screens/home_screen.dart';
import 'package:restofood_api/ui/screens/profile_screen.dart';


class DashBoardScreen extends StatefulWidget {
  @override
  _DashBoardScreenState createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
   //Selected index page
  int selectedIndex = 0;

  //List screen page
  List<Widget> pageList = [
    HomeScreen(),
    CartScreen(),
    ProfileScreen(),
  ];

  //Navbar Item
  final _bottomNavbarItem = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      title: Text("Home")
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.shopping_cart),
      title: Text("Cart")
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.account_circle),
      title: Text("Profile")
    ),
  ];

  void _onNavBarTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageList[selectedIndex],

      bottomNavigationBar: BottomNavigationBar(
        items: _bottomNavbarItem,
        currentIndex: selectedIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(0.4),
        backgroundColor: Colors.orange,
        onTap: _onNavBarTapped,
      ),
    );
  }
}