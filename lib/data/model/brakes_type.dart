import 'package:pr2/domain/entity/brakes_type_entity.dart';

class BrakesType extends BrakesTypeEntity {
  BrakesType({super.id = 0, required super.title});

  Map<String, dynamic> toMap() {
    return {'title': title};
  }

  factory BrakesType.toFromMap(Map<String, dynamic> json) {
    return BrakesType(
      id: json['id'] as int,
      title: json['title'],
    );
  }
}
