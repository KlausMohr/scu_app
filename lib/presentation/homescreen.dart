import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:scu_app/presentation/builders/future_builders/vehicle_list_builder.dart';
import 'package:scu_app/presentation/business_logic/bloc/vehicle_list/vehicle_list_bloc.dart';
import 'package:scu_app/presentation/widgets/cards/insert_vehicle_card.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  late final VehicleListBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = VehicleListBloc();
    bloc.inputVehicle.add(GetVehicle());
  }

  @override
  void dispose() {
    bloc.inputVehicle.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return ConstrainedBox(
              constraints: BoxConstraints(
                  maxHeight: constraints.maxHeight * 1,
                  maxWidth: constraints.maxWidth * 1),
              child: Column(
                children: [
                  VehicleInsertCard(
                    bloc: bloc,
                    constraints: constraints,
                  ),
                  const MaxGap(25),
                  VehicleBuilder(
                    bloc: bloc,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
