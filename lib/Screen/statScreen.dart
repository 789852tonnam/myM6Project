import 'package:flutter/material.dart';
import 'package:project/Provider/rankDataProvider.dart';
import 'package:provider/provider.dart';

import '../Provider/rankData.dart';

class StatScreen extends StatefulWidget {
  const StatScreen({super.key});

  @override
  State<StatScreen> createState() => _StatScreenState();
}

class _StatScreenState extends State<StatScreen> {
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
      body: Consumer(
        builder: (context, rankDataProvider provider,Widget? child) {
          provider.sortRankData();
          List<rankData> rankDataKeyList = [];
          List<int> rankDataValueList = [];
          for(var i in provider.getrankData().entries){
            rankDataKeyList.add(i.key);
          }
          for(var i in provider.getrankData().entries){
            rankDataValueList.add(i.value);
          }

          return ListView.builder(
            itemCount: provider.getrankData().length,
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
                            child: Center(child: Text(rankDataKeyList[index].name,style: TextStyle(fontSize: 20),)),
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
                        child: Center(child: Text("${rankDataValueList[index]}",style: TextStyle(fontSize: 20),)),
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