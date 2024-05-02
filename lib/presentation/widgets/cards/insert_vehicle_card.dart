import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:scu_app/data/implementatios/vehicle_repository.dart';
import 'package:scu_app/data/models/vehicle_model.dart';
import 'package:scu_app/presentation/business_logic/bloc/vehicle_list/vehicle_list_bloc.dart';
import 'package:scu_app/presentation/utils/tags_vehicles_hero.dart';

class VehicleInsertCard extends StatelessWidget {
  BoxConstraints constraints;
  final VehicleListBloc bloc;

  VehicleInsertCard({required this.constraints, required this.bloc, super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 50,
        width: constraints.maxWidth * 0.98,
        child: Hero(
          tag: vehicleAdd,
          child: Card(
            child: InkWell(
              child: const Text(
                "Lista de veículos",
                style: TextStyle(fontSize: 22),
                textAlign: TextAlign.center,
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    fullscreenDialog: false,
                    builder: (context) {
                      return InsertVehicleCard();
                    },
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class InsertVehicleCard extends StatelessWidget {
  TextEditingController makeController = TextEditingController();
  TextEditingController modelController = TextEditingController();
  TextEditingController yearController = TextEditingController();
  TextEditingController colorController = TextEditingController();
  TextEditingController vinController = TextEditingController();
  TextEditingController mileageController = TextEditingController();
  TextEditingController licensepltController = TextEditingController();

  InsertVehicleCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Hero(
            tag: vehicleAdd,
            child: Card(
              child: Column(
                children: [
                  TextFormField(
                    controller: makeController,
                  ),
                  const MaxGap(15),
                  TextFormField(
                    controller: modelController,
                  ),
                  const MaxGap(15),
                  TextFormField(
                    controller: yearController,
                  ),
                  const MaxGap(15),
                  TextFormField(
                    controller: colorController,
                  ),
                  const MaxGap(15),
                  TextFormField(
                    controller: vinController,
                  ),
                  const MaxGap(15),
                  TextFormField(
                    controller: mileageController,
                  ),
                  const MaxGap(15),
                  TextFormField(
                    controller: licensepltController,
                  ),
                  const MaxGap(15),
                  TextButton(
                    onPressed: () async {
                      VehicleModel vehicle = VehicleModel(
                          make: makeController.text,
                          model: modelController.text,
                          year: yearController.text,
                          color: colorController.text,
                          vin: vinController.text,
                          mileage: mileageController.text,
                          licenseplt: licensepltController.text);

                      await HttpVehicleRepository.insert(vehicle);
                      Navigator.of(context).pop();
                    },
                    child: const Text("Inserir veículo"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
