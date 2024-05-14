import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:scu_app/data/models/vehicle_model.dart';
import 'package:scu_app/presentation/business_logic/vehicle/bloc/vehicle_bloc.dart';
import 'package:scu_app/presentation/utils/tags_vehicles_hero.dart';

// ignore: must_be_immutable
class VehicleInsertCard extends StatelessWidget {
  final VehicleBloc bloc;
  BoxConstraints constraints;

  VehicleInsertCard({required this.bloc, required this.constraints, super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 50,
        width: constraints.maxWidth * 0.95,
        child: Hero(
          tag: vehicleAdd,
          child: Card(
            child: InkWell(
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      "Lista de veículos",
                      style: TextStyle(
                        fontSize: 22,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Icon(
                    Icons.arrow_drop_down_outlined,
                  ),
                ],
              ),
              onTap: () {
                Navigator.of(context).push(
                  PageRouteBuilder(
                    opaque: false,
                    pageBuilder: (context, animation, secondaryAnimation) {
                      return InsertVehicleCard(
                          constraints: constraints, bloc: bloc);
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

// ignore: must_be_immutable
class InsertVehicleCard extends StatelessWidget {
  TextEditingController makeController = TextEditingController();
  TextEditingController modelController = TextEditingController();
  TextEditingController yearController = TextEditingController();
  TextEditingController colorController = TextEditingController();
  TextEditingController vinController = TextEditingController();
  TextEditingController mileageController = TextEditingController();
  TextEditingController licensepltController = TextEditingController();

  VehicleBloc bloc;
  BoxConstraints constraints;

  InsertVehicleCard({required this.constraints, required this.bloc, super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Hero(
        tag: vehicleAdd,
        child: SizedBox(
          height: constraints.maxHeight * 0.8,
          width: constraints.maxWidth * 0.7,
          child: Material(
            color: const Color.fromARGB(255, 228, 228, 228),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: constraints.maxWidth * 0.05,
                    vertical: constraints.maxHeight * 0.05),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "Cadastro de veículo",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const MaxGap(35),
                    TextFormField(
                      decoration: const InputDecoration(labelText: "Marca"),
                      controller: makeController,
                    ),
                    const MaxGap(25),
                    TextFormField(
                      decoration: const InputDecoration(labelText: "Modelo"),
                      controller: modelController,
                    ),
                    const MaxGap(25),
                    TextFormField(
                      decoration: const InputDecoration(labelText: "Ano"),
                      controller: yearController,
                    ),
                    const MaxGap(25),
                    TextFormField(
                      decoration: const InputDecoration(labelText: "Cor"),
                      controller: colorController,
                    ),
                    const MaxGap(25),
                    TextFormField(
                      decoration: const InputDecoration(labelText: "Chassi"),
                      controller: vinController,
                    ),
                    const MaxGap(25),
                    TextFormField(
                      decoration:
                          const InputDecoration(labelText: "Kilometragem"),
                      controller: mileageController,
                    ),
                    const MaxGap(25),
                    TextFormField(
                      decoration: const InputDecoration(labelText: "Placa"),
                      controller: licensepltController,
                    ),
                    const MaxGap(35),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {
                            VehicleModel vehicle = VehicleModel(
                                make: makeController.text,
                                model: modelController.text,
                                year: yearController.text,
                                color: colorController.text,
                                vin: vinController.text,
                                mileage: mileageController.text,
                                licenseplt: licensepltController.text);

                            bloc.add(VehicleInsert(vehicle: vehicle));
                            Navigator.of(context).pop();
                          },
                          child: const Text(
                            "Inserir veículo",
                            style: TextStyle(fontSize: 22),
                          ),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text(
                              "Fechar",
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 22,
                              ),
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
