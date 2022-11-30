import 'package:pr2/core/exception/failure.dart';
import 'package:pr2/domain/entity/role_entity.dart';
import 'package:pr2/domain/entity/user_entity.dart';
import 'package:dartz/dartz.dart';

abstract class UserRepositories {
  String get table;

  Future<List<UserEntity>> getAll();
  Future<Either<Failure, UserEntity>> insert(
    String login,
    String password,
    RoleEnum idRole,
  );
  Future<Either<Failure, bool>> delete(int id);
}
