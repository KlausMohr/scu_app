import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scu_app/presentation/business_logic/owner/bloc/owner_bloc.dart';
import 'package:scu_app/presentation/widgets/tiles/owner_tile.dart';

class OwnerBuilder extends StatefulWidget {
  final OwnerBloc bloc;
  OwnerBuilder({required this.bloc, super.key});

  @override
  State<OwnerBuilder> createState() => _VehicleBuilderState();
}

class _VehicleBuilderState extends State<OwnerBuilder> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OwnerBloc, OwnerState>(
        bloc: widget.bloc,
        builder: (context, state) {
          switch (state.status) {
            case OwnerStatus.initial:
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );

            case OwnerStatus.failure:
              return const Center(
                child: Text("Falha ao carregar veículos!"),
              );

            case OwnerStatus.success:
              if (state.owners.isEmpty) {
                return const Center(
                  child: Text("Nenhum veículo cadastrado"),
                );
              }
              return ListView.builder(
                shrinkWrap: true,
                itemCount: state.owners.length,
                itemBuilder: (context, index) {
                  return OwnerTile(
                    bloc: widget.bloc,
                    owner: state.owners[index],
                  );
                },
              );
          }
        });
  }
}
