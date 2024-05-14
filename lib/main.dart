import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:scu_app/presentation/business_logic/vehicle/bloc/vehicle_bloc.dart";
import "package:scu_app/presentation/screens/home_screen.dart";
import "package:scu_app/presentation/screens/vehicle_list_screen.dart";
import "package:scu_app/vehicle_observer.dart";

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
          title: "SCU APP",
          debugShowCheckedModeBanner: false,
          // darkTheme: ThemeData.dark(),
          initialRoute: '/',
          routes: {
            '/': (context) => const HomeScreen(),
            '/vehicles': (context) => const VehicleListScreen(),
          },
        ));
  }
}
