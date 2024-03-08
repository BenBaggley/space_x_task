import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:space_x/core/domain/failure.dart';
import 'package:space_x/features/rockets/domain/entities/rocket.dart';
import 'package:space_x/features/rockets/domain/repositories/rockets_repository.dart';
import 'package:space_x/features/rockets/domain/use_cases/get_rockets.dart';

import '../../../../fixtures/fixtures.dart';

class MockRocketsRepository extends Mock implements RocketsRepository {}

void main() {
  group(GetRockets, () {
    late MockRocketsRepository repository;
    late GetRockets getRockets;

    setUp(() {
      repository = MockRocketsRepository();
      getRockets = GetRockets(repository);
    });

    test('success', () async {
      final json = jsonFixture('rockets.json')['docs'] as List<dynamic>;
      final rockets = json.map((j) => Rocket.fromJson(j)).toList();

      when(() => repository.getRockets()).thenAnswer(
        (_) async => Right(rockets),
      );

      final result = await getRockets();
      expect(result, equals(Right(rockets)));
    });

    test('failure', () async {
      when(() => repository.getRockets()).thenAnswer(
        (_) async => const Left(Failure(message: 'message')),
      );

      final result = await getRockets();
      expect(result, equals(const Left(Failure(message: 'message'))));
    });
  });
}
