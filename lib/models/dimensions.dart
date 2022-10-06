class Dimensions {
  String iconPath = 'dsad';
  String totalLength;
  String maxWidth;
  String maxHeight;
  String? wheelBase;
  String? wheelTrack;
  String? minGroundClearance;
  String? totalLenghtWithSpareTires;
  String? cgHeight;
  String? tireSize;

  Dimensions(
      {required this.totalLength,
      required this.maxHeight,
      required this.maxWidth,
      this.cgHeight,
      this.minGroundClearance,
      this.tireSize,
      this.totalLenghtWithSpareTires,
      this.wheelBase,
      this.wheelTrack});
}
