import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chat/features/product/data/datasources/product_remote_data_source.dart';
import 'package:chat/features/product/data/repositories/product_repository_impl.dart';
import 'package:chat/features/product/presentation/bloc/product_bloc.dart';
import 'package:chat/features/product/presentation/bloc/product_event.dart';
import 'package:chat/features/product/presentation/pages/product_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProductBloc(
        ProductRepositoryImpl(FakeProductRemoteDataSource()),
      )..add(LoadProducts()),
      child: MaterialApp(
        title: 'Clean Arch Demo',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const ProductPage(),
      ),
    );
  }
}
