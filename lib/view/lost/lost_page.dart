import 'package:flutter/material.dart';
import 'package:softpati/view/component/drawer.dart';
import 'package:softpati/view/petProfile/pet_profile_page.dart';
 

class PageLost extends StatefulWidget {
  const PageLost({super.key});

  @override
  State<PageLost> createState() => _PageLostState();
}

class _PageLostState extends State<PageLost> {
  //String imagePath,
  Widget _buildTrainingCard(String description, String buttonText,
      Widget destinationPage, String descriptiontwo) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PageProfilePet(),
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
                  // child: Image.asset(imagePath),
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
      drawer: CompDrawer(),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
      ),
      body: SafeArea(
        child: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          children: [
            _buildTrainingCard(
                "4 Gün Önce ", "İstabul/Fatih", PageProfilePet(), "Kayıp Kedi"),
            _buildTrainingCard(
                "4 Gün Önce ", "İstabul/Fatih", PageProfilePet(), "Kayıp Kedi"),
            _buildTrainingCard(
                "Backend Developer",
                "📝 Başvuruya açık - Son Başvuru Tarihi: 12.01.2024",
                PageProfilePet(),
                "Kayıp Kedi"),
            _buildTrainingCard(
                "Game Developer",
                "📝 Başvuruya açık - Son Başvuru Tarihi: 12.01.2024",
                PageProfilePet(),
                "Kayıp Kedi"),
            _buildTrainingCard(
                "Veri Analitiği",
                "🗓️ Başvuruya açıldığında burada ilan edilecektir.",
                PageProfilePet(),
                "Kayıp Kedi"),
            _buildTrainingCard(
                "Bilişim Güvenliği Mimarı",
                "🗓️ Başvuruya açıldığında burada ilan edilecektir",
                PageProfilePet(),
                "Kayıp Kedi"),
            _buildTrainingCard(
                "Embedded Systems Developer",
                "🗓️ Başvuruya açıldığında burada ilan edilecektir.",
                PageProfilePet(),
                "Kayıp Kedi"),
          ],
        ),
      ),
    );
  }
}
