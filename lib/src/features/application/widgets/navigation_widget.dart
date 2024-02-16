import 'package:eneler_mariia/src/common/components/colors/colors.dart';
import 'package:eneler_mariia/src/features/education/presentation/screens/video_list_screen.dart';
import 'package:eneler_mariia/src/features/profile/presentation/screen/profile_screen.dart';
import 'package:flutter/material.dart';

const _pages = <Widget>[VideoListScreen(), ProfileScreen()];

class NavigationWidget extends StatefulWidget {
  const NavigationWidget({super.key});

  @override
  State<NavigationWidget> createState() => _NavigationWidgetState();
}

class _NavigationWidgetState extends State<NavigationWidget> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _pages[currentPage],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        onTap: onTap,
        selectedItemColor: activeColor,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: 'Уроки'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Профиль')
        ],
      ),
    );
  }

  void onTap(int page) {
    setState(() {
      currentPage = page;
    });
  }
}
