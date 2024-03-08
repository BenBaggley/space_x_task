import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:space_x/core/domain/failure.dart';
import 'package:space_x/features/rockets/application/cubit/cubit/rockets_cubit.dart';
import 'package:space_x/features/rockets/domain/entities/rocket.dart';
import 'package:space_x/features/rockets/domain/use_cases/get_rockets.dart';

import '../../../fixtures/fixtures.dart';

class MockGetRockets extends Mock implements GetRockets {}

void main() {
  group(RocketsCubit, () {
    late MockGetRockets getRockets;

    setUp(() {
      getRockets = MockGetRockets();
    });

    test('initial state', () {
      final rocketsCubit = RocketsCubit(getRockets);
      expect(rocketsCubit.state, const RocketsState.initial());
    });

    final json = jsonFixture('rockets.json')['docs'] as List<dynamic>;
    final rockets = json.map((j) => Rocket.fromJson(j)).toList();

    blocTest<RocketsCubit, RocketsState>(
      'loadRockets emits loading and data when successful',
      setUp: () {
        when(() => getRockets()).thenAnswer(
          (_) async => Right(rockets),
        );
      },
      build: () => RocketsCubit(getRockets),
      act: (cubit) => cubit.loadRockets(),
      expect: () => [
        const RocketsState.loading(),
        RocketsState.data(rockets),
      ],
      verify: (_) {
        verify(() => getRockets()).called(1);
      },
    );

    blocTest<RocketsCubit, RocketsState>(
      'loadRockets emits loading and failure when unsuccessful',
      setUp: () {
        when(() => getRockets()).thenAnswer(
          (_) async => const Left(Failure(message: 'message')),
        );
      },
      build: () => RocketsCubit(getRockets),
      act: (cubit) => cubit.loadRockets(),
      expect: () => [
        const RocketsState.loading(),
        const RocketsState.failure('message'),
      ],
      verify: (_) {
        verify(() => getRockets()).called(1);
      },
    );
  });
}
