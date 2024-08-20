import 'package:flutter/material.dart';
import 'package:navigationbar/cart.dart';
import 'package:navigationbar/home.dart';
import 'package:navigationbar/profile.dart';
import 'package:navigationbar/screen.dart';
import 'package:navigationbar/search.dart';

class Navigations extends StatefulWidget {
  const Navigations({super.key});
  @override
  State<Navigations> createState() => _Navigationstate();
}

class _Navigationstate extends State<Navigations> {
  int selectIndex = 0;
  late List<Widget> screens;
  @override
  void initState() {
    super.initState();
    screens = [
      const Home(),
      const Search(),
      const Profile(),
      const Cart(),
      const Screen()
    ];
  }
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectIndex],
      bottomNavigationBar: NavigationBarTheme(
        data: const NavigationBarThemeData(backgroundColor: Colors.black),
        child: NavigationBar(
          selectedIndex: selectIndex,
          destinations: const [
            NavigationDestination(icon: Icon(Icons.home), label: "home"),
            NavigationDestination(icon: Icon(Icons.search), label: "search"),
            NavigationDestination(
              icon: Icon(Icons.person),
              label: "Profile",
            ),
            NavigationDestination(icon: Icon(Icons.card_travel), label: "cart"),
            NavigationDestination(icon: Icon(Icons.favorite), label: "favorite")
          ],
        ),
      ),
    );
  }
}
