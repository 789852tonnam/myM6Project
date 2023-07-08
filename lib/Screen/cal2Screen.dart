import 'package:flutter/material.dart';
import 'package:project/Provider/rankDataProvider.dart';
import 'package:project/functions/func.dart';
import 'package:project/Screen/cal1Screen.dart';
import 'package:provider/provider.dart';

bool checkDataTrue3 = false;

class Cal2Screen extends StatefulWidget {
  const Cal2Screen({super.key});

  @override
  State<Cal2Screen> createState() => _Cal2ScreenState();
}

class _Cal2ScreenState extends State<Cal2Screen> {
  final _substanceController = TextEditingController();
  final _molController = TextEditingController();

  String mass = "0";
  String volume = "0";
  String atomAmount = "0";

  final key3 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cal 2"),
      ),
      body: Consumer(
        builder: (context, rankDataProvider provider,Widget? child) {
          return Form(
        key: key3,
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
                            }if(checkDataTrue){
                              return "กรุณากรอกสาร/ธาตุให้ถูกต้อง";
                            }
                            return null;
                          },
                          controller: _substanceController,
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
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'กรอกจำนวนโมล',
                          ),
                          validator: (value){
                            if(value == null || value.isEmpty){
                              return "กรุณากรอกจำนวนโมล";
                            }if(checkDataTrue3){
                              return "กรุณากรอกจำนวนโมลให้ถูกต้อง";
                            }
                            return null;
                          },
                          controller: _molController,
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
                  checkDataTrue = false;
                  checkDataTrue3 = false;
                  if(key3.currentState!.validate()){
                    String substance = manageSubsacnceData(_substanceController.text);
                    String _decorSubstance = decorSubstance(substance);
                    List<String> equation = makeEquation(_decorSubstance);
                    List<String> equation2 = infixToPostfix(equation);
                    List<String> equation3 = elementToAtomicmass(equation2);
                    double answer = calculate(equation3);
      
                    setState(() {
                      try {
                        double temp = double.parse(_molController.text);
                        mass = numberFormat(answer * temp);
                        volume = numberFormat(temp * 22.4);
                        atomAmount = numberFormat(temp * 6.02214076e+23);
                      } catch (e) {
                        checkDataTrue3 = true;
                      }
                    });
                    key3.currentState!.validate();
                  }
                  if(!checkDataTrue && !checkDataTrue3) provider.addRankData(_substanceController.text);
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
                          child: Text(mass+" g", style: TextStyle(fontSize: 20))
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
                          child: Text(volume+" dm\u00B3", style: TextStyle(fontSize: 20))
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
                          child: Text(atomAmount+" atoms", style: TextStyle(fontSize: 20))
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