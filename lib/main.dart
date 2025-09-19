import 'package:flutter/material.dart';
import 'src/ui/screens/add_reading_screen.dart';
import 'src/repositories/bill_repository.dart';
import 'src/services/api_client.dart';
import 'src/services/retrofit_api.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final apiClient = ApiClient.create();
  final api = RetrofitApi(apiClient);
  final repo = BillRepository(api);
  runApp(MyApp(repo));
}

class MyApp extends StatelessWidget {
  final BillRepository repo;
  const MyApp(this.repo, {super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tata Power Bill Reading',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: AddReadingScreen(repository: repo),
    );
  }
}