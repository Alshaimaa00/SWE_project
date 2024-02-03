import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rewards Screen',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  void _showPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Color(0xFFF9E5C5), // Background color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0), // Rounded corners
            side: BorderSide(color: Colors.black), // Black border
          ),

          content: Container(
            height: 140,
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFC6A177), // Background color
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(10.0), // Rounded corners
                    ),
                  ),
                  child: Text(
                    'تلميح واحد 100 عود',
                    style: TextStyle(
                        color: Color(0xFF856530), fontSize: 20), // Text color
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFC6A177), // Background color
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(10.0), // Rounded corners
                    ),
                  ),
                  child: Text(
                    'تلميحين 150 عود',
                    style: TextStyle(
                        color: Color(0xFF856530), fontSize: 20, ), // Text color
                  ),
                ),
              ],
            ),
          ),
          actions: [
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFFC6A177), // Background color
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(10.0), // Rounded corners
                  ),
                ),
                child: Icon(
                  Icons.close,
                  color: Color(0xFF5D4A34),
                )),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF9E5C5),
    leading: IconButton(
    icon: Image.asset(
    'Assets/returnback.png',
    width: 100,
    height: 100,
    ),
    onPressed: () {
      Navigator.pop(context);
    }
    )),
    body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'Assets/RewardsBackground.png'), // Replace with your image asset
            fit: BoxFit.cover,
          ),
        ),
        child: Align(
          alignment: Alignment.topCenter,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 60),
                child: Text(
                  'المكافآت',
                  style: TextStyle(fontSize: 50, color: Color(0xFF725737), fontFamily: 'alfont_com_TufuliArabicDEMO-Medium'),
                ),
              ),
              SizedBox(height: 40),
              Text(
                'لديك 300 عود',
                style: TextStyle(fontSize: 30, color: Color(0xFF976E58)),
              ),
              Text(
                'لديك 4 تلميحات',
                style: TextStyle(fontSize: 30, color: Color(0xFF976E58)),
              ),
              SizedBox(height: 50),
              ElevatedButton(
                onPressed: () {
                  _showPopup(context);
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFFC6A177), // Background color
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(10.0), // Rounded corners
                  ),
                ),
                child: Text(
                  'اشترِ تلميحاً',
                  style: TextStyle(
                      color: Color(0xFF856530), fontSize: 25), // Text color
                ),
              ),
            ],
          ),
        ),
        alignment: Alignment.topCenter,
      ),
    );
  }
}
