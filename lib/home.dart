import 'package:create/dependency_injection.dart';
import 'package:create/provider/theme_provider.dart';
import 'package:create/routes.dart';
import 'package:create/theme_const.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'ui/intro_directory/intro_screen.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => locator<ThemeProvider>(),
        ),
      ],
      child:MyApp(),
    );
  }
}


class  MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (_,themeProvider,child){

      return  MaterialApp(
        title: "Create",
        theme: themeProvider.isDarkThemeEnabled?ThemeConst.darkThemeData:ThemeConst.lightThemeData,
        debugShowCheckedModeBanner: false,
        darkTheme: ThemeConst.darkThemeData,
        initialRoute: Routes.home,
        onGenerateRoute: Routes.generateRoute,
        home: IntroScreen(),
      );
      },

    );
  }
}




