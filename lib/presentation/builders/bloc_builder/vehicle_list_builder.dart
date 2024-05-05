import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scu_app/presentation/business_logic/vehicle/bloc/vehicle_bloc.dart';
import 'package:scu_app/presentation/widgets/tiles/vehicle_tile.dart';

class VehicleBuilder extends StatefulWidget {
  final VehicleBloc bloc;
  VehicleBuilder({required this.bloc, super.key});

  @override
  State<VehicleBuilder> createState() => _VehicleBuilderState();
}

class _VehicleBuilderState extends State<VehicleBuilder> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VehicleBloc, VehicleState>(
        bloc: widget.bloc,
        builder: (context, state) {
          switch (state.status) {
            case VehicleStatus.initial:
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );

            case VehicleStatus.failure:
              return const Center(
                child: Text("Falha ao carregar veículos!"),
              );

            case VehicleStatus.success:
              if (state.vehicles.isEmpty) {
                return const Center(
                  child: Text("Nenhum veículo cadastrado"),
                );
              }
              return ListView.builder(
                shrinkWrap: true,
                itemCount: state.vehicles.length,
                itemBuilder: (context, index) {
                  return VehicleTile(
                    bloc: widget.bloc,
                    vehicle: state.vehicles[index],
                  );
                },
              );
          }
        });
  }
}
