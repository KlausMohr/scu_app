import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:scu_app/presentation/builders/bloc_builder/vehicle_list_builder.dart';
import 'package:scu_app/presentation/business_logic/vehicle/bloc/vehicle_bloc.dart';
import 'package:scu_app/presentation/widgets/cards/insert_vehicle_card.dart';

class VehicleListScreen extends StatefulWidget {
  const VehicleListScreen({super.key});

  @override
  State<VehicleListScreen> createState() => _VehicleListScreenState();
}

class _VehicleListScreenState extends State<VehicleListScreen> {
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
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return ConstrainedBox(
              constraints: BoxConstraints(
                  maxHeight: constraints.maxHeight * 1,
                  maxWidth: constraints.maxWidth * 1),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    VehicleInsertCard(
                      bloc: bloc,
                      constraints: constraints,
                    ),
                    const MaxGap(25),
                    Flexible(
                        child: VehicleBuilder(
                      bloc: bloc,
                    )),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
