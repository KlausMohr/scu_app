import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:scu_app/presentation/business_logic/vehicle/bloc/vehicle_bloc.dart";
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
    return MultiBlocProvider(
        providers: [
          BlocProvider<VehicleBloc>(
            create: (context) => VehicleBloc(),
          )
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          darkTheme: ThemeData.dark(),
          home: const Homescreen(),
        ));
  }
}
