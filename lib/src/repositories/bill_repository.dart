import '../models/bill_reading.dart';
import '../data/sqlite_service.dart';
import '../services/retrofit_api.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class BillRepository {
  final RetrofitApi api;
  BillRepository(this.api);

  Future<void> saveReading(BillReading reading) async {
    //insert into db
    await SQLiteService.insertReading(reading.toJson());

    final connectivity = await Connectivity().checkConnectivity();
    if (connectivity != ConnectivityResult.none) {
      await syncPendingReadings();
    }
  }

  Future<void> syncPendingReadings() async {
    final pending = await SQLiteService.getPendingReadings();
    for (var row in pending) {
      final reading = BillReading.fromJson(row);
      try {
        final resp = await api.uploadReading(reading);
        if (resp.statusCode == 200 || resp.statusCode == 201) {
          await SQLiteService.markAsSynced(reading.id);
        }
      } catch (e) {
        // remain pending
      }
    }
  }
}

// api call
//1. api call --> sync on cloud --- no doubt

//2. api call --> sync on cloud --> network lost/Battery problem
//2.1 inset into db
//2.2 we were calling api and waiting for result
//2.3 if result is coming successfully we can change sync param in local db
//sync that still in 0 state
// it should go on server --> id data server should ignore this record
//3. api call --> sync on cloud in between network lost
//4. api call --> network lost

//It will take time and effort of server and client
//Data pack will require more data
//Battery consumption is high as compare to other approach

//one api will take one reading at a time
//Data send via api call to server
// 1 reading person
//60 home -->visit
//60 reading data ---> 1 -->1 -->1
//approx i need 1 hour
//server or client engage
// take 1 hour


//two api will take one reading at a time  b
//Data send via api call to server
// 1 reading person
//60 home -->visit
//60 reading data ---> 1 -->1 -->1
//approx i need 1/2 hour
//server or client engage
// take 1 hour

//bunch 10 record in single api call

//60/10 = 6 min
//60 min -->6min// server trip

//form --> data enter --> submit -->db ops --> sync operation(server trip )-->server response
//-->parse -->db oper

//Data pack min
//server enagage
//battery google map location sharing,real time application


//paging concept best facebook or tick, instagram load few record as per your network bandwidth
//no of record on ui --- trip
//hotstar -- no of user --> data pack -- network --4g


///what chat 1 to 1 15 records  10000 chat
///15 records
///it should also download 30 records --- >15 record show --> db trip next 15 record likh listview add
///5+15 ---> +15
///
/// server api (start,no of records)
/// 10, 40