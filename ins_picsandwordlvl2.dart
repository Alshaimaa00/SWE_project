import 'package:flutter/material.dart';

void main() {
runApp(const MyApp());
}

class MyApp extends StatelessWidget {
const MyApp({Key? key}) : super(key: key);


@override
Widget build(BuildContext context) {
return MaterialApp(
home: Scaffold(
appBar: PreferredSize(
preferredSize: const Size.fromHeight(40.0),

child: AppBar(
backgroundColor: const Color(0xFF90CAF9),
title: const Text(
'لعبة صور وكلمة ',
style: TextStyle(
color: Color.fromARGB(255, 255, 255, 255),
fontWeight: FontWeight.bold,
fontSize: 16,
fontFamily: "Cairo",
),
),
centerTitle: true,
),
),
body: DecoratedBox(
decoration: const BoxDecoration(
image: DecorationImage(
image: AssetImage('images/lavvel2.jpg'),
fit: BoxFit.cover,
),
),

child: Stack(
children: [
Padding(padding: const  EdgeInsets.only(top: 7),
  child: Positioned( bottom: 700,
  right: 400 ,
  child: TextButton(
  onPressed: (){
  //add logic
  },
  child: Image.asset(
  'images/return_BTN.png',
  width: 1.75 * 38.5826771654,
  height: 1.5 * 38.5826771654,
  ),
  ),
  ),
  ),

  const Padding(
  padding: EdgeInsets.only(bottom: 285),
  child: Align(
  alignment: Alignment.center,
  child: Text(  'خذ التعليمات قبل أن تنطلق\nستظهر لك الان لعبة صور وكلمة\nعليك  إكتشاف الرابط بين الصور\nوإختيار الحروف الملائمة لتشكيل كلمة الرابط!',
    style: TextStyle(
      color: Color.fromARGB(255, 0, 0, 0),
      fontWeight: FontWeight.bold,
      fontSize: 24,
      fontFamily: "Cairo",
    ),
    textDirection: TextDirection.rtl,
    textAlign: TextAlign.center,
  ),
  ),
  ),

    Positioned( //go button
    left: (MediaQuery.of(context).size.width - 5.2 * 38.5826771654) / 2,      bottom: 260,
      child: TextButton(
        onPressed: (){
          //add logic
        },
        child: Image.asset(
          'images/saham.png',
          width: 4.5 * 38.5826771654,
          height: 4 * 38.5826771654,
        ),
      ),
    ),
],
),
),
),
);
}
}