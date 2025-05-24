import 'package:crowncreation/features/authentication/screens/onboarding/onboarding.dart';
import 'package:crowncreation/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//this class is used for setup themes, bindings, animations etc..
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      //flutter detect what is the theme on your device at apply that theme on app
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      theme: KAppTheme.lightTheme,
      darkTheme: KAppTheme.darkTheme,
      home: const OnBoardingScreen(),
    );
  }
}
