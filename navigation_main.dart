import 'package:flutter/material.dart';
import 'package:navigation_7_6/fetch_file.dart';
import 'package:navigation_7_6/albums.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/',
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case MyHomePage.routeName:
            return MaterialPageRoute(builder: (BuildContext context) {
              return MyHomePage();
            });
          case ArtistsPage.routeName:
            return MaterialPageRoute(builder: (BuildContext context) {
              return ArtistsPage();
            });
          case AboutPage.routeName:
            return MaterialPageRoute(builder: (BuildContext context) => AboutPage(
              artistName: ,
              artistDescription: ,
            )

              
            );
          default:
            break;
        }
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  static const routeName = '/';
  const MyHomePage({super.key});

//  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 96, 191, 255),
          title: Text("Home"),
        ),
        body: Center(
          child: Text(
            "Hello! Home page",
            style: TextStyle(fontSize: 20),
          ),
        ),
        drawer: Drawer(
            child: SafeArea(
                child: Column(
          children: [
            ListTile(
              title: Text("Home",
                  style: TextStyle(color: Color.fromARGB(255, 96, 191, 255))),
            ),
            ListTile(
              title: Text("Artists"),
              onTap: () {
                Navigator.of(context).pushNamed('/artists');
              },
            )
          ],
        )))); // This trailing comma makes auto-formatting nicer for build methods.
  }
}

class ArtistsPage extends StatefulWidget {
  static const routeName = '/artists';
  const ArtistsPage({super.key});

//  final String title;
  @override
  State<ArtistsPage> createState() => _ArtistsPageState();
}

class _ArtistsPageState extends State<ArtistsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 96, 191, 255),
          title: Text("Artists"),
        ),
        body: FutureBuilder(future: fetchFileFromAssets('assets/artists.json'), builder: (BuildContext context, AsyncSnapshot<List<Album>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
          } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final artist = snapshot.data![index];
                  return ListTile(title: Text(artist.name!), onTap: () {
                    Navigator.of(context).pushNamed('/about');
                    
                  },);
                },
              );
            }
        },),
        drawer: Drawer(
            child: SafeArea(
                child: Column(
          children: [
            ListTile(
              title: Text("Home"),
              onTap: () {
                Navigator.of(context).pushNamed('/');
              },
            ),
            ListTile(
              title: Text("Artists",
                  style: TextStyle(color: Color.fromARGB(255, 96, 191, 255))),
            )
          ],
        )))); // This trailing comma makes auto-formatting nicer for build methods.
  }
}



class AboutPage extends StatelessWidget {
  static const routeName = '/about';

  final String? artistDescription;
  final String? artistName;

  const AboutPage({
    Key? key,
    required this.artistName,
    required this.artistDescription
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(artistName!),
        backgroundColor: const Color.fromARGB(255, 96, 191, 255),
        actions: [
          Builder(
            builder: (context) => IconButton(
                onPressed: () {
                  Navigator.of(context).pop('/about');
                },
                icon: const Icon(Icons.account_circle_rounded)),
          )
        ],
      ),
     body: SafeArea( child: SingleChildScrollView(
      child: Text(artistDescription!),
     )
      
     ),
    ); // This trailing comma makes auto-formatting nicer for build methods.
  }
}
