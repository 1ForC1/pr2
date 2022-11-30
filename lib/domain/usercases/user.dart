import 'package:pr2/core/exception/failure.dart';
import 'package:pr2/core/usercases/users_user_case.dart';
import 'package:pr2/domain/entity/user_entity.dart';
import 'package:pr2/domain/repositories/users_repositories.dart';
import 'package:dartz/dartz.dart';

class Users implements UsersUserCase<Failure, UserEntity> {
  final UserRepositories usersRepositories;

  Users(this.usersRepositories);

  @override
  Future<Either<Failure, bool>> delete(UserEntity params) async {
    return await usersRepositories.delete(params.id);
  }

  @override
  Future<List<UserEntity>> get(UserEntity params) {
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  Future<List<UserEntity>> getAll() async {
    return Future<List<UserEntity>>.delayed(
      const Duration(seconds: 2),
      () async => (await usersRepositories.getAll())
          .map((e) => UserEntity(id: e.id, login: e.login, idRole: e.idRole))
          .toList(),
    );
  }

  @override
  Future<Either<Failure, UserEntity>> insert(UserEntity params) async {
    return await usersRepositories.insert(
      params.login,
      params.password,
      params.idRole,
    );
  }

  @override
  Future<Either<Failure, UserEntity>> update(UserEntity params) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
