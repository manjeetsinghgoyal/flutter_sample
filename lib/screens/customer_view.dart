import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/customer_viewmodel.dart';

class CustomerView extends StatelessWidget {
  const CustomerView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CustomerViewModel()..fetchCustomerDetails(),
      child: Scaffold(
        appBar: AppBar(title: const Text("Customer Details")),
        body: Consumer<CustomerViewModel>(
          builder: (context, vm, child) {
            if (vm.loading) {
              return const Center(child: CircularProgressIndicator());
            } else if (vm.error != null) {
              return Center(child: Text("Error: ${vm.error}"));
            } else if (vm.customer != null) {
              return Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("UserId: ${vm.customer!.userId}", style: const TextStyle(fontSize: 18)),
                    Text("Role: ${vm.customer!.role}", style: const TextStyle(fontSize: 16)),
                    Text("APK Version: ${vm.customer!.apkVersion}", style: const TextStyle(fontSize: 16)),
                  ],
                ),
              );
            } else {
              return const Center(child: Text("No Data"));
            }
          },
        ),
      ),
    );
  }
}
