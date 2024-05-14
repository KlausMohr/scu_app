import 'package:flutter/material.dart';
import 'package:scu_app/presentation/screens/vehicle_list_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: LayoutBuilder(builder: (context, constrains) {
          return ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: constrains.maxHeight,
              maxWidth: constrains.maxWidth,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: constrains.maxHeight * 0.3,
                  width: constrains.maxWidth * 0.3,
                  child: Material(
                    child: Card(
                      color: const Color.fromARGB(255, 54, 53, 53),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const VehicleListScreen(),
                          ));
                        },
                        child: const Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                top: 15,
                              ),
                              child: Text(
                                "Proprietários",
                                style: TextStyle(
                                  fontSize: 28,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: constrains.maxHeight * 0.3,
                  width: constrains.maxWidth * 0.3,
                  child: Material(
                    child: Card(
                      color: const Color.fromARGB(255, 54, 53, 53),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const VehicleListScreen(),
                          ));
                        },
                        child: const Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                top: 15,
                              ),
                              child: Text(
                                "Veículos",
                                style: TextStyle(
                                  fontSize: 28,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              child: Text(
                "Header",
              ),
            ),
            ListTile(
              title: const Text(
                "Veículos",
              ),
              onTap: () {
                Navigator.of(context).pushNamed('/vehicles');
              },
            ),
          ],
        ),
      ),
    );
  }
}
