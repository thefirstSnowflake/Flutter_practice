import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

 

void main() {
  runApp(MyApp());
  // const String assetName = 'assets/why.svg';
  // final Widget svgString = SvgPicture.asset(assetName, semanticsLabel: 'why?.....');
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget> [ 
          SvgPicture.asset('assets/why.svg'),
          SvgPicture.network('https://dev.w3.org/SVG/tools/svgweb/samples/svg-files/acid.svg')
          ]
        ),
      ),
    );
  }
}
