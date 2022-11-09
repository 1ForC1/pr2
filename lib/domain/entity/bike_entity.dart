import 'package:pr2/data/model/bike_type.dart';
import 'package:pr2/data/model/brakes_type.dart';
import 'package:pr2/data/model/brand.dart';
import 'package:pr2/data/model/warehouse.dart';

class BikeEntity {
  late int id;
  final Brand idBrand;
  final BikeType idBikeType;
  final Warehouse idWarehouse;
  final BrakesType idBrakesType;
  final int cost;
  final int diameter;
  final int year;

  BikeEntity(
      {this.id = 0,
      required this.idBrand,
      required this.idBikeType,
      required this.idWarehouse,
      required this.idBrakesType,
      required this.cost,
      required this.diameter,
      required this.year});
}
