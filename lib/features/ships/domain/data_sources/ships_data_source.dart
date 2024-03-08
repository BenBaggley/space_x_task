import 'package:dartz/dartz.dart';
import 'package:space_x/core/domain/failure.dart';
import 'package:space_x/features/ships/domain/entities/ship.dart';

/// Data source interface for ships data
abstract class ShipsDataSource {
  /// Gets a list of Space X ships
  Future<Either<Failure, List<Ship>>> getShips();
}
