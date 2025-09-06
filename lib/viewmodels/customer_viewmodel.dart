import 'package:flutter/material.dart';
import '../models/customer.dart';
import '../services/api_service.dart';
// Login screen
//login ui (dart) view --> loginviewmodel --> loginservice layer
class CustomerViewModel extends ChangeNotifier {
  final ApiService _apiService = ApiService();

  Customer? _customer;
  Customer? get customer => _customer;

  bool _loading = false;
  bool get loading => _loading;

  String? _error;
  String? get error => _error;

  Future<void> fetchCustomerDetails() async {
    _loading = true;
    _error = null;
    notifyListeners();

    try {
      _customer = await _apiService.getCustomerDetails();
    } catch (e) {
      debugPrint("error in api parsing $e");
      _error = e.toString();
    }

    _loading = false;
    notifyListeners();
  }
}