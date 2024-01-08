import 'package:flutter/material.dart';
import 'package:softpati/view/component/drawer.dart';

class PageProfileUser extends StatelessWidget {
  const PageProfileUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: SafeArea(
          child: Scaffold(
            drawer: CompDrawer(),
            appBar: AppBar(
              actions: [  IconButton(onPressed: () {}, icon:  Icon(Icons.message),),],
              // title: Column(
              //   children: [
              //     // CircleAvatar(
              //     //   backgroundColor: Colors.black,
              //     //   radius: 50,
              //     // ),
              //    //SizedBox(height: 20),
              //  
              //     // ElevatedButton(
              //     //   onPressed: () {},
              //     //   style: ElevatedButton.styleFrom(fixedSize: Size(300, 50)),
              //     //   child: Row(
              //     //     mainAxisAlignment: MainAxisAlignment.center,
              //     //     children: [
              //     //       Icon(Icons.message),
              //     //       SizedBox(width: 7),
              //     //       Text('Mesaj at'),
              //     //     ],
              //     //   ),
              //     // )
              //   ],
              // ),
              backgroundColor: const Color.fromARGB(255, 247, 205, 219),
            //  toolbarHeight: 200,
              bottom: TabBar(
                tabs: const <Widget>[
                  Tab(child: Text('İlanlarım')),
                  Tab(child: Text('Patilerim')),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Center(
                      child: ListView(
                    padding: const EdgeInsets.all(8),
                    children: <Widget>[
                      Container(
                        height: 100,
                        child: Card(
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: CircleAvatar(
                                  radius: 35,
                                  backgroundImage: AssetImage('assets/cat.jpg'),
                                ),
                              ),
                              Container(
                                child: Column(
                                  children: [
                                    Text(
                                      'Lucky',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Kaybolduğu yer:',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text('Ataköy/İstanbul'),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Kaybolduğu tarih :',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text('23.12.2023'),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 100,
                        child: Card(
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: CircleAvatar(
                                  radius: 35,
                                  backgroundImage: AssetImage('assets/cat.jpg'),
                                ),
                              ),
                              Container(
                                child: Column(
                                  children: [
                                    Text(
                                      'Lucky',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Kaybolduğu yer:',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text('Ataköy/İstanbul'),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Kaybolduğu tarih :',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text('23.12.2023'),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 100,
                        child: Card(
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: CircleAvatar(
                                  radius: 35,
                                  backgroundImage: AssetImage('assets/cat.jpg'),
                                ),
                              ),
                              Container(
                                child: Column(
                                  children: [
                                    Text(
                                      'Lucky',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Kaybolduğu yer:',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text('Ataköy/İstanbul'),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Kaybolduğu tarih :',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text('23.12.2023'),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )),
                ),
                Center(
                  child: GridView.count(
                    primary: false,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 2,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(13.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 253, 248, 250),
                            border:
                                Border.all(color: Colors.grey.withOpacity(0.3)),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            children: [
                              Icon(Icons.pets, size: 50),
                              const Text("Kedi 1"),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(13.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 253, 248, 250),
                            border:
                                Border.all(color: Colors.grey.withOpacity(0.3)),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            children: [
                              Icon(Icons.pets, size: 50),
                              const Text("Kedi 1"),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(13.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 253, 248, 250),
                            border:
                                Border.all(color: Colors.grey.withOpacity(0.3)),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            children: [
                              Icon(Icons.pets, size: 50),
                              const Text("Kedi 1"),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(13.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 253, 248, 250),
                            border:
                                Border.all(color: Colors.grey.withOpacity(0.3)),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            children: [
                              Icon(Icons.pets, size: 50),
                              const Text("Kedi 1"),
                            ],
                          ),
                        ),
                      ),
                    ],
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
