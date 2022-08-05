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
    return Scaffold(
      body: SafeArea(
        child: DefaultTabController(
          length: 2,
          child: NestedScrollView(
            headerSliverBuilder: (context, hoge) {
              return [
                SliverPersistentHeader(
                    pinned: true,
                    // floating: true,
                    delegate: MySliverPersistentHeaderDelegate())
              ];
            },
            body: TabBarView(
              children: [
                ListView.builder(
                  key: PageStorageKey(0), // keep scroll position
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text("page one:$index"),
                    );
                  },
                  itemCount: 50,
                ),
                ListView.builder(
                  key: PageStorageKey(1),
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text("page two:$index"),
                    );
                  },
                  itemCount: 80,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MySliverPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  double get maxExtent => 200;

  @override
  double get minExtent => 48; // from tab height

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    print("so:$shrinkOffset, oc:$overlapsContent");
    return Container(
      color: Colors.pinkAccent,
      height: max(maxExtent - shrinkOffset, minExtent),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            color: Colors.green,
            height: max(maxExtent - shrinkOffset - minExtent, 0),
          ),
          TabBar(tabs: [
            Tab(
              text: "page1",
            ),
            Tab(
              text: "page2",
            ),
          ]),
        ],
      ),
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
