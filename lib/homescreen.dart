import 'package:flutter/material.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Card makeHomeScreenItem(String title, String img, int index){
  //   return Card(
  //     elevation: 2,
  //     margin:15 ,
  //   ),
  // }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text('homeScreen'),
    );
  }
}
