import 'package:collegedoors_demo/ragister_page.dart';
import 'package:collegedoors_demo/twitter.dart';
import 'package:collegedoors_demo/youtube.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:collegedoors_demo/login.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'facebook.dart';
import 'instagram.dart';
import 'linkdin.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<StatefulWidget> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<Dashboard> {
  List imageList = [
    {"id": 1, "image_path": 'assets/images/slider1.png'},
    {"id": 2, "image_path": 'assets/images/slider2.png'},
    {"id": 3, "image_path": 'assets/images/slider3.png'},
  ];
  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.blue.shade900,
      body: SingleChildScrollView(
        child: Column(children: [
          Stack(
            children: [
              InkWell(
                onTap: () {},
                child: CarouselSlider(
                  items: imageList
                      .map(
                        (item) => Image.asset(
                          item['image_path'],
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      )
                      .toList(),
                  carouselController: carouselController,
                  options: CarouselOptions(
                    scrollPhysics: const BouncingScrollPhysics(),
                    autoPlay: true,
                    aspectRatio: 2,
                    height: 190,
                    viewportFraction: 1,
                    onPageChanged: (index, reason) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: imageList.asMap().entries.map((entry) {
                    return GestureDetector(
                      onTap: () => carouselController.animateToPage(entry.key),
                      child: Container(
                        width: currentIndex == entry.key ? 17 : 7,
                        height: 7.0,
                        margin: const EdgeInsets.symmetric(
                          horizontal: 3.0,
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: currentIndex == entry.key
                                ? Colors.red
                                : Colors.teal),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
          Container(
            height: 550,
            width: double.infinity,
            color: Colors.white,
            alignment: Alignment.center,
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(30),
            // transform: Matrix4.rotationZ(0.1),
            child: Column(
              children: [
                Image.asset(
                  "assets/images/logo.png",
                  height: 150.0,
                  width: 300.0,
                ),
                SizedBox(
                  height: 11,
                ),
                Material(
                  elevation: 5,
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.blue.shade900,
                  child: MaterialButton(
                      padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                      minWidth: MediaQuery.of(context).size.width,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()),
                        );
                      },
                      child: const Text(
                        "Login",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      )),
                ),
                const SizedBox(
                  height: 25,
                ),
                Material(
                  elevation: 5,
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.blue.shade900,
                  child: MaterialButton(
                      padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                      minWidth: MediaQuery.of(context).size.width,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RegisterPage()),
                        );
                      },
                      child: const Text(
                        "Register",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      )),
                ),
                const SizedBox(height: 150),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment
                        .spaceEvenly, //Center Row contents horizontally,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: const Icon(FontAwesomeIcons.facebook,
                            size: 45, color: Colors.blue),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return Facebook();
                            }),
                          );
                        },
                      ),
                      IconButton(
                        icon: const Icon(
                          FontAwesomeIcons.youtube,
                          size: 45,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return Youtube();
                            }),
                          );
                        },
                      ),
                      IconButton(
                        icon: const Icon(
                          FontAwesomeIcons.instagram,
                          size: 45,
                          color: Colors.purple,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return Instagram();
                            }),
                          );
                        },
                      ),
                      IconButton(
                        icon: const Icon(
                          FontAwesomeIcons.linkedin,
                          size: 45,
                          color: Colors.blue,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return Linkdin();
                            }),
                          );
                        },
                      ),
                      IconButton(
                        icon: const Icon(
                          FontAwesomeIcons.twitter,
                          size: 45,
                          color: Colors.blue,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return Twitter();
                            }),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
      // bottomNavigationBar: CurvedNavigationBar(
      //   backgroundColor: Colors.blue.shade900,
      //   color: Colors.blue.shade200,
      //   animationDuration: const Duration(milliseconds: 500),
      //   items: const [
      //     Icon(Icons.home),
      //     Icon(Icons.favorite),
      //     Icon(Icons.settings),
      //   ],
      // ),
    );
  }
}
