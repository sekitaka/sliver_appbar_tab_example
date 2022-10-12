import 'dart:ui';

import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    // TabBarで設定されるTabの左右の余白(tabs.dartのadjustedPaddingより推測)
    final double tabContentPadding = 16;
    final tabCount = 3;
    final tabWidth =
        (screenWidth - tabCount * 2 * tabContentPadding) / tabCount;
    return DefaultTabController(
        length: tabCount,
        child: Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                TabBar(tabs: [
                  Tab(
                    child: Container(
                      width: tabWidth,
                      color: Colors.pink,
                    ),
                  ),
                  Tab(
                    child: Container(
                      width: tabWidth,
                      color: Colors.amber,
                    ),
                  ),
                  Tab(
                    child: Container(
                      width: tabWidth,
                      color: Colors.cyan,
                    ),
                  ),
                ]),
              ],
            ),
          ),
        ));
  }
}
