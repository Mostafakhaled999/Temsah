import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
import 'package:temsah/assets_paths.dart';


class VehicleScreen extends StatefulWidget {
  int vehicleIndex;
  VehicleScreen(this.vehicleIndex);

  @override
  State<VehicleScreen> createState() => _VehicleScreenState();
}

class _VehicleScreenState extends State<VehicleScreen> {
  int _focusedIndex = 0;
  void _onItemFocus(int index) {
    print(700 / MediaQuery.of(context).size.width);
    setState(() {
      _focusedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true,title: Text(vehiclesList[widget.vehicleIndex]),),
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
          Padding(
            padding: const EdgeInsets.only(top:20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Flexible(
                  flex: 2,
                  child: OrientationBuilder(builder: (context, orientation){
                    return ScrollSnapList(
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          child: Hero(
                            tag:'Temsah-Transition${widget.vehicleIndex}',
                            child: Image(
                              width: MediaQuery.of(context).size.width * 0.3,
                              image: AssetImage(vehiclesList[index]),
                              fit: BoxFit.contain,
                            ),
                          ),
                          onTap: (){

                          },
                        );
                      },
                      itemCount: vehiclesList.length,
                      dynamicItemSize: true,
                      onItemFocus: _onItemFocus,
                      itemSize: MediaQuery.of(context).size.width * 0.3,
                      //dynamicItemOpacity: 20,
                    );
                  }),
                ),
                Flexible(flex: 3,child:Container() )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
