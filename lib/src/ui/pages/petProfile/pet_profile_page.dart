import 'package:flutter/material.dart';
import 'package:softpati/src/ui/component/drawer.dart';
import 'package:softpati/src/ui/pages/user_profil_page.dart';

class PageProfilePet extends StatefulWidget {
  const PageProfilePet({super.key});

  @override
  State<PageProfilePet> createState() => _PageProfilePetState();
}

class _PageProfilePetState extends State<PageProfilePet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 247, 223, 231),
        leading: Container(
          height: 15,
          width: 15,
          child: IconButton(
            icon: Icon(Icons.menu), // Use the drawer icon here
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
      ),
      drawer: CompDrawer(),
      backgroundColor: Color.fromARGB(255, 247, 223, 231),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: CircleAvatar(
                    radius: 80,
                    backgroundImage: AssetImage(
                      'assets/cat.jpg',
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(70),
                        topRight: Radius.circular(70)),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).size.height * 0.1),
                    child: Padding(
                      padding: const EdgeInsets.all(30),
                      child: Container(
                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 30),
                              Text(
                                'Lucky',
                                style: TextStyle(
                                    fontSize: 23, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 30),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Flexible(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: const Color.fromARGB(
                                            255, 225, 150, 175),
                                      ),
                                      width: 75,
                                      height: 75,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Cinsiyet ',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text('Dişi'),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 15),
                                  Flexible(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: const Color.fromARGB(
                                            255, 220, 170, 228),
                                      ),
                                      width: 75,
                                      height: 75,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Yaş',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text('2'),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 15),
                                  Flexible(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: const Color.fromARGB(
                                            255, 205, 232, 255),
                                      ),
                                      width: 75,
                                      height: 75,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Kilo',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text('5 kg'),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 15),
                                  Flexible(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color:
                                            Color.fromARGB(255, 205, 255, 225),
                                      ),
                                      width: 75,
                                      height: 75,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Aşı',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text('İç parazit'),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 30),
                              Container(
                                height: 130,
                                width: 400,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Card(
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Genel Bilgiler',
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                'Kaybolduğu Yer:',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(' Ataköy/İstanbul'),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text('Kaybolduğu Tarih:',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              Text(' 23.12.2023'),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 30),
                              Container(
                                child: Padding(
                                    padding: EdgeInsets.only(
                                        bottom:
                                            MediaQuery.of(context).size.height *
                                                0.1),
                                    child: ListTile(
                                      leading: CircleAvatar(
                                          backgroundColor: Colors.grey),
                                      title: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Oya Özcan',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                            ),
                                          ),
                                          Text('İlan Sahibi'),
                                        ],
                                      ),
                                      trailing: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          IconButton(
                                              onPressed: () {},
                                              icon: Icon(Icons.message)),
                                          IconButton(
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        PageProfileUser(),
                                                  ),
                                                );
                                              },
                                              icon: Icon(Icons.add)),
                                        ],
                                      ),
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
