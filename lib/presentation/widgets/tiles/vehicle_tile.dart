import 'package:flutter/material.dart';
import 'package:scu_app/data/models/vehicle_model.dart';
import 'package:scu_app/presentation/business_logic/vehicle/bloc/vehicle_bloc.dart';

class VehicleTile extends StatelessWidget {
  final VehicleModel? vehicle;
  final VehicleBloc bloc;
  const VehicleTile({required this.vehicle, required this.bloc, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: Text(vehicle!.id.toString()),
        title: Text(
          vehicle!.make!,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          vehicle!.model!,
          style: const TextStyle(fontSize: 18),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () {
                bloc.add(VehicleRemoved(vehicle!.id!));
              },
              icon: const Icon(Icons.delete),
            ),
          ],
        ),
      ),
    );
  }
}
