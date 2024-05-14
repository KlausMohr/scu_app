import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:scu_app/data/models/address_model.dart';

const URL = 'viacep.com.br';

class AddressCepRepository {
  static Future<Address> get(String cep) async {
    var address;
    Uri uri = Uri.https(URL, '/ws/$cep/json');
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      var responseMap = json.decode(response.body);
      address = Address.fromJson(responseMap as Map<String, dynamic>);
    }
    log(address.toString());
    return address;
  }
}
