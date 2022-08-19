import 'package:flutter/material.dart';
import 'package:flutter_cozy/pages/splash_page.dart';
import 'package:flutter_cozy/providers/space_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SpaceProvider(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Splashpage(),
      ),
    );
  }
}
