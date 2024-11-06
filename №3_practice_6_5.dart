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


class SimpleCard extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Container(
      child: Card(
        color: Color.fromARGB(255, 82, 234, 156),
        child: ListTile(),
      )
    );
  }
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> data = List.generate(50, (index){
    return SimpleCard();
  });
  
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: 
      LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints){
        double _width = constraints.constrainWidth();
        return _width > 500
          ? Center(child: Container( 
              padding: EdgeInsets.only(left: 50, right: 50),
              child: ListView(
              scrollDirection: Axis.vertical,
              children: <Widget>[...data.map((item) => Container(width: 100, child: item)).toList()],
              )
            )
          )
          : Container( 
              height: 100,
              child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[...data.map((item) => Container(width: 100, child: item)).toList()],
              )
            );
        },
      ),
      )
    );
  }
}
