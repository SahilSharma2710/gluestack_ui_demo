import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestackui_demo/screens/signin_screen.dart';
import 'package:gluestackui_demo/screens/signup_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: (screenSize.width < 760)
          ? $GSColors.primary600
          : $GSColors.primary800,
      body: (screenSize.width < 760)
          ? buildMainContent(screenSize, context)
          : GSCenter(
              child: GSBox(
                style: GSStyle(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  width: 550,
                  height: 550,
                  bg: $GSColors.primary600,
                ),
                child: buildMainContent(screenSize, context),
              ),
            ),
    );
  }

  GSVStack buildMainContent(Size screenSize, BuildContext context) {
    return GSVStack(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const GSImage(
          path: "assets/gluestackUiProLogo_mobile.png",
          imageType: GSImageType.asset,
          size: GSSizes.$2xl,
        ),
        GSBox(
          style: GSStyle(
            width: screenSize.width / 1.1,
          ),
          child: GSButton(
            size: GSSizes.$md,
            variant: GSVariants.solid,
            style: GSStyle(
              bg: $GSColors.white,
              height: 40,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SignInScreen(),
                ),
              );
            },
            child: GSButtonText(
              text: "LOG IN",
              style: GSStyle(
                textStyle: TextStyle(color: $GSColors.primary600),
              ),
            ),
          ),
        ),
        GSBox(
          style: GSStyle(
            height: 20,
          ),
        ),
        GSBox(
          style: GSStyle(
            width: screenSize.width / 1.1,
          ),
          child: GSButton(
            size: GSSizes.$md,
            variant: GSVariants.outline,
            style: GSStyle(
                borderColor: $GSColors.white, borderWidth: 1, height: 40),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SignUpScreen(),
                ),
              );
            },
            child: GSButtonText(
              text: "SIGN UP",
              style: GSStyle(
                textStyle: TextStyle(color: $GSColors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
