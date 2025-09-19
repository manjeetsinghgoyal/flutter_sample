import 'package:dio/dio.dart';
import 'api_client.dart';
import '../models/bill_reading.dart';

class RetrofitApi {
  final ApiClient client;
  RetrofitApi(this.client);

  Future<Response> uploadReading(BillReading reading) async {
    return client.dio.post(
      'https://jsonplaceholder.typicode.com/posts',
      data: reading.toJson(),
    );
  }
}