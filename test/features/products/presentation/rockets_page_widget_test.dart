import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:space_x/features/rockets/application/cubit/cubit/rockets_cubit.dart';
import 'package:space_x/features/rockets/domain/entities/rocket.dart';
import 'package:space_x/features/rockets/presentation/pages/rockets_page_widget.dart';
import 'package:space_x/features/rockets/presentation/widgets/rocket_item_widget.dart';

import '../../../fixtures/fixtures.dart';
import '../../../test_app.dart';

class MockRocketsCubit extends MockCubit<RocketsState>
    implements RocketsCubit {}

void main() {
  group(RocketsPageWidget, () {
    late MockRocketsCubit cubit;

    setUp(() {
      cubit = MockRocketsCubit();
      GetIt.I.registerSingleton<RocketsCubit>(cubit);
    });

    tearDown(() async {
      await GetIt.I.reset();
    });

    testWidgets(
      'displays loaded state',
      (tester) => mockNetworkImagesFor(() async {
        final json = jsonFixture('rockets.json');
        final jsonArray = json['docs'] as List<dynamic>;
        final rockets = jsonArray.map((j) => Rocket.fromJson(j)).toList();

        final state = RocketsState.data(rockets);

        whenListen(cubit, Stream.value(state), initialState: state);
        when(() => cubit.loadRockets()).thenAnswer((_) => Future.value());

        await tester.pumpApp(
          child: const Scaffold(
            body: RocketsPageWidget(),
          ),
        );

        await tester.pumpAndSettle();

        expect(
          find.byType(RocketItemWidget, skipOffstage: false),
          findsNWidgets(rockets.length),
        );
      }),
    );

    testWidgets('displays loading state', (tester) async {
      const state = RocketsState.loading();

      whenListen(cubit, Stream.value(state), initialState: state);
      when(() => cubit.loadRockets()).thenAnswer((_) => Future.value());

      await tester.pumpApp(
        child: const Scaffold(
          body: RocketsPageWidget(),
        ),
      );

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('displays failure message in snackbar', (tester) async {
      final stateController = StreamController<RocketsState>();

      whenListen(
        cubit,
        stateController.stream,
        initialState: const RocketsState.initial(),
      );
      when(() => cubit.loadRockets()).thenAnswer((_) => Future.value());

      await tester.pumpApp(
        child: const Scaffold(
          body: RocketsPageWidget(),
        ),
      );

      stateController.add(const RocketsState.failure('error'));

      await tester.pumpAndSettle();
      expect(find.widgetWithText(SnackBar, 'error'), findsOneWidget);
    });
  });
}
