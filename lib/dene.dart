import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'homee_view_model.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeScreenProvider(),
      child: Scaffold(
        body: Consumer<HomeScreenProvider>(
          builder: (context, provider, child) {
            return provider.currentPage;
          },
        ),
        bottomNavigationBar: Consumer<HomeScreenProvider>(
          builder: (context, provider, child) {
            return BottomNavigationBar(
              currentIndex: provider.currentIndex,
              onTap: (index) {
                provider.changePage(index);
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Ana Sayfa',
                  backgroundColor: Colors.black,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.calendar_today),
                  label: 'Randevularım',
                  backgroundColor: Colors.black,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.request_page),
                  label: 'Randevu Taleplerim',
                  backgroundColor: Colors.black,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.menu),
                  label: 'Menü',
                  backgroundColor: Colors.black,
                ),
              ],
              backgroundColor: Colors.blue,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.grey,
            );
          },
        ),
      ),
    );
  }
}





