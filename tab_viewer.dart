import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}); //берет key из класса по иерархии выше в конструктор

  // This widget is the root of your application.
  @override //переопределяет виджет
  Widget build(BuildContext context) {
    //"строит" контекст - наполнение виджета
    return MaterialApp(
      theme: ThemeData(
        //конструктор темы
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple), //цвет
        useMaterial3: true,
      ),
      home: const MyHomePage(
          title: 'Flutter Demo Home Page'), //название в конструктор MyHomePage
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage(
      {super.key, required this.title}); //наследуем ключ и обязателен title

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() =>
      _MyHomePageState(); //возвращает объект класса
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> tabNames = ['Мои фото', 'Галерея'];
  Map<String, List<String>> imagesLinks = {
    'Мои фото': [
      'https://loremflickr.com/320/240/cat',
      'https://loremflickr.com/320/240/dog',
      'https://loremflickr.com/320/240/forest',
      'https://loremflickr.com/320/240/sakura',
      'https://loremflickr.com/320/240/flower'
    ],
    'Галерея': [
      'https://loremflickr.com/320/240/animal',
      'https://loremflickr.com/320/240/forest',
      'https://loremflickr.com/320/240/sakura',
      'https://loremflickr.com/320/240/pizza',
      'https://loremflickr.com/320/240/flower'
    ]
  };

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return DefaultTabController(
      length: tabNames.length,
      child: Scaffold(
          appBar: AppBar(
            title: Text('Images'),
            bottom: TabBar(
                tabs: tabNames.map((String item) => Tab(text: item)).toList()),
          ),
          body: TabBarView(
            children: tabNames.map((name) {
              return ListView(
                key: PageStorageKey(name),
                children: <Widget>[
                  for (var link in imagesLinks[name]!) Image.network(link),
                ],
              );
            }).toList(),
          )),
    );
  }
}
