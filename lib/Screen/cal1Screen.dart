import 'package:flutter/material.dart';
import 'package:project/Provider/rankDataProvider.dart';
import 'package:project/functions/func.dart';
import 'package:provider/provider.dart';

//global
bool checkDataTrue = false;
bool checkDataTrue2 = false;

class Cal1Screen extends StatefulWidget {
  const Cal1Screen({super.key});

  @override
  State<Cal1Screen> createState() => _Cal1ScreenState();
}

class _Cal1ScreenState extends State<Cal1Screen> {
  String valueChoose = "มวล";
  double result = 0;
  List<String> _dropDownMenuItems = [
    "มวล",
    "ปริมาตรที่ STP",
    "จำนวนอะตอมหรือโมเลกุล",
  ];

  final key = GlobalKey<FormState>();
  final _substanceController = TextEditingController();
  final _data2Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cal 1"),
      ),
      body: Consumer(
        builder: (context, rankDataProvider provider,Widget? child) {
          return Form(
            key: key,
            child: ListView(
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
                              Expanded(
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: 'กรอกสาร/ธาตุ',
                                    ),
                                    validator: (value){
                                      if(value == null || value.isEmpty){
                                        return "กรุณากรอกสาร/ธาตุ";
                                      }
                                      if(checkDataTrue){
                                        return "กรุณากรอกสาร/ธาตุ ให้ถูกต้อง";
                                      }
                                      return null;
                                    },
                                    controller: _substanceController,
                                  ),
                              ), 
                          ],
                        ),
                      ),
                    ),
                  ),
                //dropdown
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Container(
                    height: 160,
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
                              child: TextFormField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: textFieldBoxText(valueChoose),
                                  ),
                                  validator: (value){
                                    if(value == null || value.isEmpty){
                                      return "กรุณากรอกข้อมูล";
                                    }else if(checkDataTrue2){
                                      return "กรุณากรอกข้อมูลให้ถูกต้อง";
                                    }
                                    return null;
                                  },
                                  controller: _data2Controller,
                                ),
                          ),
                      ],
                    ),
                  ),
                ),
                //button
                Center(
                  child: ElevatedButton(
                    onPressed: (){
                      String temp = "";
                      checkDataTrue = false;
                      checkDataTrue2 = false;

                      String substance = manageSubsacnceData(_substanceController.text);
                      String _decorSubstance1 = decorSubstance1(substance);
                      temp = _decorSubstance1;
                      String _decorSubstance2 = decorSubstance2(_decorSubstance1);
                      List<String> equation = makeEquation(_decorSubstance2);
                      List<String> equation2 = infixToPostfix(equation);
                      List<String> equation3 = elementToAtomicmass(equation2);
                      double answer = calculate(equation3);
                      if(key.currentState!.validate()){
                          if(valueChoose == "มวล"){
                            //มวล
                            setState(() {
                              if(answer == 0){
                                result = 0;
                              }else{
                                try{
                                  double temp = double.parse(_data2Controller.text);
                                  result = temp / answer;
                                } catch(e) {
                                  checkDataTrue2 = true;
                                  result = 0;
                                }
                              }
                            });
                            key.currentState!.validate();
                          }
                          else if(valueChoose == "จำนวนอะตอมหรือโมเลกุล"){
                            //จำนวนอะตอมหรือโมเลกุล
                            setState(() {    
                              try{
                                double temp = double.parse(_data2Controller.text);
                                result = temp / 6.02214076e+23;
                              } catch(e) {
                                checkDataTrue2 = true;
                                result = 0;
                                key.currentState!.validate();
                              }
                            });
                          }
                          else {
                            //ปริมาตรที่ STP
                            setState(() {
                              try{
                                double temp = double.parse(_data2Controller.text);
                                result = temp / 22.4;
                              } catch(e) {
                                checkDataTrue2 = true;
                                result = 0;
                                key.currentState!.validate();
                              }

                            });
                          }
                          if(!checkDataTrue && !checkDataTrue2) provider.addRankData(temp);
                      }else{
                        setState(() {
                          result = 0;
                        });
                      }
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
                              child: Text(numberFormat(result) + " mols", style: TextStyle(fontSize: 20))
                            ),
                          )
                      ],
                    ),
                  ),
                )
              ]
            ),
          );
        },
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

