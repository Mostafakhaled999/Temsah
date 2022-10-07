import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:temsah/assets_paths.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
import 'package:temsah/screens/vehicle_screen.dart';

class AllVehiclesScreen extends StatefulWidget {
  const AllVehiclesScreen({Key? key}) : super(key: key);

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
                  image: AssetImage(mogama3_logo),
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
                    child: Hero(
                      tag:'Temsah-Transition$index',
                      child: Image(
                        width: MediaQuery.of(context).size.width * 0.52,
                        image: AssetImage(mainVehiclesPicsPathsList[index]),
                        fit: BoxFit.contain,
                      ),
                    ),
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  VehicleScreen(_focusedIndex))
                      );
                    },
                  );
                },
                itemCount: mainVehiclesPicsPathsList.length,
                dynamicItemSize: true,
                onItemFocus: _onItemFocus,
                itemSize: MediaQuery.of(context).size.width * 0.52,
                //dynamicItemOpacity: 20,
              );
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {},
                      iconSize: 100,
                      icon: Icon(
                        Icons.keyboard_arrow_left,
                        color: Colors.white,
                      )),
                  AutoSizeText(
                    mainVehiclesPicsPathsList[_focusedIndex],
                    style: TextStyle(color: Colors.white, fontSize: 50),
                    minFontSize: 30,
                  ),
                  IconButton(
                    onPressed: () {},
                    iconSize: 100,
                    icon: Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
