//provider
import 'package:flutter/material.dart';
import 'package:project/database/rankData_db.dart';

class rankDataProvider with ChangeNotifier{
  Map<String, int> _rankDataMap = {
  };

  void initData () async{
    var db = await rankDataDB(dbName: 'rankData.db');
    db.openDatabase();
    _rankDataMap = await db.getData();
    notifyListeners();
  }

  void addRankData(String rankData) async {
    var db = await rankDataDB(dbName: 'rankData.db');
    db.openDatabase();
    if(_rankDataMap.containsKey(rankData)){
      _rankDataMap[rankData] = _rankDataMap[rankData]! + 1;
    }else{
      _rankDataMap[rankData] = 1;
    }
    db.updateData(_rankDataMap);

    notifyListeners();
  }

  void loadRankData() async{
    var db = await rankDataDB(dbName: 'rankData.db');
    db.openDatabase();
    _rankDataMap = await db.getData();
    _rankDataMap = Map.fromEntries(_rankDataMap.entries.toList()..sort((a, b) => b.value.compareTo(a.value)));
  }

  Map<String, int> getData(){
    this.sortRankData();
    return _rankDataMap;
  }

  void sortRankData() async{
    _rankDataMap = Map.fromEntries(_rankDataMap.entries.toList()..sort((a, b) => b.value.compareTo(a.value)));
  }
}