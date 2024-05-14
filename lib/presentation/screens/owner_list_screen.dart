import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:scu_app/presentation/builders/bloc_builder/owner_list_builder.dart';
import 'package:scu_app/presentation/business_logic/owner/bloc/owner_bloc.dart';
import 'package:scu_app/presentation/widgets/cards/insert_owner_card.dart';

class OwnerListScreen extends StatefulWidget {
  const OwnerListScreen({super.key});

  @override
  State<OwnerListScreen> createState() => _OwnerListScreenState();
}

class _OwnerListScreenState extends State<OwnerListScreen> {
  late final OwnerBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = OwnerBloc();
    bloc.add(OwnerFetched());
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(child: LayoutBuilder(
        builder: (context, constraints) {
          return ConstrainedBox(
            constraints: BoxConstraints(
                maxHeight: constraints.maxHeight * 1,
                maxWidth: constraints.maxWidth * 1),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  OwnerInsertCard(
                    bloc: bloc,
                    constraints: constraints,
                  ),
                  const MaxGap(25),
                  Flexible(
                      child: OwnerBuilder(
                    bloc: bloc,
                  )),
                ],
              ),
            ),
          );
        },
      )),
    );
  }
}
