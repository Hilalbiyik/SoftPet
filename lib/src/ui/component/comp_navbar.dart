import 'package:flutter/material.dart';
import 'package:softpati/src/ui/pages/home/home_page.dart';
import 'package:softpati/src/ui/pages/login/login_page.dart';

class CompNavBar extends StatefulWidget {
  const CompNavBar({super.key});

  @override
  State<CompNavBar> createState() => CompNavBarState();
}

class CompNavBarState extends State<CompNavBar> {
  @override

   int selectedScreen=0;
    void ChangeScreen(int   index){
      setState((){
        selectedScreen =  index;
        showScreen(selectedScreen); 
        });
    }
  Widget? showScreen(int selectedScreen)
  {
    if(selectedScreen==0)
        return PageLogin();
    else if(selectedScreen==1)
          return PageHome();
    else if(selectedScreen==2)
      return PageHome();
    else if(selectedScreen==3)
      return PageHome();
  }

  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: selectedScreen,
      onDestinationSelected: ChangeScreen,
      destinations: const <Widget>[
        NavigationDestination(
          label: 'Home',
          icon: Icon(Icons.home_outlined),
        ),
        NavigationDestination(
          label: 'Search',
          icon: Icon(Icons.search),
        ),
        NavigationDestination(
          label: 'Notificaitons',
          icon: Icon(Icons.notifications_sharp),
        ),
        NavigationDestination(
          label: 'Messages',
          icon: Icon(Icons.message),
        ),
      ],
      //indicatorColor: Colors.grey,
    );
  }
}