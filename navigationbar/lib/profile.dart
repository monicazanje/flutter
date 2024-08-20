import 'package:flutter/material.dart';
import 'package:navigationbar/navigation.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});
  @override
  State<Profile> createState() => _Profilestate();
}

class _Profilestate extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: Navigations(),
    );
  }
}
