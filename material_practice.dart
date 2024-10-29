import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class TabItem{
  String? title;
  Icon? icon;
  TabItem({this.title, this.icon});
}

final List<TabItem> _tabBar = [
  TabItem(title: "Home", icon: Icon(Icons.home)),
  TabItem(title: "Chat", icon: Icon(Icons.chat)),
  TabItem(title: "Albums", icon: Icon(Icons.album))
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

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  TabController? _tabController;
  int _currentTabIndex = 0;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  PersistentBottomSheetController? _controller;

  void toggleBottomSheet()
  {
    if (_controller == null)
    {
      _controller = scaffoldKey.currentState!.showBottomSheet(
        (context) => Container(
          height: 200,
          color: Color.fromARGB(150, 130, 230, 190),
          child: Center(
            child: Text('Bottom sheet'),
          )
        )
      );
    }else{
      _controller!.close();
      _controller = null;
    }
  }

  @override
  void initState(){
    _tabController = TabController(length: _tabBar.length, vsync: this);
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Hello, Flutter app!'),
          backgroundColor: Color.fromARGB(255, 159, 196, 239),
          actions: [
            Builder(builder: (context) => IconButton(
            onPressed: () {
              Scaffold.of(context).openEndDrawer();
            }, 
            icon: Icon(Icons.account_circle_rounded)),
            )
          ],
         ),
      
      body: TabBarView(
        controller:  _tabController,
        children: [
          Container(
            child: Image.network('https://loremflickr.com/320/240/animal'),
          ),
          Container(
            child: Image.network('https://loremflickr.com/320/240/people'), 
          ),
          Container(
            child: Image.network('https://loremflickr.com/320/240/music'), 
          ),
        ]
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index){
          setState(() {
            _tabController!.index = index;
            _currentTabIndex = index;
          });
        },
        currentIndex: _currentTabIndex,
        items: [
          for (final item in _tabBar)
            BottomNavigationBarItem(label: item.title, icon: item.icon!)
        ]
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Color.fromARGB(255, 239, 187, 255),
        onPressed: toggleBottomSheet,
      ),

      endDrawer: Drawer(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [ 
              CircleAvatar(
                backgroundImage: NetworkImage('https://loremflickr.com/320/240/cat'),
                radius: 50,
              ),
              Text('username'),
            ]
          )
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
