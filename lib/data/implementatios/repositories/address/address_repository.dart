import 'dart:convert';
import 'dart:developer';
import 'package:scu_app/data/models/address_model.dart';
import 'package:http/http.dart' as http;

const URL = 'localhost:18080/owners/address/insert';

class AddressRepository {
  Future<void> insert(Address address) async {
    var body = address.toJson();

    var headers = {
      "Accept": "application/json",
      "content-type": "application/json"
    };

    final response = await http.post(Uri.parse(URL),
        body: jsonEncode(body), headers: headers);
    log(response.toString());
  }
}
