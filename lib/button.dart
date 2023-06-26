import 'package:flutter/material.dart';
import 'package:project/cal1.dart';

class ButtonCal extends StatelessWidget {
  String text;

  ButtonCal(this.text){

  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(width: 10,),
        Container(
          width: 250,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 72, 183, 60),
            borderRadius: BorderRadius.circular(20)
          ),
          child: TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            ),
            onPressed: () {
              if(this.text=="Cal 1"){
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context){
                    return Cal1();
                  })
                );
              }else{

              }
            },
            child: Text(text,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700)),
          ),
        ),
        SizedBox(width: 10,),
      ],
    );
  }
}