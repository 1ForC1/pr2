import '../../domain/entity/brand_entity.dart';

class Brand extends BrandEntity {
  Brand({super.id = 0, required super.title});

  Map<String, dynamic> toMap() {
    return {'title': title};
  }

  factory Brand.toFromMap(Map<String, dynamic> json) {
    return Brand(
      id: json['id'] as int,
      title: json['title'],
    );
  }
}
