import 'package:pr2/data/model/bike_type.dart';
import 'package:pr2/data/model/brakes_type.dart';
import 'package:pr2/data/model/brand.dart';
import 'package:pr2/data/model/warehouse.dart';

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
      idBrand: Brand.toFromMap(json),
      idBikeType: BikeType.toFromMap(json),
      idWarehouse: Warehouse.toFromMap(json),
      idBrakesType: BrakesType.toFromMap(json),
      cost: json['cost'] as int,
      diameter: json['diameter'] as int,
      year: json['year'] as int,
    );
  }
}
