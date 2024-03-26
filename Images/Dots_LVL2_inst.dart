//Dots Connect Level2 Instructions
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
            backgroundColor: const Color(0xFF0C62D7),
            title: const Text(
              'لعبة توصيل النقاط',
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
              image: AssetImage('Assets/Images/backG_hint.png'),
              fit: BoxFit.cover,
            ),
          ),

          child: Stack(
            children: [
              Padding(  //return button
                padding: const  EdgeInsets.only(top: 7),
                child: Positioned(
                  left: 5 * 38.5,
                  child: Image.asset(
                    'Assets/Images/return_BTN.png',
                    width: 2 * 38.5826771654,
                    height: 2 * 38.5826771654,
                  ),
                ),
              ),

              const Padding(

                padding: EdgeInsets.only(bottom: 280),

                child: Align(
                  heightFactor:10 ,
                  alignment: Alignment.center,
                  child: Text(
                    'خذ التعليمات قبل تنطلق ',
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      fontFamily: "Cairo",
                      //height:90,

                    ),
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),



              const Padding(
                padding: EdgeInsets.only(bottom: 280),
                child: Align(
                  heightFactor: 700,
                  alignment: Alignment.center,
                  child: Text(

                    'قم بالنقر على المربعات لتظليلها,\n ومحاولة التوصيل بين العناصر المتشابهة',
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      fontFamily: "Cairo",
                    //  height: 25,
                    ),
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),

              Positioned( //go button
                left: (MediaQuery.of(context).size.width - 4 * 38.5826771654) / 2,
                bottom: 278, // Adjust as needed
                child: Image.asset(
                  'Assets/Images/saham.png',
                  width: 4 * 38.5826771654,
                  height: 3 * 38.5826771654,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
