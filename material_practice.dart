import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Hello, Flutter app!'),
          backgroundColor: Color.fromARGB(255, 159, 196, 239),
         ),
      
      bottomNavigationBar: BottomAppBar(
        child: Container(
          child: BottomNavigationBar(
            elevation: 0,
              items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home",
                
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.chat),
                label: "Chat",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.album),
                label: "Albums",
              ),
            ],
            ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Color.fromARGB(255, 239, 187, 255),
        onPressed: () {},
      ),

      drawer: Drawer(
          child: Column(children: [
        DrawerHeader(
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://i.pinimg.com/736x/81/df/db/81dfdbe10de7eacdb6ddca47c7cc9181.jpg'),
            radius: 60,
          ),
        ),
        ListTile(
          title: Text('Home'),
          leading: Icon(Icons.home),
          trailing: Icon(Icons.chevron_right),
        ),
        ListTile(
          title: Text('Profile'),
          leading: Icon(Icons.person_3_rounded),
          trailing: Icon(Icons.chevron_right),
        ),
        ListTile(
          title: Text('Images'),
          leading: Icon(Icons.image),
          trailing: Icon(Icons.chevron_right),
        ),
        Expanded(
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextButton(onPressed: () {}, child: Text('Выход')),
                TextButton(onPressed: () {}, child: Text('Регистрация')),
              ]),
        )
      ])),
    ); // This trailing comma makes auto-formatting nicer for build methods.
  }
}
