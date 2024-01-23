import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestackui_demo/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GluestackProvider(
      gluestackTokenConfig: GluestackTokenConfig(
        gsColorsToken: const GSColorsToken(
          primary600: Color.fromARGB(255, 119, 59, 224),
          primary800: Color.fromARGB(255, 68, 37, 121),
        ),
      ),
      child: const MaterialApp(
        title: 'GlueStack UI Demo',
        home: SplashScreen(),
      ),
    );
  }
}
