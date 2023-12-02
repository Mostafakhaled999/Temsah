import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:temsah/assets_paths.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
import 'package:temsah/data/vehicles-data.dart';
import 'package:temsah/enums/languageEnum.dart';
import 'package:temsah/models/vehicle.dart';
import 'package:temsah/screens/vehicle_screen.dart';
import 'package:temsah/widgets/helper_widgets.dart';

class AllVehiclesScreen extends StatefulWidget {
  int language;
  List<Vehicle> vehiclesList = [];
  AllVehiclesScreen({required this.language}){
    vehiclesList = language == LanguageEnum.english?englishVehicleList:arabicVehicleList;
  }

  @override
  State<AllVehiclesScreen> createState() => _AllVehiclesScreenState();
}

class _AllVehiclesScreenState extends State<AllVehiclesScreen> {

  int _focusedIndex = 0;
  void _onItemFocus(int index) {
    print(700 / MediaQuery.of(context).size.width);
    setState(() {
      _focusedIndex = index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
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

          OrientationBuilder(
            builder: (context, orientation) {
              return ScrollSnapList(
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    child: Column(
                      children: [
                        Image(
                          width: MediaQuery.of(context).size.width * 0.52,
                          image: AssetImage(widget.vehiclesList[index].iconPath),
                          fit: BoxFit.contain,
                        ),
                        Text(
                          widget.vehiclesList[_focusedIndex].name,
                          style: TextStyle(color: Colors.white, fontSize: 40),
                        ),
                      ],
                    ),
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  VehicleScreen(widget.vehiclesList[index]))
                      );
                    },
                  );
                },
                itemCount: widget.vehiclesList.length,
                dynamicItemSize: true,
                onItemFocus: _onItemFocus,
                itemSize: MediaQuery.of(context).size.width * 0.52,
                //dynamicItemOpacity: 20,
              );
            },
          ),
          BackButtons(),
        ],
      ),
    );
  }
}

