import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:scu_app/data/implementatios/excepetions/api_exception.dart';
import 'package:scu_app/data/models/owner_model.dart';

// ignore: constant_identifier_names
const URL = 'localhost:18080';

class OwnerRepository {
  Future<List<Owner>> getAll() async {
    try {
      Uri uri = Uri.http(URL, '/owners');
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        List<Owner> owners = [];
        var responseMap = jsonDecode(response.body);
        (responseMap['Proprietários'] as List<dynamic>).forEach((element) {
          owners.add(
            Owner.fromJson(element as Map<String, dynamic>),
          );
        });
        return owners;
      } else {
        throw ApiException(message: "Erro ao carregar lista de proprietários");
      }
    } catch (error, stacktrace) {
      log("Erro ao fazer get de proprietários: ",
          error: error, stackTrace: stacktrace);
      throw ApiException(message: "Erro ao carregar lista de proprietários");
    }
  }

  Future<Owner> getById(int id) async {
    try {
      Uri uri = Uri.http(URL, '/owners/$id');
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        var responseMap = jsonDecode(response.body);
        Owner owner =
            Owner.fromJson(responseMap['Proprietário'] as Map<String, dynamic>);
        return owner;
      } else {
        throw ApiException(message: "Erro ao carregar proprietário");
      }
    } catch (error, stackTrace) {
      log('Erro ao fazer get de proprietário',
          error: error, stackTrace: stackTrace);
      throw ApiException(message: "Erro ao carregar proprietário");
    }
  }

  Future<void> delete(int id) async {
    try {
      Uri uri = Uri.http(URL, '/owners/$id');
      final response = await http.delete(uri);
      if (response.statusCode == 200) {
        log('Proprietário removido com sucesso');
      } else {
        log('Erro ao deletar proprietário');
      }
    } catch (error, stackTrace) {
      log('Erro ao deletar proprietário', error: error, stackTrace: stackTrace);
    }
  }

  Future<void> insert(Owner owner) async {
    try {
      Uri uri = Uri.http(URL, '/owners/insert');
      var ownerObj = owner.toJson();
      var headers = {
        "Accept": "application/json",
        "content-type": "application/json"
      };

      final response =
          await http.post(uri, body: jsonEncode(ownerObj), headers: headers);
      if (response.statusCode == 200) {
        log('Proprietário inserido com sucesso');
      } else {
        log('Erro ao inserir novo proprietário');
      }
    } catch (error, stackTrace) {
      log('Erro ao inserir novo proprietário',
          error: error, stackTrace: stackTrace);
    }
  }
}
