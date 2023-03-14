import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:travel_tog/routes.dart';
import 'package:travel_tog/screens/add/add_screen.dart';
import 'package:travel_tog/screens/login/login_screen.dart';
import 'package:travel_tog/screens/post/components/post_container.dart';
import 'package:travel_tog/screens/post/post_screen.dart';
import 'package:travel_tog/screens/search/search_screen.dart';
import 'package:travel_tog/size_config.dart';
import '../../services/auth_service.dart';
import '../../services/service_locator.dart';
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
        backgroundColor: Colors.orangeAccent,
        onPressed: () {
          Navigator.pushNamed(context, pickImagesRouteName);
          // getIt.get<AuthService>().signOut(context);
        },
        child: const Icon(Icons.add),
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
