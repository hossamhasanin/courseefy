import 'package:courseefy/home/bottom_bar.dart';
import 'package:courseefy/home/temp/fav.dart';
import 'package:courseefy/home/temp/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:main/main.dart';
import 'package:search/ui/search_screen.dart';

class HomeScreen extends StatelessWidget {
  final PageController _pageController = PageController();
  final RxInt currentPage = 0.obs;

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (page){
          if (currentPage.value != page){
            currentPage.value = page;
          }
        },
        children: const [
          MainScreen(),
          SearchScreen(),
          Fav(),
          Profile()
        ],
      ),
      bottomNavigationBar: BottomBar(
        currentPage:  currentPage,
        moveTo: (page){
          currentPage.value = page;
          _pageController.animateToPage(page, duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
        },
      ),
    );
  }
}
