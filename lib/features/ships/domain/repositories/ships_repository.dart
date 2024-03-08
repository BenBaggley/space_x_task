import 'package:dartz/dartz.dart';
import 'package:space_x/core/domain/failure.dart';
import 'package:space_x/features/ships/domain/entities/ship.dart';

/// Repository interface for ships data
abstract class ShipsRepository {
  /// Gets a list of Space X ships
  Future<Either<Failure, List<Ship>>> getShips();
}
