import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
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
    setState(() {
      _focusedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(mainVehiclesPicsPathsList[widget.vehicleIndex]),
      ),
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
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Flexible(
                  flex: 2,
                  child: OrientationBuilder(builder: (context, orientation) {
                    return ScrollSnapList(
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          child: Hero(
                            tag: 'Temsah-Transition${widget.vehicleIndex}',
                            child: Image(
                              width: MediaQuery.of(context).size.width * 0.3,
                              image:
                                  AssetImage(mainVehiclesPicsPathsList[index]),
                              fit: BoxFit.contain,
                            ),
                          ),
                          onTap: () {},
                        );
                      },
                      itemCount: mainVehiclesPicsPathsList.length,
                      dynamicItemSize: true,
                      onItemFocus: _onItemFocus,
                      itemSize: MediaQuery.of(context).size.width * 0.3,
                      //dynamicItemOpacity: 20,
                    );
                  }),
                ),
                Flexible(flex: 3, child: Container(child:  GridView.builder(
                    itemCount: 7,

                    gridDelegate:
                    SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4,mainAxisExtent:MediaQuery.of(context).size.height*0.9*0.3 ,crossAxisSpacing: 15,mainAxisSpacing: 15),
                    itemBuilder: (BuildContext context, int index) {
                      print( MediaQuery.of(context).size.height*0.75*0.5);
                      return VehicleElementCard();
                    }),))
              ],
            ),
          ),

        ],
      ),
    );
  }
}

class VehicleElementCard extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
       Image(image: AssetImage('assets/icons/car-engine.png'),width: 128,height: 128,),
      AutoSizeText('Engine',style: TextStyle(fontSize: 30,color: Colors.white,),maxFontSize: 50,minFontSize: 10,)
    ]);
  }
}

