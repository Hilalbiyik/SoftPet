import 'package:flutter/material.dart';
import 'package:softpati/src/ui/pages/drawer.dart';
import 'package:softpati/src/ui/pages/pet_profile_screen.dart';
 

class KayipPage extends StatefulWidget {
  const KayipPage({super.key});

  @override
  State<KayipPage> createState() => _KayipPageState();
}

class _KayipPageState extends State<KayipPage> {
  Widget _buildTrainingCard(String imagePath, String description,
      String buttonText, Widget destinationPage, String descriptiontwo) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PetProfileScreen(),
        ),
      ),
      child: Container(
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
                  height: 80,
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
                  height: 10,
                ),
                Text(
                  buttonText,
                  style: TextStyle(fontSize: 10, color: Colors.blue),
                ),
                Text(
                  descriptiontwo,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.black,
                  ),
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
    return Scaffold(
         drawer:ComtDrawer(),
        appBar: AppBar(    backgroundColor: Color.fromARGB(255, 255, 255, 255),),
  
      body: SafeArea(
        child: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          children: [
            _buildTrainingCard('assets/school.png', "4 Gün Önce ",
                "İstabul/Fatih", PetProfileScreen(), "Kayıp Kedi"),
            _buildTrainingCard('assets/school.png', "4 Gün Önce ",
                "İstabul/Fatih", PetProfileScreen(), "Kayıp Kedi"),
            _buildTrainingCard(
                "Backend Developer",
                'assets/school.png',
                "📝 Başvuruya açık - Son Başvuru Tarihi: 12.01.2024",
                PetProfileScreen(),
                "Kayıp Kedi"),
            _buildTrainingCard(
                "Game Developer",
                'assets/school.png',
                "📝 Başvuruya açık - Son Başvuru Tarihi: 12.01.2024",
                PetProfileScreen(),
                "Kayıp Kedi"),
            _buildTrainingCard(
                "Veri Analitiği",
                'assets/school.png',
                "🗓️ Başvuruya açıldığında burada ilan edilecektir.",
                PetProfileScreen(),
                "Kayıp Kedi"),
            _buildTrainingCard(
                "Bilişim Güvenliği Mimarı",
                'assets/school.png',
                "🗓️ Başvuruya açıldığında burada ilan edilecektir",
                PetProfileScreen(),
                "Kayıp Kedi"),
            _buildTrainingCard(
                "Embedded Systems Developer",
                'assets/school.png',
                "🗓️ Başvuruya açıldığında burada ilan edilecektir.",
                PetProfileScreen(),
                "Kayıp Kedi"),
          ],
        ),
      ),
    );
  }
}
