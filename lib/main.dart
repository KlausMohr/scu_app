import "package:flutter/material.dart";
import "package:scu_app/presentation/homescreen.dart";

void main() {
  runApp(const ScuApp());
}

class ScuApp extends StatelessWidget {
  const ScuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        darkTheme: ThemeData.dark(),
        home: const Homescreen());
  }
}
