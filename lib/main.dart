import 'package:create/dependency_injection.dart';
import 'package:flutter/foundation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setUpLocator();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  LicenseRegistry.addLicense(() async*{
     final license=await rootBundle.loadString('assets/google_fonts/OFL.txt');
     yield  LicenseEntryWithLineBreaks(['google_fonts'], license);
  });
  runApp(Home());
}


