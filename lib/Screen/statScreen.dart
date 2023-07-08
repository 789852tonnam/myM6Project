import 'package:flutter/material.dart';
import 'package:project/Provider/rankDataProvider.dart';
import 'package:provider/provider.dart';

class StatScreen extends StatefulWidget {
  const StatScreen({super.key});

  @override
  State<StatScreen> createState() => _StatScreenState();
}

class _StatScreenState extends State<StatScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<rankDataProvider>(context, listen: false).initData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text("Rank"), 
            Expanded(child: 
              Center(
                child: Text("Element")
              )
            ),
            Text("Score")
          ],
        ),
      ),
      //listview builder
      body: Consumer (
        builder: (context, rankDataProvider provider,Widget? child) {
          List<MapEntry<String, int>> rankDataList = provider.getData().entries.toList();

          return ListView.builder(
            itemCount: rankDataList.length,
            itemBuilder: (context, index,) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                child: SizedBox(
                  height: 60,
                  child: Row(
                    children: [
                      //number
                      Container(
                        height: 60,
                        width: 75,
                        decoration: BoxDecoration(
                          color: Colors.green.shade500,
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 3),
                          child: CircleAvatar(
                            child: Center(
                              child: Text("${index+1}",style: TextStyle(fontSize: 20),)
                            ),
                          ),
                        ),
                      ),
                      //element
                      Expanded(child: 
                        SizedBox(
                          height: 60,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.green.shade300,
                            ),
                            child: Center(child: Text(rankDataList[index].key,style: TextStyle(fontSize: 20),)),
                          ),
                        )
                      ),
                      //score
                      Container(
                        width: 75,
                        decoration: BoxDecoration(
                          color: Colors.green.shade500,
                          borderRadius: BorderRadius.only(topRight: Radius.circular(10), bottomRight: Radius.circular(10)),
                        ),
                        child: Center(child: Text("${rankDataList[index].value}",style: TextStyle(fontSize: 20),)),
                      )
                    ],
                  )
                ),
              );
            },
          );
        },
      ),
    );
  }
}