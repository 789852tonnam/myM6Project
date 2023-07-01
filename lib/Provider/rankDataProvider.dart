//provider
import 'package:flutter/material.dart';
import 'package:project/Provider/rankData.dart';

class rankDataProvider with ChangeNotifier{
  Map<rankData, int> _rankDataMap = {
    rankData("fire") : 4,
    rankData("earth") : 2,
    rankData("water") : 3,
    rankData("air") : 1,
  };

  void addRankData(rankData rankData){
    if(_rankDataMap.containsKey(rankData)){
      _rankDataMap[rankData] = _rankDataMap[rankData]! + 1;
    }else{
      _rankDataMap[rankData] = 1;
    }
    notifyListeners();
  }

  void decreaseRankData(rankData rankData){
    if(_rankDataMap.containsKey(rankData) && _rankDataMap[rankData]! > 0){
      _rankDataMap[rankData] = _rankDataMap[rankData]! - 1;
    }else if(_rankDataMap.containsKey(rankData) && _rankDataMap[rankData]! == 0){
      _rankDataMap.remove(rankData);
    }else{
      return;
    }
    notifyListeners();
  }

  Map<rankData, int> getrankData(){
    return _rankDataMap;
  }

  void sortRankData(){
    _rankDataMap = Map.fromEntries(_rankDataMap.entries.toList()..sort((a, b) => b.value.compareTo(a.value)));
  }
}