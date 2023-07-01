import 'package:flutter/material.dart';

class Cal1Screen extends StatefulWidget {
  const Cal1Screen({super.key});

  @override
  State<Cal1Screen> createState() => _Cal1ScreenState();
}

class _Cal1ScreenState extends State<Cal1Screen> {
  String valueChoose = "มวล";
  List<String> _dropDownMenuItems = [
    "มวล",
    "ปริมาตรที่ STP",
    "จำนวนอะตอม"
  ];

  final _substanceController = TextEditingController();
  final _data2Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cal 1"),
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
                          controller: _substanceController,
                        )
                      ), 
                    )
                  ],
                ),
              ),
            ),
          ),
          //dropdown
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Container(
              height: 140,
              decoration: BoxDecoration(
                color: Colors.green.shade300,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10,10,0,10),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: DropdownButton(
                            value: valueChoose,
                            onChanged: (newValue) {
                              setState(() {
                                valueChoose = newValue!;
                              });
                            },
                            items: _dropDownMenuItems.map((valueItem) {
                              return DropdownMenuItem(
                                value: valueItem,
                                child: Text(valueItem, style: TextStyle(fontSize: 20,),),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                      Expanded(child: SizedBox())
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Form(
                      child:  TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: textFieldBoxText(valueChoose),
                          ),
                          controller: _data2Controller,
                        )
                      )
                    ),
                ],
              ),
            ),
          ),
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
              height: 100,
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
                        child: Text("0.0", style: TextStyle(fontSize: 20))
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

String textFieldBoxText(String valueChoose){
  if (valueChoose == "มวล") {
    return "กรอก มวล";
  } 
  else if (valueChoose == "จำนวนอะตอม") {
    return "กรอก จำนวนอะตอม";
  }
  else {
    return "กรอก ปริมาตรที่ STP";
  }
}