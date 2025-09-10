import 'package:flutter/material.dart';
import '../../core/exceptions.dart';
import '../../domain/repositories/auth_repository.dart';

class LoginViewModel extends ChangeNotifier {
  final AuthRepository _repository;
  LoginViewModel(this._repository);


  bool _isLoading = false;
  bool get isLoading => _isLoading;


  Future<String?> login(String username, String password) async {
    try {
      _isLoading = true;
      notifyListeners();
      final result = await _repository.login(username, password);
      _isLoading = false;
      notifyListeners();
      if (result.status == "Success") {
        return null; // success
      } else {
        return result.message;
      }
    } on CustomException catch (e) {
      _isLoading = false;
      notifyListeners();
      return e.message;
    }
  }
}