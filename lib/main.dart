import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workshop/data/services/star_wars_service.dart';
import 'package:workshop/presentation/home/home_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => StarWarsService(),
      child: MaterialApp(
        title: 'Star Wars',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.yellow,
          ),
        ),
        home: const HomePage(),
      ),
    );
  }
}
