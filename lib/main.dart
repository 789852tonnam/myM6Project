import 'package:flutter/material.dart';
import 'package:project/button.dart';
import 'logoContainer.dart';

void main() {
 var app = MyHome();

  runApp(app);
}

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Home",
      home: MyHomeEx(),
      theme: ThemeData(primarySwatch: Colors.green, scaffoldBackgroundColor: Colors.grey.shade900),
    );
  }
}

class MyHomeEx extends StatefulWidget {
  const MyHomeEx({super.key});

  @override
  State<MyHomeEx> createState() => _MyHomeExState();
}

class _MyHomeExState extends State<MyHomeEx> {
  int _currentIndex = 0;

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Stoichiometry calculator"),
        ),
        body: ListView(
          children: [  
            SizedBox(height: 100,),    
            LogoContainer(),
            ButtonCal("Cal 1"),
            SizedBox(height: 5,),
            ButtonCal("Cal 2"),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: _onTabTapped,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.phone_android_rounded),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.assessment_rounded),
              label: 'Frequency',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.info_rounded),
              label: 'Manual',
            ),
          ],
        ),
      );
  }
}