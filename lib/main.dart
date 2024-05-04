import "package:bloc/bloc.dart";
import "package:flutter/material.dart";
import "package:scu_app/vehicle_observer.dart";
import "presentation/homescreen.dart";

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = const VehicleObserver();
  runApp(ScuApp());
}

class ScuApp extends StatelessWidget {
  ScuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(),
      home: Homescreen(),
    );
  }
}
