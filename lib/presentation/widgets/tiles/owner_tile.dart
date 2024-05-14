import 'package:flutter/material.dart';
import 'package:scu_app/data/models/owner_model.dart';
import 'package:scu_app/presentation/business_logic/owner/bloc/owner_bloc.dart';

class OwnerTile extends StatelessWidget {
  final Owner owner;
  final OwnerBloc bloc;
  const OwnerTile({required this.owner, required this.bloc, super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
