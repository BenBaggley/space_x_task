import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:space_x/features/rockets/domain/entities/rocket.dart';
import 'package:space_x/features/rockets/presentation/widgets/rocket_item_widget.dart';

import '../../../fixtures/fixtures.dart';
import '../../../test_app.dart';

void main() {
  group(RocketItemWidget, () {
    final json = jsonFixture('rockets.json');
    final jsonArray = json['docs'] as List<dynamic>;
    final rocket = Rocket.fromJson(jsonArray.first);

    testWidgets(
      'displays rocket detail',
      (tester) => mockNetworkImagesFor(() async {
        await tester.pumpApp(
          child: RocketItemWidget(
            rocket: rocket,
          ),
        );

        expect(find.text(rocket.name), findsOneWidget);
        expect(find.text(rocket.description), findsOneWidget);
        expect(find.byType(Image), findsOneWidget);
      }),
    );
  });
}
