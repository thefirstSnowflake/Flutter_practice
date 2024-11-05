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
  final List <int> sequenceOfNumbers = [for (var i = 0; i <= 100; i++) i]; //генерируем список чисел от 0 до 100

   @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: ListView.separated( //separated для применения разделителя
       // controller: controller,
        separatorBuilder: (BuildContext context, int index) => Divider(), //обозначаем разделитель
        itemCount: sequenceOfNumbers.length, //количество элементов = кол-ву элементов в генерируемом листе
        itemBuilder: (context, index) { //строим наполнение для каждой строчки ListView
          return Container(
            padding: const EdgeInsets.only(left: 10, top: 10, right: 0, bottom: 10), //внутренние отступы со всех сторон
            child: Text(sequenceOfNumbers[index].toString(), style: TextStyle(fontSize: 15, color: Color.fromARGB(255, 87, 38, 155))) //текст из генерируемого списка (число в строку)
          );
        },
      ),
    );
  }
}

