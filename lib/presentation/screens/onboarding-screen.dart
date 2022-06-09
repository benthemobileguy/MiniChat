import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart' as hex;
import 'package:mini_chat/helpers/utils-helpers.dart';
import 'package:mini_chat/presentation/components/main-button.dart';
import 'package:mini_chat/presentation/resources/assets-manager.dart';
import 'package:mini_chat/presentation/resources/color-manager.dart';
import 'package:mini_chat/presentation/resources/strings-manager.dart';
import 'package:mini_chat/presentation/resources/values-manager.dart';
import 'package:mini_chat/presentation/screens/login-screen.dart';
import 'package:mini_chat/presentation/screens/signup-screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    UtilsHelpers.setStatusBar(Colors.transparent);
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: ColorManager.white,
      body: Container(
        padding: const EdgeInsets.only(top: AppPadding.p28),
        child: SingleChildScrollView(
          child: Column(
            children: [
             Image.asset(ImageAssets.splashLogo, width: 120, height: 24,),
              const SizedBox(height: AppMargin.m20,),
              Container(
                margin: const EdgeInsets.only(left: AppMargin.m16),
                  height: AppMargin.m340,
                  width: double.infinity,
                  child: Image.asset(ImageAssets.peopleLogo),

              ),
              const SizedBox(height: AppMargin.m10,),
              Image.asset(ImageAssets.gradientLogo, width: 280, height: 55,),
              const SizedBox(height: AppMargin.m20,),
              Text(AppStrings.onboardingText,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: "Nunito",
                  color: ColorManager.grey,
                  height: 1.5,
                  fontWeight: FontWeight.normal),),
              const SizedBox(height: AppMargin.m20,),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                height: 55,
                width: double.infinity,
                child: MainButton(
                  borderColor: hex.HexColor("#8135F9"),
                  color: hex.HexColor("#8135F9"),
                  textColor: ColorManager.white,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const LoginScreen()),
                    );
                  },
                  text: 'Login',
                  icon: '',
                ),
              ),
              const SizedBox(
                height: AppMargin.m10,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                height: 55,
                width: double.infinity,
                child: MainButton(
                  borderColor: hex.HexColor("#8135F9"),
                  color: Colors.white,
                  textColor:hex.HexColor("#8135F9"),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const RegisterScreen()),
                    );
                  },
                  text: 'Sign up',
                  icon: '',
                ),
              ),
              const SizedBox(
                height: AppMargin.m40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
