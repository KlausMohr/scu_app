import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scu_app/presentation/business_logic/vehicle/bloc/vehicle_bloc.dart';
import 'package:scu_app/presentation/widgets/tiles/vehicle_tile.dart';

class VehicleBuilder extends StatefulWidget {
  VehicleBuilder({super.key});

  @override
  State<VehicleBuilder> createState() => _VehicleBuilderState();
}

class _VehicleBuilderState extends State<VehicleBuilder> {
  late final VehicleBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = VehicleBloc();
    bloc.add(VehicleFetched());
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VehicleBloc, VehicleState>(builder: (context, state) {
      switch (state.status) {
        case VehicleStatus.failure:
          return const Center(
            child: Text("Falha ao carregar veículos!"),
          );
        case VehicleStatus.success:
          if (state.vehicles.isEmpty) {
            return const Center(
              child: Text("Nenhum veículo cadastrado!"),
            );
          }
          return ListView.builder(
            shrinkWrap: true,
            itemCount: state.vehicles.length,
            itemBuilder: (context, index) {
              return VehicleTile(
                vehicle: state.vehicles[index],
              );
            },
          );
        case VehicleStatus.initial:
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
      }
    });
  }
}
