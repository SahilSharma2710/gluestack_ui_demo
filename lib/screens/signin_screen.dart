import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestackui_demo/screens/signup_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  late bool isMobileView;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    isMobileView = screenSize.width < 960;
    return Scaffold(
      backgroundColor:
          isMobileView ? $GSColors.primary600 : $GSColors.primary800,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: GSIcon(
            icon: Icons.arrow_back,
            size: GSSizes.$2xl,
            style: GSStyle(color: $GSColors.white),
          ),
        ),
        backgroundColor:
            isMobileView ? $GSColors.primary600 : $GSColors.primary800,
      ),
      body: SingleChildScrollView(
        child: !isMobileView
            ? Center(child: buildDesktopView(screenSize, context))
            : buildMobileView(screenSize, context),
      ),
    );
  }

  buildDesktopView(Size screenSize, BuildContext context) {
    return GSBox(
      style: GSStyle(
        padding: EdgeInsets.all(screenSize.height > 720 ? 90 : 10),
      ),
      child: GSHStack(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GSBox(
            style: GSStyle(
              height: 600,
              width: isMobileView ? null : screenSize.width / 3,
              padding: const EdgeInsets.only(top: 10),
              bg: $GSColors.primary600,
            ),
            child: const GSCenter(
              child: GSImage(
                path: "assets/gluestackUiProLogo_mobile.png",
                imageType: GSImageType.asset,
                size: GSSizes.$2xl,
              ),
            ),
          ),
          GSBox(
            style: GSStyle(
              height: 600,
              padding: const EdgeInsets.only(top: 10),
              bg: $GSColors.white,
            ),
            child: buildSignInForm(screenSize, context),
          ),
        ],
      ),
    );
  }

  buildMobileView(Size screenSize, BuildContext context) {
    return GSVStack(
      children: [
        GSBox(
          style: GSStyle(
              width: double.maxFinite,
              height: 150,
              margin: const EdgeInsets.only(left: 20),
              bg: $GSColors.primary600),
          child: GSVStack(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GSBox(
                style: GSStyle(height: 50),
              ),
              GSText(
                text: "Welcome Back",
                bold: true,
                style: GSStyle(
                  textStyle: TextStyle(fontSize: 24, color: $GSColors.white),
                ),
              ),
              GSBox(
                style: GSStyle(height: 5),
              ),
              GSText(
                text: "Sign in to continue",
                style: GSStyle(
                  textStyle: TextStyle(
                    fontSize: 20,
                    color: $GSColors.light300,
                  ),
                ),
              ),
            ],
          ),
        ),
        buildSignInForm(screenSize, context),
      ],
    );
  }

  GSBox buildSignInForm(Size screenSize, BuildContext context) {
    return GSBox(
      style: GSStyle(
        width: isMobileView ? double.maxFinite : null,
        height: screenSize.height < 720 ? null : screenSize.height - 150,
        borderRadius: 20,
        bg: $GSColors.white,
        padding: EdgeInsets.symmetric(
          horizontal: isMobileView ? 20 : 40,
          vertical: isMobileView ? 40 : 20,
        ),
      ),
      child: GSBox(
        style: GSStyle(
          width: isMobileView ? null : screenSize.width / 4,
        ),
        child: GSVStack(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            !isMobileView
                ? GSBox(
                    style: GSStyle(
                      margin: const EdgeInsets.only(bottom: 40),
                    ),
                    child: const GSText(
                      size: GSSizes.$xl,
                      text: "Sign In to continue",
                      bold: true,
                    ),
                  )
                : const GSBox(),
            GSInput(
              hintStyle: TextStyle(
                fontSize: isMobileView ? 16 : 14,
              ),
              style: GSStyle(
                height: isMobileView ? 55 : 40,
              ),
              hintText: "Email",
            ),
            GSBox(
              style: GSStyle(height: 20),
            ),
            GSInput(
              hintStyle: TextStyle(fontSize: isMobileView ? 16 : 14),
              style: GSStyle(
                height: isMobileView ? 55 : 40,
              ),
              hintText: "Password",
              suffixIcon: const Icon(Icons.visibility_off),
            ),
            GSBox(
              style: GSStyle(height: 20),
            ),
            GSHStack(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GSLink(
                  text: GSLinkText(
                    text: "Forgot password ?",
                    style: GSStyle(
                      textStyle: TextStyle(
                        decorationColor: $GSColors.primary600,
                        color: $GSColors.primary600,
                        fontSize: isMobileView ? 16 : 14,
                      ),
                    ),
                  ),
                  url: "",
                ),
                GSBox(
                  style: GSStyle(
                    width: 20,
                  ),
                ),
              ],
            ),
            GSBox(
              style: GSStyle(
                height: 20,
              ),
            ),
            GSHStack(children: [
              GSCheckBox(
                size: isMobileView ? GSSizes.$md : GSSizes.$sm,
                icon: GSCheckBoxIndicator(
                  style: GSStyle(
                    margin: EdgeInsets.only(right: $GSSpace.$2),
                  ),
                  child: const GSCheckBoxIcon(),
                ),
                value: "0",
                label: GSText(
                    size: isMobileView ? GSSizes.$lg : GSSizes.$sm,
                    text: "Remember me and keep me logged in"),
                onChanged: (value) {},
              ),
            ]),
            GSBox(
              style: GSStyle(
                width: double.maxFinite,
                margin: const EdgeInsets.only(top: 20, bottom: 10),
              ),
              child: GSButton(
                size: GSSizes.$md,
                variant: GSVariants.solid,
                style: GSStyle(
                  bg: $GSColors.primary600,
                  height: 50,
                ),
                onPressed: () {},
                child: GSButtonText(
                  text: "SIGN IN",
                  style: GSStyle(
                    textStyle: TextStyle(color: $GSColors.white),
                  ),
                ),
              ),
            ),
            GSHStack(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GSBox(
                  style: GSStyle(width: 100, height: 1),
                  child: GSDivider(
                    orientation: GSOrientations.horizontal,
                    style: GSStyle(
                      color: $GSColors.coolGray300,
                    ),
                  ),
                ),
                GSBox(
                  style: GSStyle(
                    width: $GSSpace.$4,
                  ),
                ),
                GSText(
                  text: "or",
                  style: GSStyle(
                    textStyle: TextStyle(fontSize: $GSFontSize.$xl),
                  ),
                ),
                GSBox(
                  style: GSStyle(
                    width: $GSSpace.$4,
                  ),
                ),
                GSBox(
                  style: GSStyle(width: 100, height: 1),
                  child: GSDivider(
                    orientation: GSOrientations.horizontal,
                    style: GSStyle(
                      color: $GSColors.coolGray300,
                    ),
                  ),
                ),
              ],
            ),
            GSBox(
              style: GSStyle(
                height: $GSSpace.$5,
              ),
            ),
            GSHStack(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GSImage(
                  path: "assets/google.png",
                  size: GSSizes.$2xs,
                  imageType: GSImageType.asset,
                  style: GSStyle(
                    textStyle: TextStyle(color: $GSColors.white),
                  ),
                ),
                GSBox(
                  style: GSStyle(
                    width: $GSSpace.$3,
                  ),
                ),
                GSImage(
                  path: "assets/facebook.png",
                  size: GSSizes.$2xs,
                  imageType: GSImageType.asset,
                  style: GSStyle(
                    textStyle: TextStyle(color: $GSColors.white),
                  ),
                ),
              ],
            ),
            GSBox(
              style: GSStyle(
                  height: $GSSpace.$12, alignment: Alignment.bottomLeft),
            ),
            GSHStack(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GSText(
                  text: "Don't have an account. ",
                  style: GSStyle(
                    textStyle: TextStyle(
                      fontSize:
                          isMobileView ? $GSFontSize.$lg : $GSFontSize.$sm,
                    ),
                  ),
                ),
                GSButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignUpScreen(),
                      ),
                    );
                  },
                  variant: GSVariants.link,
                  style: GSStyle(),
                  child: GSText(
                    text: "Sign Up",
                    underline: true,
                    size: isMobileView ? GSSizes.$lg : GSSizes.$sm,
                    style: GSStyle(
                      textStyle: TextStyle(color: $GSColors.primary600),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
