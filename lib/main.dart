import "package:bloc/bloc.dart";
import "package:flutter/material.dart";
import "package:scu_app/vehicle_observer.dart";
import "presentation/homescreen.dart";

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = const VehicleObserver();
  runApp(const ScuApp());
}

class ScuApp extends StatelessWidget {
  const ScuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(),
      home: const Homescreen(),
    );
  }
}
