import 'dart:async';
import 'package:collegedoors_demo/dashboard.dart';
import 'package:colorful_circular_progress_indicator/colorful_circular_progress_indicator.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);
  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(const Duration(seconds: 6), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => const Dashboard()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(begin: Alignment.topRight, end:Alignment.bottomRight,colors: [Color(
              0xFFFFFFFF),Color(0xFFFFFFFF),])
        ),
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
            children:[
           Column( children: [
            Image.asset("assets/images/logo.png",
              height: 150.0,
              width: 300.0,
            ),
            const Text("One-stop-solution for all Exams\n at your fingertips",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(0xFF1A3874),
                fontWeight: FontWeight.bold,
                fontSize: 16.0
              ),
            ),
          ],
        ),
        const SizedBox(height: 15),
        const ColorfulCircularProgressIndicator(
            colors: [Colors.green],
            indicatorWidth: 50,
            indicatorHeight: 50,
            strokeWidth: 5,
          )
        ],
      ),
      ),
    );
  }
}
