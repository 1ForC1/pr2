import 'dart:html';

import 'package:pr2/data/model/user.dart';

import '../../data/model/bike.dart';

class ChequeEntity {
  late int id;
  final Bike idBike;
  final Client idClient;
  final User idUser;

  ChequeEntity({
    this.id = 0,
    required this.idBike,
    required this.idClient,
    required this.idUser,
  });
}
