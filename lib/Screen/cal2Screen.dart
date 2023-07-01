import 'package:flutter/material.dart';

class Cal2Screen extends StatefulWidget {
  const Cal2Screen({super.key});

  @override
  State<Cal2Screen> createState() => _Cal2ScreenState();
}

class _Cal2ScreenState extends State<Cal2Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cal 2"),
      ),
      body: ListView(
        children: [
          //สารธาตุ
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.green.shade300,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Row(
                  children: [
                    Text("สาร/ธาตุ : ", style: TextStyle(fontSize: 20,),),
                    Form(
                      child:Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'กรอก สาร/ธาตุ',
                          ),
                        )
                      ) 
                    )
                  ],
                ),
              ),
            ),
          ),
          //จำนวนโมล
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.green.shade300,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Row(
                  children: [
                    Text("จำนวนโมล : ", style: TextStyle(fontSize: 20,),),
                    Form(
                      child:Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'กรอก จำนวนโมล',
                          ),
                        )
                      ) 
                    )
                  ],
                ),
              ),
            ),
          ),
          //ปุ่มคำนวณ
          //button
          Center(
            child: ElevatedButton(
              onPressed: (){
          
              }, 
              child: Text("คำนวณ", style: TextStyle(fontSize: 20),)
            ),
          ),
          //result
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Container(
              alignment: Alignment.topLeft,
              height: 220,
              decoration: BoxDecoration(
                color: Colors.green.shade300,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        SizedBox(width: 10,),
                        Text("ผลลัพท์ :", style: TextStyle(fontSize: 20)),
                        Expanded(child: SizedBox())
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Container(
                        height: 40,
                        alignment: Alignment.center,  
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text("0.0"+" g", style: TextStyle(fontSize: 20))
                                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Container(
                        height: 40,
                        alignment: Alignment.center,  
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text("0.0"+" dm\u00B3", style: TextStyle(fontSize: 20))
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Container(
                        height: 40,
                        alignment: Alignment.center,  
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text("0.0"+" atoms", style: TextStyle(fontSize: 20))
                      ),
                    )
                ],
              ),
            ),
          )
        ]
      ),
      //home button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
        child: FloatingActionButton(
          onPressed: (){
            Navigator.pop(context);
          },
          child: Icon(Icons.home_filled),
        ),
      ),
    );
  }
}