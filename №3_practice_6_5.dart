import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

final fakeData = (int count) => List<Widget>.generate(
      count,
      (i) {
        return Card(
          color: Colors.green,
        );
      },
    );
final cards = fakeData(100);

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
  final List<int> sequenceOfNumbers = [
    for (var i = 0; i <= 100; i++) i
  ]; //генерируем список чисел от 0 до 100

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        height: 100,
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: cards.length,
          itemBuilder: (context, index) => cards[index],
        ),
      ),
      /* body: SafeArea(
            //чтобы не входить за границы приложения
            child: Align(
                //выравнивание
                alignment: Alignment.topCenter, //по центру
                child: Container(
                    width: 350, //ширина инпута = 350
                    margin: EdgeInsets.only(top: 20), //отступ сверху = 20
                    child: TextField(
                        //инициализируем текстовое поле для ввода
                        decoration: InputDecoration(
                      //создаем для него оформление
                      enabledBorder: OutlineInputBorder(
                          //оформление для границ поля в пассивном состоянии
                          borderRadius: BorderRadius.circular(
                              15), //радиус границы = 15 (скругленная)
                          borderSide: BorderSide(
                              //цвет границы
                              color: Color.fromARGB(255, 187, 0, 255))),
                      focusedBorder: OutlineInputBorder(
                          //оформление для границ поля в состоянии выбора и ввода
                          borderRadius: BorderRadius.circular(
                              15), //радиус границы = 15 (скругленная)
                          borderSide: BorderSide(
                              //цвет границы
                              color: Color.fromARGB(255, 187, 0, 255))),
                      labelText: "Search", //надпись по умолчанию и сверху
                      labelStyle: //цвет надписи
                          TextStyle(color: Color.fromARGB(255, 187, 0, 255)),
                      hintText: "Введите значение", //подсказка
                      hintStyle: TextStyle(
                          color: Color.fromARGB(
                              255, 183, 183, 183), //цвет подсказки и размер
                          fontSize: 15),
                      suffixIcon: Icon(Icons.search, size: 22), //иконка справа
                      suffixIconColor:
                          Color.fromARGB(255, 187, 0, 255), //цвет иконки
                      helperText: "Поле для поиска заметок", //надпись внизу
                    ))))));*/
    ));
  }
}
