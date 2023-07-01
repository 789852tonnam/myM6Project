import 'package:flutter/material.dart';
import 'package:project/Screen/homeScreen.dart';
import 'package:project/Screen/statScreen.dart';
import 'package:provider/provider.dart';
import 'Provider/rankDataProvider.dart';

void main() {
 var app = MyHome();

  runApp(app);
}

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context){
          return rankDataProvider();
        }),
      ],
      child: MaterialApp(
        title: "Home",
        home: MyHomeEx(),
        theme: ThemeData(primarySwatch: Colors.green, scaffoldBackgroundColor: Colors.grey.shade900),
      ),
    );
  }
}

class MyHomeEx extends StatefulWidget {
  const MyHomeEx({super.key});

  @override
  State<MyHomeEx> createState() => _MyHomeExState();
}

class _MyHomeExState extends State<MyHomeEx> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, 
      child: Scaffold(
        body: TabBarView(
          children: [
            HomeScreen(),
            StatScreen(),
          ],
        ),
        bottomNavigationBar: TabBar(
          tabs: [
            Tab(
              icon: Icon(Icons.home),
            ),
            Tab(
              icon: Icon(Icons.bar_chart_rounded),
            ),
          ],
        ),
      )
    );
  }
}