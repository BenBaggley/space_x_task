import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:space_x/core/domain/failure.dart';
import 'package:space_x/features/rockets/domain/entities/rocket.dart';
import 'package:space_x/features/rockets/domain/repositories/rockets_repository.dart';

/// {@template get_rockets}
/// Gets a list of Rockets
/// {@endtemplate}
@injectable
class GetRockets {
  final RocketsRepository _repository;

  /// {@macro get_rockets}
  const GetRockets(this._repository);

  /// {@macro get_rockets}
  Future<Either<Failure, List<Rocket>>> call() => _repository.getRockets();
}
