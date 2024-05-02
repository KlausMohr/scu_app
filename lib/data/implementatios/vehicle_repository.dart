import 'dart:convert';
import 'dart:developer';
import 'package:scu_app/data/implementatios/excepetions/api_exception.dart';
import 'package:scu_app/data/models/vehicle_model.dart';
import 'package:http/http.dart' as http;

class HttpVehicleRepository {
  Future<List<VehicleModel?>> getAll() async {
    try {
      Uri uri = Uri.http('localhost:18080', '/vehicles');

      final response = await http.get(uri);

      if (response.statusCode == 200) {
        List<VehicleModel> listResponse = [];
        var responseMap = json.decode(response.body);
        (responseMap["Veículo"] as List<dynamic>).forEach((element) {
          listResponse
              .add(VehicleModel.fromJson(element as Map<String, dynamic>));
        });
        return listResponse;
      } else {
        throw ApiException(message: "Erro ao carregar lista de veículos");
      }
    } catch (error, stacktrace) {
      log("Erro ao fazer get de veículos: ",
          error: error, stackTrace: stacktrace);
      throw ApiException(message: "Erro ao carregar lista de veículos");
    }
  }

  Future<VehicleModel?> getById(int id) {
    // TODO: implement getById
    throw UnimplementedError();
  }

  static Future<void> insert(VehicleModel vehicle) async {
    const url = 'http://localhost:18080/vehicles/insert';
    var vehicleObj = vehicle.toJson();
    var headers = {
      "Accept": "application/json",
      "content-type": "application/json"
    };

    final response = await http.post(Uri.parse(url),
        body: jsonEncode(vehicleObj), headers: headers);
    log(response.toString());
  }

  void delete(int id) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  void update(int id) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
