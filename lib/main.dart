import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:space_x/app/app.dart';

void main() {
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('google_fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });

  SpaceX.run();
}
