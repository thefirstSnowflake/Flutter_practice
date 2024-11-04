import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class TabItem {
  String? title;
  Icon icon;
  TabItem({this.title, required this.icon});
}

final List<TabItem> _tabBar = [
  TabItem(title: "Home", icon: const Icon(Icons.home, size: 22)),
  TabItem(title: "Chat", icon: const Icon(Icons.chat, size: 22)),
  TabItem(title: "Albums", icon: const Icon(Icons.album, size: 22))
];

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

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  int _currentTabIndex = 0;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  PersistentBottomSheetController? _controller;

  void toggleBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) => SafeArea(
                child: Container(
              height: 150,
              child: Column(children: [
                const SizedBox(height: 20),
                Row(children: [
                  const SizedBox(width: 20),
                  Icon(Icons.credit_card_outlined, size: 22),
                  const SizedBox(width: 40),
                  Text("Сумма"),
                  const SizedBox(width: 200),
                  Text("200 руб"),
                ]),
                const SizedBox(height: 15),
                TextButton(
                    onPressed: () {},
                    child: const Text("Оплатить"),
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all<Color>(
                          Color.fromARGB(255, 159, 196, 239)),
                      foregroundColor: WidgetStateProperty.all<Color>(
                          Color.fromARGB(255, 59, 30, 67)),
                    )),
              ]),
            )));
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabBar.length, vsync: this);

    _tabController!.addListener(() {
      setState(() {
        print('Listener ${_tabController!.index}');
        _currentTabIndex = _tabController!.index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  key: scaffoldKey,
      appBar: AppBar(
        title: const Text('Hello, Flutter app!'),
        backgroundColor: const Color.fromARGB(255, 159, 196, 239),
        actions: [
          Builder(
            builder: (context) => IconButton(
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                },
                icon: const Icon(Icons.account_circle_rounded)),
          )
        ],
      ),
      body: SafeArea(
        child: TabBarView(controller: _tabController, children: [
          Container(
            child: Image.network('https://loremflickr.com/320/240/animal'),
          ),
          Container(
            child: Image.network('https://loremflickr.com/320/240/people'),
          ),
          Container(
            child: Image.network('https://loremflickr.com/320/240/music'),
          ),
        ]),
      ),
      floatingActionButton: SafeArea(
        child: FloatingActionButton(
          backgroundColor: const Color.fromARGB(255, 239, 187, 255),
          onPressed: () => toggleBottomSheet(context),
          child: Icon(Icons.add),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: BottomAppBar(
          child: Container(
            child: BottomNavigationBar(
              onTap: (index) {
                setState(() {
                  _tabController!.index = index;
                  _currentTabIndex = index;
                });
              },
              currentIndex: _currentTabIndex,
              items: [
                for (final item in _tabBar)
                  BottomNavigationBarItem(
                    label: item.title,
                    icon: item.icon,
                  )
              ],
            ),
          ),
        ),
      ),
      endDrawer: const SafeArea(
        child: Drawer(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
              CircleAvatar(
                backgroundImage:
                    NetworkImage('https://loremflickr.com/320/240/cat'),
                radius: 50,
              ),
              Text('username'),
            ])),
      ),
      drawer: SafeArea(
        child: Drawer(
            child: Column(children: [
          const DrawerHeader(
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://i.pinimg.com/736x/81/df/db/81dfdbe10de7eacdb6ddca47c7cc9181.jpg'),
              radius: 60,
            ),
          ),
          const ListTile(
            title: Text('Home'),
            leading: Icon(Icons.home),
            trailing: Icon(Icons.chevron_right),
          ),
          const ListTile(
            title: Text('Profile'),
            leading: Icon(Icons.person_3_rounded),
            trailing: Icon(Icons.chevron_right),
          ),
          const ListTile(
            title: Text('Images'),
            leading: Icon(Icons.image),
            trailing: Icon(Icons.chevron_right),
          ),
          Expanded(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () {},
                      child: const Text('Выход'),
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all<Color>(
                            Color.fromARGB(255, 159, 196, 239)),
                        foregroundColor: WidgetStateProperty.all<Color>(
                            Color.fromARGB(255, 59, 30, 67)),
                      )),
                  TextButton(
                      onPressed: () {},
                      child: const Text('Регистрация'),
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all<Color>(
                            Color.fromARGB(255, 159, 196, 239)),
                        foregroundColor: WidgetStateProperty.all<Color>(
                            Color.fromARGB(255, 59, 30, 67)),
                      )),
                ]),
          )
        ])),
      ),
    ); // This trailing comma makes auto-formatting nicer for build methods.
  }
}
