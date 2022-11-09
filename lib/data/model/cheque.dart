import '../../domain/entity/cheque_entity.dart';

class Cheque extends ChequeEntity {
  Cheque(
      {super.id = 0,
      required super.idBike,
      required super.idClient,
      required super.idUser});

  Map<String, dynamic> toMap() {
    return {
      'idBike': idBike.id,
      'idClient': idClient.id,
      'idUser': idUser.id,
    };
  }

  factory Cheque.toFromMap(Map<String, dynamic> json) {
    return Cheque(
      id: json['id'] as int,
      idBike: json['idBike'],
      idClient: json['idClient'],
      idUser: json['idUser'],
    );
  }
}
