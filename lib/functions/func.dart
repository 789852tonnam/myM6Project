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

bool isSuperLetter(String str){
  return str.contains(new RegExp(r'[A-Z]')) || str.contains(new RegExp(r'[a-z]')) || str.contains("(") || str.contains(")");
}

bool isNumber(String str){
  return str.contains(new RegExp(r'[0-9]'));
}

String insertString(String str, int index, String insertStr){
  return str.substring(0, index) + insertStr + str.substring(index, str.length);
}

String decorSubstance1(String str){
    for(int i = str.length-1; i >= 1; i--){
    if(i == str.length-1 && str[i] == "1"){
      if(isSuperLetter(str[i-1])){
        str = str.replaceRange(i, i+1, "");
        continue;
      }
    }
    if(str[i] == '1'){
      if(isSuperLetter(str[i-1]) && isSuperLetter(str[i+1])){
        str = str.replaceRange(i, i+1, "");
        continue;
      }
    }
  }
  return str;
}

String decorSubstance2(String str){
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
      try{
        while(stack.last != "("){
          postfix.add(stack.removeLast());
        }
      }catch(e){
        checkDataTrue = true;
        return postfix;
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
  if(num == 0) return "0.000 x 10⁰";
  
  int m=0;
  while(num>=10||num<1){
    if(num>=10){
      num/=10;
      m++;
    }else if(num<1){
      num*=10;
      m--;
    }
  }
  num*=1000;
  num = num.roundToDouble();
  num/=1000;

  if(num == 10){
    num = 1;
    m++;
  }
  
  String temp = m.toString();
  String str = "";
  for(int i=0; i<temp.length; i++){
    if(temp[i] == "-"){
      str += "⁻";
    }else if(temp[i] == "1"){
      str += "¹";
    }else if(temp[i] == "2"){
      str += "²";
    }else if(temp[i] == "3"){
      str += "³";
    }else if(temp[i] == "4"){
      str += "⁴";
    }else if(temp[i] == "5"){
      str += "⁵";
    }else if(temp[i] == "6"){
      str += "⁶";
    }else if(temp[i] == "7"){
      str += "⁷";
    }else if(temp[i] == "8"){
      str += "⁸";
    }else if(temp[i] == "9"){
      str += "⁹";
    }else if(temp[i] == "0"){
      str += "⁰";
    }
  }
  return num.toStringAsFixed(3) + " x 10" + str;
}