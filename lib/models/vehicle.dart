import 'package:temsah/models/vehicle_part.dart';

class Vehicle {
  String name;
  String iconPath;
  late int numberOfTechnicalSpecs;
  List<VehiclePart> vehicleParts;
  //String imagePaths;
  // Engine engine;
  // PerformanceData? performanceData;
  // Dimensions dimensions;
  // Weights weights;
  // ProtectionLevel protectionLevel;
  // InteriorAndExterior? interiorAndExterior;
  // GeneralSpecs? generalSpecs;

  Vehicle(
      {required this.name,
      required this.iconPath,
      required this.vehicleParts}) {
    numberOfTechnicalSpecs = vehicleParts.length;
  }
}
