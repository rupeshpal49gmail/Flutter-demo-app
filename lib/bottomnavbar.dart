import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
class BottomNavBar extends StatefulWidget{
  const BottomNavBar({super.key});

  @override
  State<StatefulWidget> createState() => _BottomBar();
}

class _BottomBar extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(items: const [
        Icon(Icons.home),
        Icon(Icons.favorite),
        Icon(Icons.settings),
      ],),
    );
  }
}