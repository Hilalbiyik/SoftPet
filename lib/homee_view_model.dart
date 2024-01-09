import 'package:flutter/material.dart';
import 'package:softpati/view/chat/chat_page.dart';

import 'package:softpati/view/home/home_page.dart';
import 'package:softpati/view/login/login_page.dart';
import 'package:softpati/view/petShop/petshop_page.dart';

class HomeScreenProvider with ChangeNotifier {
  int _currentIndex = 0;
  List<Widget> _pages = [
    PageHome(),
    PageShopping(),
    ChatPage(),
    // RandevuTaleplerimScreen(),
    PageLogin()
  ];

  int get currentIndex => _currentIndex;

  Widget get currentPage => _pages[_currentIndex];

  void changePage(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}