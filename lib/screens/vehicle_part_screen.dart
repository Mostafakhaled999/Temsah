import 'package:flutter/material.dart';
import 'package:temsah/enums/languageEnum.dart';
import 'package:temsah/screens/home_screen.dart';
import 'package:temsah/screens/vehicle_screen.dart';
import 'package:temsah/widgets/helper_widgets.dart';

import '../models/vehicle_part.dart';

class VehiclePartScreen extends StatelessWidget {
  VehiclePart  vehiclePart;
  VehiclePartScreen(this.vehiclePart);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          BackgroundImage(),

          Padding(
              padding: const EdgeInsets.only(top: 70),
              child:Container(child:Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                VehiclePartCard(vehiclePart),
                Expanded(
                  child: ListView.builder(itemCount:vehiclePart.items.length,

                    itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      textDirection: languageId == LanguageEnum.english? TextDirection.ltr:TextDirection.rtl,
                      children: [
                        Text(vehiclePart.items[index].key,  style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                        )),
                        Text(vehiclePart.items[index].value,  style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                        )),
                      ],
                      ),
                    );
                  },),
                )
              ],))
          ),
          BackButtons(),
        ],
      ),
    );
  }
}


