import 'dart:ui';

import 'package:flutter/material.dart';

import '../assets_paths.dart';


class BackButtons extends StatelessWidget {
  const BackButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pop(context);
      },
      child: Align(
          alignment: Alignment.topCenter,
          child:Padding(
            padding: EdgeInsets.only(top:20,bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.keyboard_arrow_left,
                      color: Colors.white,
                      size: 50,
                    ),
                    Text('Back',style: TextStyle(fontSize: 30,color: Colors.white,)),


                  ],
                ),

                Row(
                  children: [
                    Text('عودة',style: TextStyle(fontSize: 30,color: Colors.white,)),
                    Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.white,
                      size: 50,
                    ),

                  ],
                )
              ],
            ),
          )),
    );
  }
}
class BackgroundImage extends StatelessWidget {
  const BackgroundImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}