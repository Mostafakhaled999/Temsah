import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
import 'package:temsah/assets_paths.dart';
import 'package:temsah/models/vehicle.dart';
import 'package:temsah/models/vehicle_part.dart';
import 'package:temsah/screens/all_vehicles_screen.dart';
import 'package:temsah/screens/vehicle_part_screen.dart';
import 'package:temsah/widgets/helper_widgets.dart';

class VehicleScreen extends StatefulWidget {
  Vehicle vehicle;

  VehicleScreen(this.vehicle);

  @override
  State<VehicleScreen> createState() => _VehicleScreenState();
}

class _VehicleScreenState extends State<VehicleScreen> {
  void _onItemFocus(int index) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            color: Colors.black,
            child: ClipRRect(
              child: ImageFiltered(
                imageFilter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Image(
                  image: AssetImage(kMogama3Logo),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(top: 70),
              child: Container(
                child: GridView.builder(
                    itemCount: widget.vehicle.vehicleParts.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 10),
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => VehiclePartScreen(
                                        widget.vehicle.vehicleParts[index])));
                          },
                          child: VehiclePartCard(
                              widget.vehicle.vehicleParts[index]));
                    }),
              )),
          BackButtons(),
        ],
      ),
    );
  }
}

class VehiclePartCard extends StatelessWidget {
  VehiclePart vehiclePart;
  VehiclePartCard(this.vehiclePart);
  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Hero(
          tag: 'vehicle-part'+vehiclePart.name,
          child: Image(
            image: AssetImage(vehiclePart.iconPath),
            width: 128,
            height: 128,
          )),
      Text(vehiclePart.name,
          style: TextStyle(
            fontSize: 30,
            color: Colors.white,
          ))
    ]);
  }
}
