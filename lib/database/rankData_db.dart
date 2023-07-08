import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'package:sembast/sembast_io.dart';
import 'package:sembast/sembast.dart';

class rankDataDB{
  String dbName;

  rankDataDB({required this.dbName});

  Future<Database> openDatabase() async{
    Directory dataDirectory = await getApplicationDocumentsDirectory();
    String dataPath = join(dataDirectory.path, this.dbName);

    DatabaseFactory databaseFactory = await databaseFactoryIo;
    Database db = await databaseFactory.openDatabase(dataPath);
    return db;
  }

  //store
  Future<void> updateData(Map<String, int> dataMap) async {
    var db = await this.openDatabase();
    var store = intMapStoreFactory.store('rankData');
    if(await store.record(1).get(db) == null){
      store.record(1).put(db, dataMap);
    }else{
      store.record(1).update(db, dataMap);
    }
    db.close();
    return ;
  }

  //pull data
  Future<Map<String, int>> getData() async {
    Map<String, int> dataMap = {};
    var db = await this.openDatabase();
    var store = intMapStoreFactory.store('rankData');
    var data = await store.record(1).get(db);
    if(data!=null){
      for(var i in data!.entries){
        dataMap[i.key] = int.parse(i.value.toString());
      }
    }
    db.close();
    return dataMap;
  }
}