import 'package:flutter/material.dart';
import 'package:softpati/src/ui/component/drawer.dart';
import 'package:softpati/src/ui/pages/petProfile/pet_profile_page.dart';

class PageOwn extends StatefulWidget {
  const PageOwn({super.key});

  @override
  State<PageOwn> createState() => _PageOwnState();
}

class _PageOwnState extends State<PageOwn> {
  // This controller will store the value of the search bar
  final TextEditingController _searchController = TextEditingController();

  Widget _buildTrainingCard(
    String imagePath,
    String description,
    String buttonText,
    Widget destinationPage,
  ) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PageProfilePet(),
        ),
      ),
      child: Container(
        width: 100,
        height: 200,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 253, 248, 250),
          border: Border.all(color: Colors.grey.withOpacity(0.3)),
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.all(8),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8),
            child: Column(
              children: [
                Container(
                  color: Color.fromARGB(255, 244, 226, 250),
                  width: double.infinity,
                  height: 50,
                  child: Image.asset(imagePath),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  description,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 10,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  buttonText,
                  style: TextStyle(fontSize: 10, color: Colors.blue),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        drawer: CompDrawer(),
        appBar: AppBar(),
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        body: SafeArea(
          child: GridView.count(
            primary: false,
            padding: const EdgeInsets.all(10),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 3,
            children: [
              _buildTrainingCard(
                'assets/school.png',
                "4 Gün Önce ",
                "İstabul/Fatih",
                PageProfilePet(),
              ),
              _buildTrainingCard(
                'assets/school.png',
                "4 Gün Önce ",
                "İstabul/Fatih",
                PageProfilePet(),
              ),
              _buildTrainingCard(
                'assets/school.png',
                "4 Gün Önce ",
                "İstabul/Fatih",
                PageProfilePet(),
              ),
              _buildTrainingCard(
                'assets/school.png',
                "4 Gün Önce ",
                "İstabul/Fatih",
                PageProfilePet(),
              ),
              _buildTrainingCard(
                'assets/school.png',
                "4 Gün Önce ",
                "İstabul/Fatih",
                PageProfilePet(),
              ),
              _buildTrainingCard(
                'assets/school.png',
                "4 Gün Önce ",
                "İstabul/Fatih",
                PageProfilePet(),
              ),
              _buildTrainingCard(
                'assets/school.png',
                "4 Gün Önce ",
                "İstabul/Fatih",
                PageProfilePet(),
              ),
              _buildTrainingCard(
                'assets/school.png',
                "4 Gün Önce ",
                "İstabul/Fatih",
                PageProfilePet(),
              ),
              _buildTrainingCard(
                'assets/school.png',
                "4 Gün Önce ",
                "İstabul/Fatih",
                PageProfilePet(),
              ),
              _buildTrainingCard(
                'assets/school.png',
                "4 Gün Önce ",
                "İstabul/Fatih",
                PageProfilePet(),
              ),
              _buildTrainingCard(
                'assets/school.png',
                "4 Gün Önce ",
                "İstabul/Fatih",
                PageProfilePet(),
              ),
              _buildTrainingCard(
                'assets/school.png',
                "4 Gün Önce ",
                "İstabul/Fatih",
                PageProfilePet(),
              ),
              _buildTrainingCard(
                'assets/school.png',
                "4 Gün Önce ",
                "İstabul/Fatih",
                PageProfilePet(),
              ),
              _buildTrainingCard(
                'assets/school.png',
                "4 Gün Önce ",
                "İstabul/Fatih",
                PageProfilePet(),
              ),
              _buildTrainingCard(
                'assets/school.png',
                "4 Gün Önce ",
                "İstabul/Fatih",
                PageProfilePet(),
              ),
              // _buildTrainingCard(
              //     "Game Developer",
              //     'assets/school.png',
              //     "Tarihi: 12.01.2024",
              //     PageProfilePet(),
              //     "Kayıp Kedi"),
              // _buildTrainingCard(
              //     "Veri Analitiği",
              //     'assets/school.png',
              //     "ilan edilecektir.",
              //     PageProfilePet(),
              //     "Kayıp Kedi"),
              // _buildTrainingCard(
              //     "Bilişim Güvenliği Mimarı",
              //     'assets/school.png',
              //     "  ilan edilecektir",
              //     PageProfilePet(),
              //     "Kayıp Kedi"),
              // _buildTrainingCard(
              //     "Embedded Systems Developer",
              //     'assets/school.png',
              //     "ilan edilecektir.",
              //     PageProfilePet(),
              //     "Kayıp Kedi"),
            ],
          ),
        ),
      ),
    );
  }
}
