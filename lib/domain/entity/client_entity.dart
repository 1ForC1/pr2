class ClientEntity {
  late int id;
  final String Surname;
  final String Name;
  final String Patronymic;
  final String Telephone;

  ClientEntity(
      {this.id = 0,
      required this.Surname,
      required this.Name,
      required this.Patronymic,
      required this.Telephone});
}
