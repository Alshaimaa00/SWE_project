//Dots Connect Level1 Instructions
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
    backgroundColor: const Color(0xFFA17135),
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
            image: AssetImage('Assets/Images/inst_BKG(LVL1).jpg'),
      fit: BoxFit.cover,
    ),
    ),

    child: Stack(
    children: [
      Padding(  //return button
                padding: const  EdgeInsets.only(top: 7),
                child: Positioned(
                  bottom: 700,
                  right: 400 ,
                  child: TextButton(
                    onPressed: (){
                      //add logic
                    },
                  child: Image.asset(
                    'Assets/Images/return_BTN (LVL1).jpg',
                    width: 1.75 * 38.5826771654,
                    height: 1.5 * 38.5826771654,
                  ),
                ),
              ),
              ),
      
      const Padding(
        padding: EdgeInsets.only(bottom: 279),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            'خذ التعليمات قبل ان تنطلق! \n ستظهر لك الان لعبة توصيل العناصر المتشابهة \n -قم بالنقر على المربعات لتظليلها, ومحاولة التوصيل بين العناصر المتشابهة \n لديك عشرين ثانية لتوصيل العناصر المتشابهة!',
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
            left: (MediaQuery.of(context).size.width - 4 * 38.5826771654) / 2,
            bottom: 240,
            child: TextButton(
              onPressed: (){
                //add logic
              },
            child: Image.asset(
              'Assets/Images/go_BTN (LVL1).jpg',
              width: 4 * 38.5826771654,
              height: 3 * 38.5826771654,
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
