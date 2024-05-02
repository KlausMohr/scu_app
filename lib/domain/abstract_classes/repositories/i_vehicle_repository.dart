// ignore_for_file: constant_identifier_names

import 'package:scu_app/data/models/vehicle_model.dart';

const String API_URL = "http://localhost:18080";

abstract class VehicleRepository {
  Future<List<VehicleModel?>> getAll();

  Future<VehicleModel?> getById(int id);

  void delete(int id);

  void update(int id);
}
