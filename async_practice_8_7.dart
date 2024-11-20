import 'package:async_practice_8_7/fetch_file_from_assets.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
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
        backgroundColor: Color.fromARGB(255, 170, 220, 255),
        title: Text('Hello! Let''s read the files!'),
      ),
      body: SafeArea(child: Container(
      width: 350, //ширина инпута = 350
      margin: EdgeInsets.only(top: 20),
      child: TextField(
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
                              6), //радиус границы = 15 (скругленная)
                          borderSide: BorderSide(
                              //цвет границы
                              color: Color.fromARGB(255, 187, 0, 255))),
                  
                      hintText: "Введите имя файла", //подсказка
                      hintStyle: TextStyle(
                          color: Color.fromARGB(
                              255, 183, 183, 183), //цвет подсказки и размер
                          fontSize: 15),
      ),
      ),
      ),
      ),
      
      /*FutureBuilder<String>(
      future: fetchFileFromAssets('assets/file1.txt'), 
      builder: (BuildContext context, AsyncSnapshot<String> snapshot){
        print(snapshot.data);
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return Center(child: CircularProgressIndicator(),
          );
          case ConnectionState.done:
            if (snapshot.data == null) {
              return Expanded( child: Center(child: Text('The file was not found.')) ); 
            }
            return SingleChildScrollView(child: Text(snapshot.data!));
          default: return Center(child: CircularProgressIndicator());
        }
      }
    )*/
      
    );
  }
}


/*функция*/
/*import 'package:flutter/services.dart';

Future<String> fetchFileFromAssets(String assetsPath){
  return rootBundle.loadString(assetsPath).then((file) => file.toString());
}*/
