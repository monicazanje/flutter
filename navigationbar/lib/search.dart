import 'package:flutter/material.dart';
import 'package:navigationbar/navigation.dart';

class Search extends StatefulWidget {
  const Search({super.key});
  @override
  State<Search> createState() => _Searchstate();
}

class _Searchstate extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: Navigations(),
    );
  }
}
