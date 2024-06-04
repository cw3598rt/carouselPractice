import 'dart:async';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> _imageList = [
    "assets/images/worldClass.png",
    "assets/images/irritation.png",
    "assets/images/irritation2.png"
  ];

  final _pageController = PageController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.periodic(
      Duration(seconds: 5),
      (timer) {
        int? page = _pageController.page?.toInt();
        if (page == null) {
          return;
        } else {
          if (page == 2) {
            page = 0;
          } else {
            page++;
          }
        }
        _pageController.animateToPage(page,
            duration: Duration(microseconds: 300), curve: Curves.bounceIn);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      children: [
        for (final image in _imageList)
          SizedBox(
            child: Image.asset(
              image,
              fit: BoxFit.cover,
            ),
          ),
      ],
    );
  }
}
