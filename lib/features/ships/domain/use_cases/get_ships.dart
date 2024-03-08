import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:space_x/core/domain/failure.dart';
import 'package:space_x/features/ships/domain/entities/ship.dart';
import 'package:space_x/features/ships/domain/repositories/ships_repository.dart';

/// {@template get_ships}
/// Gets a list of Ships
/// {@endtemplate}
@injectable
class GetShips {
  final ShipsRepository _repository;

  /// {@macro get_ships}
  const GetShips(this._repository);

  /// {@macro get_ships}
  Future<Either<Failure, List<Ship>>> call() => _repository.getShips();
}
