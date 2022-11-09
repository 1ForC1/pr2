import 'package:pr2/data/model/supplier.dart';

import '../../domain/entity/warehouse_entity.dart';

class Warehouse extends WarehouseEntity {
  Warehouse(
      {super.id = 0,
      required super.warehouseNumber,
      required super.address,
      required super.cellQuantity,
      required super.idSupplier});

  Map<String, dynamic> toMap() {
    return {'warehouse_number': warehouseNumber, 'address': address, 'cell_quantity': cellQuantity, 'id_supplier': idSupplier.id};
  }

  factory Warehouse.toFromMap(Map<String, dynamic> json) {
    return Warehouse(
      id: json['id'] as int,
      warehouseNumber: json['warehouse_number'],
      address: json['address'],
      cellQuantity: json['cell_quantity'],
      idSupplier: Supplier.toFromMap(json)
    );
  }
}
