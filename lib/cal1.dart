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
                    //element
                    ElementChanel(),
                    SizedBox(height: 20,),

                    //mass
                    MassChanel(),
                    SizedBox(height: 20,),

                    //Volume
                    VolumeChanel(),
                    SizedBox(height: 20,),

                    //Calculate button
                    ElevatedButton(
                      onPressed: (){
                    }, 
                      child: Text("คำนวณ", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),)
                    ),
                    SizedBox(height: 20,),
                  ],
                ),
              ),
            ),
            //Show result
            ShowResult(),
          ],
        ),
        //Home button
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.home, size: 30,),
          onPressed: (){
            while(Navigator.canPop(context)){
              Navigator.pop(context);
            }
          },
        ),
      ),
      theme: ThemeData(primarySwatch: Colors.green, scaffoldBackgroundColor: Colors.grey.shade900),
    );
  }
}

class ElementChanel extends StatelessWidget {
  const ElementChanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("สาร/ธาตุ  : ", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),),
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter your molecule',
                labelStyle: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MassChanel extends StatelessWidget {
  const MassChanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(width: 47,),
          Text("มวล : ", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),),
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter your mass',
                labelStyle: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class VolumeChanel extends StatelessWidget {
  const VolumeChanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(width: 11,),
          Column(
            children: [
              Text("ปริมาตร : ", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),),
              Text("ที่STP ", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),),
            ],
          ),
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter your volume',
                labelStyle: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ShowResult extends StatelessWidget {
  const ShowResult({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        alignment: Alignment.topLeft,
        decoration: BoxDecoration(
            color: Colors.green[200],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              SizedBox(height: 20,),
              Row(
                children: [
                  SizedBox(width: 20,),
                  Text("ผลลัพธ์", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Color.fromARGB(255, 0, 115, 35)
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 10,),
                      Text("Result!!", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700,color: Color.fromARGB(255, 255, 255, 255))),
                      SizedBox(height: 10,),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,)
            ],
          ),
      ),
    );
  }
}