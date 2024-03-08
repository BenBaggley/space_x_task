import 'package:dartz/dartz.dart';
import 'package:space_x/core/domain/failure.dart';
import 'package:space_x/features/rockets/domain/entities/rocket.dart';

/// Data source interface for rockets data
abstract class RocketsDataSource {
  /// Gets a list of Space X rockets
  Future<Either<Failure, List<Rocket>>> getRockets();
}
