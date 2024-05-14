import 'package:flutter/material.dart';
import 'package:scu_app/data/implementatios/repositories/address/address_viacep_repository.dart';

class CEPSearchBar extends StatelessWidget {
  CEPSearchBar({super.key});

  TextEditingController cepController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      controller: cepController,
      onSubmitted: (value) async {
        await AddressCepRepository.get(cepController.text);
      },
    );
  }
}
