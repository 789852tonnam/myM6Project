import 'package:project/data/atomicMass.dart';
import 'package:project/Screen/cal1Screen.dart';

//function
String textFieldBoxText(String valueChoose){
  if (valueChoose == "มวล") {
    return "กรอกมวล(กรัม)";
  } 
  else if (valueChoose == "จำนวนอะตอมหรือโมเลกุล") {
    return "กรอกจำนวนอะตอม";
  }
  else {
    return "กรอกปริมาตรที่ STP(ลิตร)";
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

String numberFormat(double num){
  int m = 0;
  while(num>10){
    num/=10;
    m++;
  }
  num*=1000;
  num = num.roundToDouble();
  num/=1000;
  String str = num.toStringAsFixed(3);

  String power = m.toString();
  String power2 = "";

  for(int i=0; i<power.length; i++){
    if(power[i] == "1"){
      power2 += "\u00B9";
    }else if(power[i] == "2"){
      power2 += "\u00B2";
    }else if(power[i] == "3"){
      power2 += "\u00B3";
    }else if(power[i] == "4"){
      power2 += "\u2074";
    }else if(power[i] == "5"){
      power2 += "\u2075";
    }else if(power[i] == "6"){
      power2 += "\u2076";
    }else if(power[i] == "7"){
      power2 += "\u2077";
    }else if(power[i] == "8"){
      power2 += "\u2078";
    }else if(power[i] == "9"){
      power2 += "\u2079";
    }else if(power[i] == "0"){
      power2 += "\u2070";
    }
  }

  return str + " x 10" + power2;
}

