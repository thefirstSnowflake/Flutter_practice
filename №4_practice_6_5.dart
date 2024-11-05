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
  //final List <int> sequenceOfNumbers = [for (var i = 0; i <= 100; i++) i]; //генерируем список чисел от 0 до 100

   @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: SafeArea( 
        child: Container( 
          margin: EdgeInsets.only(right: 10),
          child: 
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Search",
                //hintText: "Search",
                
                prefixIcon: Icon(Icons.search, size: 22),
                
                helperText: "Поле для поиска заметок",
                iconColor: Color.fromARGB(255, 187, 0, 255)
              )
        )
        
        )
      )
    );
  }
}

