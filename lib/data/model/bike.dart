import '../../domain/entity/bike_entity.dart';

class Bike extends BikeEntity {
  Bike(
      {super.id = 0,
      required super.idBrand,
      required super.idBikeType,
      required super.idWarehouse,
      required super.idBrakesType,
      required super.cost,
      required super.diameter,
      required super.year});

  Map<String, dynamic> toMap() {
    return {
      'idBrand': idBrand.id,
      'idBikeType': idBikeType.id,
      'idWarehouse': idWarehouse.id,
      'idBrakesType': idBrakesType.id,
      'cost': cost,
      'diameter': diameter,
      'year': year
    };
  }

  factory Bike.toFromMap(Map<String, dynamic> json) {
    return Bike(
      id: json['id'] as int,
      idBrand: json['idBrand'],
      idBikeType: json['idBikeType'],
      idWarehouse: json['idWarehouse'],
      idBrakesType: json['idBrakesType'],
      cost: json['cost'] as int,
      diameter: json['diameter'] as int,
      year: json['year'] as int,
    );
  }
}
