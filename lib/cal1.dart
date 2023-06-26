import "package:flutter/material.dart";

class Cal1 extends StatelessWidget {
  const Cal1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "cal1",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Cal 1", style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),),
        ),
        body: ListView(
          children: [

            //กรอบแรก
            Padding(
              padding: const EdgeInsets.all(12),
              child: Container( 
                decoration: BoxDecoration(
                  color: Colors.green[200],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("สาร/ธาตุ  : ", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),),
                        Container(width: 200,
                          child: Expanded(
                            child: TextFormField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Enter you molecule',
                                labelStyle: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20,),
                  ],
                ),
              ),
            ),
          ],

          //กรอบสอง
        ),
      ),
      theme: ThemeData(primarySwatch: Colors.green, scaffoldBackgroundColor: Colors.grey.shade900),
    );
  }
}