import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:softpati/src/ui/component/card_widget.dart';
import 'package:softpati/src/ui/component/comp_navbar.dart';
import 'package:softpati/src/ui/pages/dene.dart';
import 'package:softpati/src/ui/pages/login_page.dart';
import 'package:softpati/theme/app_color.dart';

class PageHome2 extends StatefulWidget {
  const PageHome2({super.key});

  @override
  State<PageHome2> createState() => _PageHome2State();
}

class _PageHome2State extends State<PageHome2> {
  int selectedScreen = 0;
  void ChangeScreen(int index) {
    setState(() {
      selectedScreen = index;
      showScreen(selectedScreen);
    });
  }

  Widget? showScreen(int selectedScreen) {
    if (selectedScreen == 0)
      return PageHome2();
    else if (selectedScreen == 1)
      return PageLogin();
    //else if(selectedScreen==2)
    //return twitterLists();
    else if (selectedScreen == 3) return PageHome2();
  }

  @override
  Widget build(BuildContext context) {
    final double navBarHeight = 80.0;
    final double navBarWidth = MediaQuery.of(context).size.width * 0.8;

    final List<CustomCard> customCards = [
      CustomCard(
        icon: '👩‍💻',
        title: 'Sahiplen',
        subtitle: '88 techies',
        backgroundColor: ConstantsColor.bodyColor,
      ),
      CustomCard(
        icon: "👨‍🎨",
        title: 'Kayıp',
        subtitle: '45 creatives',
        backgroundColor: ConstantsColor.orangeColor,
      ),
      CustomCard(
        icon: "🙅‍♂️",
        title: 'Bağış',
        subtitle: '24 checkers',
        backgroundColor: ConstantsColor.pinkColor,
      ),
      CustomCard(
        icon: "🙅‍♂️",
        title: 'Eğitim Videoları',
        subtitle: '20 big rains',
        backgroundColor: ConstantsColor.lightPurpleColor,
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: NavigationBar(
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
      ),
      //bottomNavigationBar: buildBottomNavigationBar(navBarHeight, navBarWidth),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              flex: 2,
              child: buildHeaderItems(context, ConstantsAdress.avatarImage2)),
          buildSearchBarItem(),
          Expanded(
            flex: 2,
            child: buildCardPano(),
          ),
          buildTitleDepartmants(context),
          Expanded(
            flex: 6,
            child: buildCardItem(context, customCards),
          ),
        ],
      ),
    );
  }

  Padding buildTitleItem(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 20),
      child: Text(
        'Your recently worked with',
        style: GoogleFonts.outfit(
            textStyle: textTheme.headline6, color: Colors.black),
      ),
    );
  }

  Padding buildCardItem(BuildContext context, List<CustomCard> customCards) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns in the grid
          crossAxisSpacing: 16.0, // Spacing between columns
          mainAxisSpacing: 16.0, // Spacing between rows
        ),
        itemCount: customCards.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: customCards[index],
          );
        },
      ),
    );
  }

  Padding buildTitleDepartmants(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 20, top: 20),
        child: Text(
          'Departmants',
          style: GoogleFonts.outfit(
              textStyle: textTheme.headline6, color: Colors.black),
        ));
  }

  Expanded buildSearchBarItem() {
    return Expanded(
        flex: 1,
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: TextField(
            decoration: InputDecoration(
              hintText: "What are you looking for?",
              hintStyle: GoogleFonts.outfit(textStyle: textTheme.bodyMedium),
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide.none,
              ),
              fillColor: ConstantsColor.lightGreyColor,
              filled: true,
            ),
          ),
        ));
  }

  Padding buildHeaderItems(BuildContext context, String avatarImage) {
    return Padding(
      padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FittedBox(
                child: Text(
                  'Today',
                  style: GoogleFonts.outfit(
                      textStyle: textTheme.headline5, color: Colors.black),
                ),
              ),
              FittedBox(
                child: Text(
                  'Good Morning,Hannah',
                  style: GoogleFonts.outfit(
                      textStyle: textTheme.subtitle1, color: Colors.grey),
                ),
              ),
            ],
          ),
          CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(avatarImage),
          ),
        ],
      ),
    );
  }
}

Padding buildBottomNavigationBar(double navBarHeight, double navBarWidth) {
  return Padding(
    padding: const EdgeInsets.all(3.0),
    child: SizedBox(
      height: navBarHeight,
      width: navBarWidth,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: BottomNavigationBar(
          backgroundColor: ConstantsColor.bottomNavColor,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white.withOpacity(0.5),
          currentIndex: 0,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.thumbs_up_down_outlined),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.thumbs_up_down_outlined),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: "",
            ),
          ],
        ),
      ),
    ),
  );
}

Padding buildCardPano() {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 20),
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount:
          2, // İki resim ekleyeceğimiz için itemCount'i 2 olarak ayarlıyoruz
      itemBuilder: (BuildContext context, int index) {
        return buildImageCard(index);
      },
    ),
  );
}

Card buildImageCard(int index) {
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    child: Container(
      width: 250,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage(index == 0
                  ? 'assets/image1.jpg' // İlk resmin dosya yolu
                  : 'assets/image2.jpg' // İkinci resmin dosya yolu
              ),
          fit: BoxFit.cover,
        ),
      ),
    ),
  );
}
