abstract class DataBaseRequest {
  static String deleteTable(String table) => 'DROP TABLE $table';

  static const String tableRole = 'role';
  static const String tableUser = 'user';
  static const String tableSupplier = 'supplier';
  static const String tableWarehouse = 'warehouse';
  static const String tableBrakesType = 'brakes_type';
  static const String tableBrand = 'brand';
  static const String tableBikeType = 'bike_type';
  static const String tableClient = 'client';
  static const String tableBike = 'bike';
  static const String tableCheque = 'cheque';

  static List<String> tableList = [
    tableRole,
    tableUser,
    tableSupplier,
    tableWarehouse,
    tableBrakesType,
    tableBrand,
    tableBikeType,
    tableClient,
    tableBike,
    tableCheque
  ];

  static List<String> tableCreateList = [
    _createTableRole,
    _createTableUser,
    _createTableSupplier,
    _createTableWarehouse,
    _createTableBrakesType,
    _createTableBrand,
    _createTableBikeType,
    _createTableClient,
    _createTableBike,
    _createTableCheque
  ];

  /// Запрос для создания таблицы Role
  static const String _createTableRole =
      'CREATE TABLE "$tableRole" ("id" INTEGER,"role" TEXT NOT NULL UNIQUE, PRIMARY KEY("id" AUTOINCREMENT))';

  /// Запрос для создания таблицы User
  static const String _createTableUser =
      'CREATE TABLE "$tableUser" ("id"	INTEGER,"login"	TEXT NOT NULL UNIQUE,"password"	TEXT NOT NULL,"id_role"	INTEGER,FOREIGN KEY("id_role") REFERENCES "Role"("id") ON DELETE CASCADE,PRIMARY KEY("id" AUTOINCREMENT) )';

  /// Запрос для создания таблицы Supplier
  static const String _createTableSupplier =
      'CREATE TABLE "$tableSupplier" ("id" INTEGER,"title" TEXT NOT NULL UNIQUE, "address" TEXT NOT NULL,PRIMARY KEY("id" AUTOINCREMENT))';

  /// Запрос для создания таблицы Warehouse
  static const String _createTableWarehouse =
      'CREATE TABLE "$tableWarehouse" ("id" INTEGER,"warehouse_number" TEXT NOT NULL UNIQUE, "address" TEXT NOT NULL, "cell_quantity" INTEGER NOT NULL,id_supplier INTEGER NOT NULL,FOREIGN KEY("id_supplier") REFERENCES "Supplier"("id") ON DELETE CASCADE,PRIMARY KEY("id" AUTOINCREMENT))';

  /// Запрос для создания таблицы BrakesType
  static const String _createTableBrakesType =
      'CREATE TABLE "$tableBrakesType" ("id" INTEGER,"title" TEXT NOT NULL UNIQUE, PRIMARY KEY("id" AUTOINCREMENT))';

  /// Запрос для создания таблицы Brand
  static const String _createTableBrand =
      'CREATE TABLE "$tableBrand" ("id" INTEGER,"title" TEXT NOT NULL UNIQUE, PRIMARY KEY("id" AUTOINCREMENT))';

  /// Запрос для создания таблицы BikeType
  static const String _createTableBikeType =
      'CREATE TABLE "$tableBikeType" ("id" INTEGER,"title" TEXT NOT NULL UNIQUE, PRIMARY KEY("id" AUTOINCREMENT))';

  /// Запрос для создания таблицы Client
  static const String _createTableClient =
      'CREATE TABLE "$tableClient" ("id" INTEGER,"surname" TEXT NOT NULL, "name" TEXT NOT NULL, "patronymic" TEXT NOT NULL, "telephone" TEXT NOT NULL, PRIMARY KEY("id" AUTOINCREMENT))';

  /// Запрос для создания таблицы Bike
  static const String _createTableBike =
      'CREATE TABLE "$tableBike" ("id" INTEGER,"idBrand" INTEGER NOT NULL, "idBikeType" INTEGER NOT NULL, "idWarehouse" INTEGER NOT NULL, "idBrakesType" INTEGER NOT NULL, "cost" INTEGER NOT NULL, "diameter" INTEGER NOT NULL, "year" INTEGER NOT NULL,FOREIGN KEY("idBrand") REFERENCES "Brand"("id") ON DELETE CASCADE,FOREIGN KEY("idBikeType") REFERENCES "Bike_Type"("id") ON DELETE CASCADE,FOREIGN KEY("idWarehouse") REFERENCES "Warehouse"("id") ON DELETE CASCADE,FOREIGN KEY("idBrakesType") REFERENCES "Brakes_Type"("id") ON DELETE CASCADE, PRIMARY KEY("id" AUTOINCREMENT))';

  /// Запрос для создания таблицы Cheque
  static const String _createTableCheque =
      'CREATE TABLE "$tableCheque" ("id" INTEGER,"idBike" INTEGER NOT NULL, "idClient" INTEGER NOT NULL, "idUser" INTEGER NOT NULL,FOREIGN KEY("idBike") REFERENCES "Bike"("id") ON DELETE CASCADE,FOREIGN KEY("idClient") REFERENCES "Client"("id") ON DELETE CASCADE,FOREIGN KEY("idUser") REFERENCES "User"("id") ON DELETE CASCADE, PRIMARY KEY("id" AUTOINCREMENT))';
}
