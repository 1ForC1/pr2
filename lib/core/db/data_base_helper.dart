import 'dart:io';

import 'package:pr2/common/data_base_request.dart';
import 'package:pr2/data/model/bike_type.dart';
import 'package:pr2/data/model/brakes_type.dart';
import 'package:pr2/data/model/brand.dart';
import 'package:pr2/data/model/client.dart';
import 'package:pr2/data/model/supplier.dart';
import 'package:pr2/data/model/user.dart';
import 'package:pr2/data/model/bike.dart';
import 'package:pr2/data/model/warehouse.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:path/path.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import '../../data/model/role.dart';
import '../../domain/entity/role_entity.dart';

class DataBaseHelper {
  static final DataBaseHelper instance = DataBaseHelper._instance();

  DataBaseHelper._instance();

  final int _version = 1;
  late final String _pathDB;
  late final Directory _appDocumentDirectory;
  late final Database database;

  Future<void> init() async {
    _appDocumentDirectory =
        await path_provider.getApplicationDocumentsDirectory();

    _pathDB = join(_appDocumentDirectory.path, 'pr2.db');

    if (Platform.isLinux || Platform.isWindows || Platform.isMacOS) {
      sqfliteFfiInit();
      database = await databaseFactoryFfi.openDatabase(_pathDB,
          options: OpenDatabaseOptions(
            version: _version,
            onUpgrade: (db, oldVersion, newVersion) async =>
                await onUpdateTable(db),
            onCreate: (db, version) async => await onCreateTable(db),
          ));
    } else {
      database = await openDatabase(
        _pathDB,
        version: _version,
        onUpgrade: (db, oldVersion, newVersion) => onUpdateTable(db),
        onCreate: (db, version) async => await onCreateTable(db),
      );
    }
  }

  Future<void> onUpdateTable(Database db) async {
    var tables = await db.rawQuery('SELECT name FROM sqlite_master');

    for (var table in DataBaseRequest.tableList.reversed) {
      if (tables.where((element) => element['name'] == table).isNotEmpty) {
        await db.execute(DataBaseRequest.deleteTable(table));
      }
    }

    await onCreateTable(db);
  }

  Future<void> onCreateTable(Database db) async {
    for (var tableCreate in DataBaseRequest.tableCreateList) {
      await db.execute(tableCreate);
    }
    await onInitTable(db);
  }

  Future<void> onInitTable(Database db) async {
    try {
      for (var element in RoleEnum.values) {
        db.insert(DataBaseRequest.tableRole, Role(role: element.name).toMap());
      }

      db.insert(
          DataBaseRequest.tableUser,
          User(login: 'admin', idRole: RoleEnum.admin, password: 'admin123')
              .toMap());

      db.insert(
          DataBaseRequest.tableSupplier,
          Supplier(
                  title: 'Stels Corp',
                  address: 'Россия, Москва, ул. Автобусов, 3')
              .toMap());

      db.insert(
          DataBaseRequest.tableWarehouse,
          Warehouse(
                  warehouseNumber: 'warehouse_number',
                  address: 'address',
                  cellQuantity: 'cell_quantity',
                  idSupplier: Supplier(
                      title: 'Stels Corp',
                      address: 'Россия, Москва, ул. Автобусов, 3'))
              .toMap());

      db.insert(
          DataBaseRequest.tableBrakesType,
          BrakesType(
            title: 'Дисковые тормоза',
          ).toMap());

      db.insert(
          DataBaseRequest.tableBrand,
          Brand(
            title: 'Stinger',
          ).toMap());

      db.insert(
          DataBaseRequest.tableBikeType,
          BikeType(
            title: 'Горный',
          ).toMap());

      db.insert(
          DataBaseRequest.tableClient,
          Client(
                  Surname: 'Иванов',
                  Name: 'Иван',
                  Patronymic: 'Иванович',
                  Telephone: '891919191919')
              .toMap());

      db.insert(
          DataBaseRequest.tableBike,
          Bike(
                  idBrand: Brand(
                    title: 'Stinger',
                  ),
                  idBikeType: BikeType(
                    title: 'Горный',
                  ),
                  idWarehouse: Warehouse(
                      warehouseNumber: 'warehouse_number',
                      address: 'address',
                      cellQuantity: 'cell_quantity',
                      idSupplier: Supplier(
                          title: 'Stels Corp',
                          address: 'Россия, Москва, ул. Автобусов, 3')),
                  idBrakesType: BrakesType(
                    title: 'Дисковые тормоза',
                  ),
                  cost: 12000,
                  diameter: 16,
                  year: 2021)
              .toMap());
    } on DatabaseException catch (error) {
      print(error.result);
    }
  }

  Future<void> OnDropDataBase() async {
    await database.close();
    if (Platform.isLinux || Platform.isWindows || Platform.isMacOS) {
      databaseFactoryFfi.deleteDatabase(_pathDB);
    } else {
      deleteDatabase(_pathDB);
    }
  }
}
