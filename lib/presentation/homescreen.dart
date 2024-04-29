import 'dart:developer';

import 'package:flutter/material.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Container(
          //   decoration: const BoxDecoration(color: Colors.black87),
          // ),
          SafeArea(
            child: ListView.builder(
              itemCount: 6,
              itemBuilder: (context, index) {
                final textList = [
                  "Chevrolet",
                  "Ford",
                  "Fiat",
                  "Volkswagen",
                  "Nissan",
                  "Citröen"
                ];
                return Card(
                  child: Text(textList[index]),
                );
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: FloatingActionButton(
              onPressed: () {
                log(
                  "Clique",
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
