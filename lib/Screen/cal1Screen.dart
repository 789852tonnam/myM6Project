import 'package:flutter/material.dart';
import 'package:project/data/atomicMass.dart';

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
    "จำนวนอะตอม",
  ];

  final key = GlobalKey<FormState>();
  final key2 = GlobalKey<FormState>();
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
                        Expanded(
                          child: Form(
                            key: key,
                            child: TextFormField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'กรอก สาร/ธาตุ',
                              ),
                              validator: (value){
                                if(value == null || value.isEmpty){
                                  return "กรุณากรอก สาร/ธาตุ";
                                }
                                if(checkDataTrue){
                                  return "กรุณากรอก สาร/ธาตุ ให้ถูกต้อง";
                                }
                                return null;
                              },
                              controller: _substanceController,
                            ),
                          )
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
                      child:  Form(
                        key: key2,
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
                checkDataTrue = false;
                checkDataTrue2 = false;
                if(key.currentState!.validate() && key2.currentState!.validate()){
                    if(valueChoose == "มวล"){
                      String substance = manageSubsacnceData(_substanceController.text);
                      // print(substance);
                      String _decorSubstance = decorSubstance(substance);
                      // print(_decorSubstance);
                      List<String> equation = makeEquation(_decorSubstance);
                      // print(equation);
                      List<String> equation2 = infixToPostfix(equation);
                      // print(equation2);
                      List<String> equation3 = elementToAtomicmass(equation2);
                      // print(equation3);
                      double answer = calculate(equation3);
                      // print(answer);
                      key.currentState!.validate();
                      
                      setState(() {
                        if(answer == 0){
                          result = 0;
                        }else{
                          try{
                            double temp = double.parse(_data2Controller.text);
                            result = temp / answer;
                          } catch(e) {
                            checkDataTrue2 = true;
                            key2.currentState!.validate();
                          }
                        }
                      });
                    }
                    else if(valueChoose == "จำนวนอะตอม"){
                      setState(() {    
                        try{
                          double temp = double.parse(_data2Controller.text);
                          result = temp / 6.02214076e+23;
                        } catch(e) {
                          checkDataTrue2 = true;
                          key2.currentState!.validate();
                        }
                      });
                    }
                    else{
                      setState(() {
                        try{
                          double temp = double.parse(_data2Controller.text);
                          result = temp / 22.4;
                        } catch(e) {
                          checkDataTrue2 = true;
                          key2.currentState!.validate();
                        }
                      });
                    }
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
                        child: Text("$result"+ " mols", style: TextStyle(fontSize: 20))
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


//function
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

String manageSubsacnceData(String _substanceController){
  String substance = _substanceController;
  substance = substance.replaceAll(" ", "");
  return substance;
}

bool isLetter(String str){
  if(str == "("){
    return true;
  }
  return str.contains(new RegExp(r'[A-Z]'));
}

bool isNumber(String str){
  return str.contains(new RegExp(r'[0-9]'));
}

String insertString(String str, int index, String insertStr){
  return str.substring(0, index) + insertStr + str.substring(index, str.length);
}

String decorSubstance(String str){
  for(int i = str.length-1; i >= 1; i--){
    if(isLetter(str[i])){
      if(str[i-1] == "("){
        continue;
      }
      str = insertString(str, i, "+");
    }else if(isNumber(str[i])){
      str = insertString(str, i, "*");
    }
  }

  return str;
}

List<String> makeEquation(String str){
  List<String> equation = [];
  String temp = "";
  for(int i = 0; i < str.length; i++){
    if(str[i] == "+"){
      if(temp.isNotEmpty) equation.add(temp);
      equation.add("+");
      temp = "";
    }else if(str[i] == "*"){
      if(temp.isNotEmpty) equation.add(temp);
      equation.add("*");
      temp = "";
    }else if(str[i] == "("){
      if(temp.isNotEmpty) equation.add(temp);
      equation.add("(");
      temp = "";
    }else if(str[i] == ")"){
      if(temp.isNotEmpty) equation.add(temp);
      equation.add(")");
      temp = "";
    }
    else{
      temp += str[i];
    }
  }
  equation.add(temp);
  return equation;
}

List<String> infixToPostfix(List<String> equation){
  List<String> postfix = [];
  List<String> stack = [];
  stack.add("(");
  equation.add(")");
  while(equation.isNotEmpty){
    String temp = equation.removeAt(0);
    if(temp == "("){
      stack.add(temp);
    }else if(temp == ")"){
      while(stack.last != "("){
        postfix.add(stack.removeLast());
      }
      stack.removeLast();
    }else if(temp == "+" || temp == "*"){
      if(temp == "+"){
        while(stack.last == "*" || stack.last == "+"){
          postfix.add(stack.removeLast());
        }
      }else{
        while(stack.last == "*"){
          postfix.add(stack.removeLast());
        }
      }
      stack.add(temp);
    }else{
      postfix.add(temp);
    }
  }
  return postfix;
}

List<String> elementToAtomicmass(List<String> equation){
  for(int i=0; i<equation.length; i++){
    if(atomicMass.containsKey(equation[i])){
      equation[i] = atomicMass[equation[i]].toString();
      continue;
    }else if(equation[i] == "+" || equation[i] == "*" || equation[i] == "(" || equation[i] == ")"){
      continue;
    }else{
      // break;
    }
  }
  return equation;
}

double calculate(List<String> equation){
  List<double> stack = [];
  for(int i=0; i<equation.length; i++){
    if(equation[i] == "+"){
      double a = stack.removeLast();
      double b = stack.removeLast();
      stack.add(a+b);
    }else if(equation[i] == "*"){
      double a = stack.removeLast();
      double b = stack.removeLast();
      stack.add(a*b);
    }else{
      try {
        double temp = double.parse(equation[i]);
        stack.add(temp);
      } catch(e){
        checkDataTrue = true;
        return 0;
      }
    }
  }
  return stack.removeLast();
}