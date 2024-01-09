import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:softpati/dene.dart';
import 'package:softpati/homee_view_model.dart';
import 'package:softpati/theme/app_color.dart';
import 'package:softpati/view/component/card_widget.dart';
import 'package:softpati/view/component/drawer.dart';
import 'package:softpati/view/donat/donat_page.dart';
import 'package:softpati/view/petProfile/pet_profile_page.dart';
import 'package:softpati/view_model/donat_view_model.dart';

class PageHome extends StatelessWidget {
  const PageHome({super.key});

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
        onPressed: () {
           ChangeNotifierProvider(
             create: (BuildContext context) =>DonatViewModel(),
            child: PageDonat(),
           );
        },

        icon: "🙅‍♂️",
        title: 'Bağış',
        subtitle: '24 chec',
        backgroundColor: ConstantsColor.pinkColor,
      ),
      CustomCard(
        onPressed: () {
          // ChangeNotifierProvider(
          //   create: (BuildContext context) =>SplashViewModel(),
          //   child: SplashPage(),
          // );
        },
        icon: "🙅‍♂️",
        title: 'Eğitim Videoları',
        subtitle: '20 big rains',
        backgroundColor: ConstantsColor.lightPurpleColor,
      ),
    ];
    return Scaffold(

      floatingActionButton: _buildFloatAction(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      drawer: CompDrawer(),
      backgroundColor: Colors.white,
      //bottomNavigationBar: CompNavBar(),
      bottomNavigationBar: buildBottomNavigationBar(navBarHeight, navBarWidth),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              flex: 2,
              child: GestureDetector(
                  onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PageProfilePet(),
                        ),
                      ),
                  child:
                      buildHeaderItems(context, ConstantsAdress.avatarImage2))),
          //buildSearchBarItem(),
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


  Widget _buildFloatAction(BuildContext context){

    return FloatingActionButton(

      child: Icon(Icons.add),
      onPressed: () {
        ChangeNotifierProvider(
          create: (BuildContext context) =>HomeScreenProvider(),
          child: HomeScreen(),
        );
      },
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
      itemCount: 2,
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
        // image: DecorationImage(
        //   // image: AssetImage(index == 0
        //   //         ? 'assets/image1.jpg' // İlk resmin dosya yolu
        //   //         : 'assets/image2.jpg' // İkinci resmin dosya yolu
        //   //     ),
        //   fit: BoxFit.cover,
        // ),
      ),
    ),
  );
}

void openHomeePage(BuildContext context) {
  MaterialPageRoute pageRoute = MaterialPageRoute(
    builder: (context) => ChangeNotifierProvider(
      create: (context) => HomeScreenProvider(),
      child: PageHome(),
    ),
  );
  Navigator.pushReplacement(context, pageRoute);
}
