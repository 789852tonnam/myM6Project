import 'package:flutter/material.dart';
import 'package:project/Screen/cal1Screen.dart';
import 'package:project/Screen/cal2Screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
              appBar: AppBar(
                title: Text("Home"),
              ),
              body: Column(children: [
                //logo

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
                  child: Container(
                    child: Center(child: Image.asset("img/icons/logo.png")),
                    height: 170,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.green.shade500,
                    ),
                  ),
                ),
                SizedBox(height: 70,),
                //cal1 button
                ElevatedButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return Cal1Screen();
                  }));
                }, 
                  child: Container(
                    child: Center(child: Text("Cal 1",style: TextStyle(fontSize: 20),)),
                    height: 50,
                    width: 200,
                  ),
                ),
                SizedBox(height: 10,),

                //cal2 button
                ElevatedButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return Cal2Screen();
                  }));
                }, 
                  child: Container(
                    child: Center(child: Text("Cal 2",style: TextStyle(fontSize: 20),)),
                    height: 50,
                    width: 200,
                  ),
                )
              ]),
            );
  }
}