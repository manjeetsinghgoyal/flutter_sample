import 'package:flutter/material.dart';
import 'custombutton.dart';
/// Custom exception class
class CustomException implements Exception {
  final Object message;
  CustomException(this.message);

  @override
  String toString() => "CustomException: $message";
}

/// A service class to simulate API call
class FakeApiService {
  Future<String> fetchData(bool shouldFail) async {
    await Future.delayed(const Duration(seconds: 2));
    if (shouldFail) {
      throw CustomException("Failed to fetch data from server.");
    }
    return "API Data Loaded Successfully!";
  }
}

class ErrorHandlingDemo extends StatefulWidget {
  @override
  _ErrorHandlingDemoState createState() => _ErrorHandlingDemoState();
}

class _ErrorHandlingDemoState extends State<ErrorHandlingDemo> {
  final FakeApiService _apiService = FakeApiService();
  String? _result;
  String? _error;
  bool _loading = false;

  Future<void> _loadData(bool fail) async {
    setState(() {
      _loading = true;
      _error = null;
      _result = null;
    });

    try {
      final data = await _apiService.fetchData(fail);
      setState(() {
        _result = data;
      });
    } on CustomException catch (e) {
      setState(() {
        _error = e.message as String?;
      });
    } catch (e) {
      setState(() {
        _error = "Unexpected Error: $e";
      });
    } finally {
      setState(() {
        _loading = false;
      });
    }
  }


  Widget _buildBody() {
    if (_loading) {
      return const CircularProgressIndicator();
    } else if (_error != null) {
      return Text(_error!, style: const TextStyle(color: Colors.red, fontSize: 16));
    } else if (_result != null) {
      return Text(_result!, style: const TextStyle(color: Colors.green, fontSize: 16));
    } else {
      return const Text("Press a button to fetch data");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Custom Error Handling Example")),
      body: Center(child: _buildBody()),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton.extended(
            heroTag: "success",
            label: const Text("Load Success"),
            icon: const Icon(Icons.check),
            onPressed: () => _loadData(false),
          ),
          const SizedBox(height: 12),
          FloatingActionButton.extended(
            heroTag: "failure",
            label: const Text("Load Failure"),
            icon: const Icon(Icons.error),
            onPressed: () => _loadData(true),
          ),
          CustomButton(label: "Save", onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Save Successfully."),
                duration: Duration(seconds: 2),backgroundColor: Colors.blue,)
            );
          }, color: Colors.green),
          CustomButton(label: "Cancel", onPressed: () {

            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Cancelled Event."),
                  duration: Duration(seconds: 2),backgroundColor: Colors.amber,)
            );
          }, color: Colors.red),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ErrorHandlingDemo(),
  ));
}
