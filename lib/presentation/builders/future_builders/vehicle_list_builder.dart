import 'package:flutter/material.dart';
import 'package:scu_app/presentation/business_logic/bloc/vehicle_list/vehicle_list_bloc.dart';
import 'package:scu_app/presentation/widgets/tiles/vehicle_tile.dart';

class VehicleBuilder extends StatelessWidget {
  final VehicleListBloc bloc;
  const VehicleBuilder({required this.bloc, super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<VehicleListState>(
      stream: bloc.outputVehicle,
      builder: (context, state) {
        if (state.data is VehicleListLoading) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }

        if (state.data is VehicleListUpdated &&
            state.data!.vehicles.isNotEmpty) {
          final vehicles = state.data!.vehicles;

          return ListView.builder(
            shrinkWrap: true,
            itemCount: vehicles.length,
            itemBuilder: (context, index) {
              return VehicleTile(
                vehicle: vehicles[index],
              );
            },
          );
        } else {
          return const Center(
            child: Text(
              "Nenhum veículo cadastrado",
              style: TextStyle(fontSize: 22, color: Colors.red),
            ),
          );
        }
      },
    );
  }
}
