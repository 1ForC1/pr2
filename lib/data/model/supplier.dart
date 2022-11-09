import 'package:pr2/domain/entity/supplier_entity.dart';

class Supplier extends SupplierEntity {
  Supplier(
      {super.id = 0,
      required super.title,
      required super.address});

  Map<String, dynamic> toMap() {
    return {'title': title, 'address': address};
  }

  factory Supplier.toFromMap(Map<String, dynamic> json) {
    return Supplier(
      id: json['id'] as int,
      title: json['title'],
      address: json['address'],
    );
  }
}
