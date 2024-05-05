// ignore_for_file: unnecessary_this
// ignore: must_be_immutable
class VehicleModel {
  int? id;
  String? make;
  String? model;
  String? year;
  String? color;
  String? vin;
  String? mileage;
  String? licenseplt;

  VehicleModel(
      {this.id,
      this.make,
      this.model,
      this.year,
      this.color,
      this.vin,
      this.mileage,
      this.licenseplt});

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      "make": this.make ?? "",
      "model": this.model ?? "",
      "year": this.year ?? "",
      "color": this.color ?? "",
      "vin": this.vin ?? "",
      "mileage": this.mileage ?? "",
      "licenseplt": this.licenseplt ?? ""
    };
  }

  VehicleModel.fromJson(Map<String, dynamic> json) {
    this.id = json["id"] ?? 0;
    this.make = json["make"] ?? "";
    this.model = json["model"] ?? "";
    this.year = json["year"] ?? "";
    this.color = json["color"] ?? "";
    this.vin = json["vin"] ?? "";
    this.mileage = json["mileage"] ?? "";
    this.licenseplt = json["licenseplt"] ?? "";
  }
}
