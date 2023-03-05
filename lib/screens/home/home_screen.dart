import 'package:flutter/material.dart';
import 'package:team_project_1/routes.dart';
import 'package:team_project_1/screens/post/post_screen.dart';
import 'package:team_project_1/screens/search/search_screen.dart';
import 'package:team_project_1/size_config.dart';

import 'components/appbar.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  void selectPage(int x) {
    selectedIndex = x;
  }

  List pages = [
    const PostPage(),
    const SearchScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.orangeAccent,
        onPressed: () {
          Navigator.pushNamed(context, addRouteName);
        },
      ),
      appBar: HomePageAppBar().appBar,
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.orangeAccent,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
        ],
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectPage(index);
          });
        },
      ),
      body: SafeArea(
        left: false,
        right: false,
        child: pages.elementAt(selectedIndex),
      ),
    );
  }
}
