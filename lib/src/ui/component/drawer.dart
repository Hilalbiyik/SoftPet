import 'package:flutter/material.dart';
import 'package:softpati/src/ui/pages/petShop/petshop_page.dart';
import 'package:softpati/src/ui/pages/home/home_page.dart';
import 'package:softpati/src/ui/pages/lost/lost_page.dart';
import 'package:softpati/src/ui/pages/login/login_page.dart';
import 'package:softpati/src/ui/pages/own/own_page.dart';

class CompDrawer extends StatefulWidget {
  const CompDrawer({super.key, required});

  @override
  State<CompDrawer> createState() => _ComtDrawerState();
}

class _ComtDrawerState extends State<CompDrawer> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Anasayfa',
      style: optionStyle,
    ),
    Text(
      'Sahipler',
      style: optionStyle,
    ),
    Text(
      'Kayıp',
      style: optionStyle,
    ),
    Text(
      'Bagış/Petşop',
      style: optionStyle,
    ),
    Text(
      'Eğitim',
      style: optionStyle,
    ),
    Text(
      'Videolar',
      style: optionStyle,
    ),
    Text(
      'Hakkımızda',
      style: optionStyle,
    ),
    Text(
      'Çıkış',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        // Add a ListView to the ComtDrawer. This ensures the user can scroll
        // through the options in the ComtDrawer if there isn't enough vertical
        // space to fit everything.

        child: ListView(
      // Important: Remove any padding from the ListView.
      padding: EdgeInsets.zero,
      children: [
        const DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            children: [
              // Icon(
              //   Icons.child_care,
              //   size: 30,
              // ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Color.fromARGB(255, 245, 226, 233),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Text('Profil'),
                ],
              ),
            ],
          ),
        ),
        ListTile(
          leading: const Icon(Icons.delete),
          title: const Text('Sahipler'),
          selected: _selectedIndex == 0,
          onTap: () {
            // Update the state of the app
            _onItemTapped(0);
            // Then close the ComtDrawer
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PageOwn(), // Yönlendirilecek sayfa
              ),
            );
          },
        ),
        GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PageLost(),
            ),
          ),
          child: ListTile(
            leading: const Icon(Icons.label),
            title: const Text('Kayıp'),
            selected: _selectedIndex == 1,
            onTap: () {
              // Update the state of the app
              _onItemTapped(1);
              // Then close the ComtDrawer
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PageLost(), // Yönlendirilecek sayfa
                ),
              );
            },
          ),
        ),
        GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PageShopping(),
            ),
          ),
          child: ListTile(
            leading: const Icon(Icons.bookmark),
            title: const Text('Bağış/Petşop'),
            selected: _selectedIndex == 2,
            onTap: () {
              // Update the state of the app
              _onItemTapped(2);
              // Then close the ComtDrawer
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PageShopping(), // Yönlendirilecek sayfa
                ),
              );
            },
          ),
        ),
        ListTile(
          leading: const Icon(Icons.bookmark),
          title: const Text('Eğitim'),
          selected: _selectedIndex == 3,
          onTap: () {
            // Update the state of the app
            _onItemTapped(3);
            // Then close the ComtDrawer
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: const Icon(Icons.bookmark),
          title: const Text('Videolar'),
          selected: _selectedIndex == 4,
          onTap: () {
            // Update the state of the app
            _onItemTapped(4);
            // Then close the ComtDrawer
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: const Icon(Icons.bookmark),
          title: const Text('Hakkımızda '),
          selected: _selectedIndex == 5,
          onTap: () {
            // Update the state of the app
            _onItemTapped(5);
            // Then close the ComtDrawer
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: const Icon(Icons.bookmark),
          title: const Text('Çıkış '),
          selected: _selectedIndex == 6,
          onTap: () {
            // Update the state of the app
            _onItemTapped(6);
            // Then close the ComtDrawer
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PageLogin(), // Yönlendirilecek sayfa
              ),
            );
          },
        ),
        ListTile(
          leading: const Icon(Icons.bookmark),
          title: const Text('AnaSayfa'),
          selected: _selectedIndex == 7,
          onTap: () {
            // Update the state of the app
            _onItemTapped(7);
            // Then close the ComtDrawer
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PageHome(), // Yönlendirilecek sayfa
              ),
            );
          },
        ),
      ],
    ));
  }
}
