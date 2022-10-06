class Engine {
  String iconPath = 'asd';
  String type;
  String maxTorque;
  String maxPower;
  String? fuelSystem;
  String? cylinder;
  String? transmissionType;

  Engine(
      {required this.type,
      required this.maxTorque,
      required this.maxPower,
      this.cylinder,
      this.fuelSystem,
      this.transmissionType,
      });
}
