import 'package:flutter/material.dart';
import 'package:habbition_ui/services/controller/homescreen_controller.dart';
import 'package:habbition_ui/view/Bottomnavibarscreen/bottomnavibar.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HomescreenController(),
        )
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false, home: Bottomnavibarscreen()),
    );
  }
}
