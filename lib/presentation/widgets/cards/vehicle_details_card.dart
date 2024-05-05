import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:scu_app/data/models/vehicle_model.dart';

// ignore: must_be_immutable
class VehicleDetailCard extends StatelessWidget {
  VehicleModel vehicle;
  VehicleDetailCard({required this.vehicle, super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 450,
        height: 300,
        child: Material(
          color: const Color.fromARGB(255, 48, 48, 48),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const MaxGap(12),
              Text(vehicle.make!),
              const MaxGap(12),
              Text(vehicle.model!),
              const MaxGap(12),
              Text(vehicle.licenseplt!),
              const MaxGap(12),
              Text(vehicle.vin!),
              const MaxGap(12),
              Text(vehicle.color!),
              const MaxGap(12),
              Text(vehicle.year!),
              const MaxGap(12),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Fechar"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
