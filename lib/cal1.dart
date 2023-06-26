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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("สาร/ธาตุ  : ", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),),
                        Container(width: 230,
                          child: Expanded(
                            child: TextFormField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Enter your molecule',
                                labelStyle: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20,),

                    //mass
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(width: 50,),
                        Text("มวล : ", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),),
                        Container(width: 230,
                          child: Expanded(
                            child: TextFormField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Enter your mass',
                                labelStyle: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20,),

                    //Volume
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(width: 10,),
                        Column(
                          children: [
                            Text("ปริมาตร : ", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),),
                            Text("ที่STP ", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),),
                          ],
                        ),
                        Container(width: 230,
                          child: Expanded(
                            child: TextFormField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Enter your volume',
                                labelStyle: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
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
            Padding(
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
            ),

          ],
        ),

        //show Author
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.info, size: 30,),
          onPressed: (){
            showDialog(
              context: context, 
              builder: (BuildContext context) => AlertDialog(
                title: const Text('Made by'),
                content: const Text('C. Chaiyasorn\nP. Ponumpai\nH. Sahapornchai'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'Cancel'),
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'OK'),
                    child: const Text('OK'),
                  ),
                ],
              ),
            );
          },
        ),


      ),
      theme: ThemeData(primarySwatch: Colors.green, scaffoldBackgroundColor: Colors.grey.shade900),
    );
  }
}