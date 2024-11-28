import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

const String assetName = 'assets/why.svg';
const String assetNameURL = 'https://dev.w3.org/SVG/tools/svgweb/samples/svg-files/acid.svg';

void main() {
  runApp(MyApp());
  // const String assetName = 'assets/why.svg';
  // final Widget svgString = SvgPicture.asset(assetName, semanticsLabel: 'why?.....');
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Column(
            children: <Widget>[
              SvgPicture.asset(assetName, width: 300, height: 300),
              SvgPicture.network(assetNameURL, width: 300, height: 300),
            ]
        ),
      ),
    );
  }
}
