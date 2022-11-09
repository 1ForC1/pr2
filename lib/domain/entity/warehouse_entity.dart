import 'package:pr2/domain/entity/supplier_entity.dart';

class WarehouseEntity {
  late int id;
  final String warehouseNumber;
  final String address;
  final String cellQuantity;
  final SupplierEntity idSupplier;

  WarehouseEntity(
      {this.id = 0,
      required this.warehouseNumber,
      required this.address,
      required this.cellQuantity,
      required this.idSupplier});
}
