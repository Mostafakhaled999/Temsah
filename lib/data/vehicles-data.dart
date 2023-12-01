import 'package:temsah/assets_paths.dart';
import 'package:temsah/models/item.dart';
import 'package:temsah/models/vehicle.dart';
import 'package:temsah/models/vehicle_part.dart';

List<Vehicle> arabicVehicleList = [
  Vehicle(name: 'تمساح ١', iconPath: kTemsah1Icon, vehicleParts: [
    VehiclePart(iconPath: kEngineIcon, name: 'محرك', items: [
      Item(key: "النوع", value: "Diesel-turbo"),
      Item(key: "اقصى عزم (نيوتن.متر@ لفة)", value: "882@1200"),
      Item(key: "قصى قدرة (حصان @لفة )", value: "230@ 2100"),
    ])
  ])
];
List<Vehicle> englishVehicleList = [
  Vehicle(name: 'Temsah 1', iconPath: kTemsah1Icon, vehicleParts: [
    VehiclePart(iconPath: kEngineIcon, name: 'ُEngine', items: [
      Item(key: "Type", value: "Diesel-turbo"),
      Item(key: "Max .torque(n.m @rpm)/ Couple maximale", value: "882@1200"),
      Item(key: "Max power (hp@rpm)/ puissanee maximum", value: "230@ 2100"),
    ])
  ])
];
