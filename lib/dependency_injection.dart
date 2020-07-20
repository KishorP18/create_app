import 'package:create/provider/theme_provider.dart';
import 'package:get_it/get_it.dart';

GetIt locator=GetIt.I;

void setUpLocator(){
   locator.registerSingleton<ThemeProvider>(ThemeProvider());
}