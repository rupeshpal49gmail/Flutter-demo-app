import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome to Collegedoor"),
      ),
      body: Stack(
        children: [
          Center(
            child: Image.asset('assets/images/logo.png'),
          ),

        ],
      ),
    );
  }
}
