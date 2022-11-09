import '../../domain/entity/bike_type_entity.dart';

class BikeType extends BikeTypeEntity {
  BikeType({super.id = 0, required super.title});

  Map<String, dynamic> toMap() {
    return {'title': title};
  }

  factory BikeType.toFromMap(Map<String, dynamic> json) {
    return BikeType(
      id: json['id'] as int,
      title: json['title'],
    );
  }
}
