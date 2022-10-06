import 'package:temsah/models/dimensions.dart';
import 'package:temsah/models/engine.dart';
import 'package:temsah/models/general_specs.dart';
import 'package:temsah/models/interior&exterior.dart';
import 'package:temsah/models/performance_data.dart';
import 'package:temsah/models/protection_level.dart';
import 'package:temsah/models/weights.dart';


class Vehicle {
  String name;
  String mainImagePath;
  String imagePaths;
  Engine engine;
  PerformanceData? performanceData;
  Dimensions dimensions;
  Weights weights;
  ProtectionLevel protectionLevel;
  InteriorAndExterior? interiorAndExterior;
  GeneralSpecs? generalSpecs;
  Vehicle(
      {required this.name,
      required this.imagePaths,
      required this.mainImagePath,
      required this.engine,
        required this.dimensions,
        required this.weights,
required this.protectionLevel,
        this.interiorAndExterior,
        this.performanceData,
        this.generalSpecs,


      });
}
