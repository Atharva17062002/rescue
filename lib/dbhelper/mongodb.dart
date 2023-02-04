import 'dart:developer';

import 'package:mongo_dart/mongo_dart.dart';
import 'package:rescue/dbhelper/constant.dart';

class MongoDatabase{
  static var db, userCollection;
  static connect() async{
    db= await Db.create(MONGO_CONN_URL);
     await db.open();
     inspect(db);
     userCollection= db.collection(USER_COLLECTION);

  }
static Future<List<Map<String,dynamic>>> getData() async {
    final arrData = await userCollection.find().toList();
    return arrData;
}
}

