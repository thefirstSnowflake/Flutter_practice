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
            }, settings: settings);
          case ArtistsPage.routeName:
            return MaterialPageRoute(builder: (BuildContext context) {
              return ArtistsPage();
            }, settings: settings);
          case AboutPage.routeName:
            return MaterialPageRoute(builder: (BuildContext context) {
              return AboutPage();
            }, settings: settings);

              
          
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
                    //print(artist != null);
                    //print(artist != null);
                    Navigator.of(context).pushNamed('/about', arguments: artist);
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


class AboutPage extends StatefulWidget {
  static const routeName = '/about';
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  String? artistName;
  String? artistAbout;

  @override
 void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    final args = ModalRoute.of(context)?.settings.arguments as Album;

    artistName = args.name;
    artistAbout = args.about;

    setState(() {});
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(artistName ?? 'Error'),
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
      child: Text(artistAbout ?? 'Error'),
     )
      
     ),
    ); // This trailing comma makes auto-formatting nicer for build methods.
  }
}
