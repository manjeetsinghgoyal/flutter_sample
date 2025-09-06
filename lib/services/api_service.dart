import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/customer.dart';

class ApiService {
  final String baseUrl = "http://103.178.97.26:8070/cmgsrv2/GetCustomerDetailsMMG";

  Future<Customer> getCustomerDetails() async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "userId": "shyam.1",
        "insertedon": "0",
        "role": "ENG",
        "APK_VERSION": "CMM_2.3.6"
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return Customer.fromJson(data);
    } else {
      throw Exception("Failed to fetch data: ${response.statusCode}");
    }
  }
}
