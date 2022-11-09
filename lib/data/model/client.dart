import 'package:pr2/domain/entity/client_entity.dart';

class Client extends ClientEntity {
  Client(
      {super.id = 0,
      required super.Surname,
      required super.Name,
      required super.Patronymic,
      required super.Telephone});

  Map<String, dynamic> toMap() {
    return {
      'name': Name,
      'surname': Surname,
      'patronymic': Patronymic,
      'telephone': Telephone
    };
  }

  factory Client.toFromMap(Map<String, dynamic> json) {
    return Client(
        id: json['id'] as int,
        Surname: json['surname'],
        Name: json['name'],
        Patronymic: json['patronymic'],
        Telephone: json['telephone']);
  }
}
