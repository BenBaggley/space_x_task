import 'package:dartz/dartz.dart';
import 'package:space_x/core/domain/failure.dart';
import 'package:space_x/features/rockets/domain/entities/rocket.dart';

/// Repository interface for rockets data
abstract class RocketsRepository {
  /// Gets a list of Space X rockets
  Future<Either<Failure, List<Rocket>>> getRockets();
}
