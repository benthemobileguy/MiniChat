import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mini_chat/app/data/network/authentication-service.dart';
import 'package:mini_chat/helpers/global-variables.dart';
import 'package:mini_chat/helpers/utils-helpers.dart';
import 'package:mini_chat/presentation/components/default-text-form-field.dart';
import 'package:mini_chat/presentation/components/floating-text-fleid.dart';
import 'package:mini_chat/presentation/components/main-button.dart';
import 'package:mini_chat/presentation/resources/assets-manager.dart';
import 'package:mini_chat/presentation/resources/color-manager.dart';
import 'package:mini_chat/presentation/resources/font-manager.dart';
import 'package:mini_chat/presentation/resources/strings-manager.dart';
import 'package:mini_chat/presentation/resources/styles-manager.dart';
import 'package:mini_chat/presentation/resources/values-manager.dart';
import 'package:mini_chat/presentation/screens/login-screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool obscurity = false;
  bool obscurity2 = false;
  bool acceptTerms = false;
  AuthenticationService authenticationService;
  TextEditingController confirmPassController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    authenticationService = AuthenticationService(context: context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: AppMargin.m12),
          margin: const EdgeInsets.only(top: 30, left: 14, right: 14),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  const Spacer(),
                  Image.asset(ImageAssets.splashLogo, width: 120, height: 24,),
                  const Spacer(),
                  const SizedBox(
                    width: AppPadding.p20,
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(AppStrings.registerHeading,
                style: getGradientStyle(color: ColorManager.primary),),
              const SizedBox(
                height: 30,
              ),
              DefaultTextFormField(
                controller: fullNameController,
                hintText: 'James Chimdindu',
                borderColor: ColorManager.borderColor,
                prefixIcon: ImageAssets.user,
              ),
              const SizedBox(
                height: 20,
              ),
              FloatingTextFormField(
                controller: usernameController,
                hintText: 'James Chimdindu',
                borderColor: ColorManager.primary,
                prefixIcon: ImageAssets.special,
              ),
              const SizedBox(
                height: 20,
              ),
              DefaultTextFormField(
                controller: emailController,
                hintText: 'jameschimdindu@gmail.com',
                borderColor: ColorManager.borderColor,
                prefixIcon: ImageAssets.dob,
              ),
              const SizedBox(
                height: 20,
              ),
              DefaultTextFormField(
                controller: dobController,
                hintText: 'July 13, 1997',
                borderColor: ColorManager.borderColor,
                prefixIcon: ImageAssets.user,
              ),
              const SizedBox(
                height: 20,
              ),
              DefaultTextFormField(
                prefixIcon: ImageAssets.password,
                hintText: AppStrings.loginHint2,
                controller: passController,
                suffixIcon: Container(
                  child:IconButton(
                      icon: obscurity
                          ? SvgPicture.asset(
                        "assets/images/show.svg",
                        color: ColorManager.grey2,
                      )
                          : SvgPicture.asset(
                        "assets/images/hide.svg",
                        color: ColorManager.grey2,
                      ),
                      onPressed: () {
                        setState(() {
                          obscurity = !obscurity;
                        });
                      }),
                ),
                borderColor: ColorManager.borderColor,
              ),
              const SizedBox(
                height: 20,
              ),
              DefaultTextFormField(
                controller: confirmPassController,
                prefixIcon: ImageAssets.password,
                hintText: 'Confirm password',
                suffixIcon: IconButton(
                    icon: obscurity2
                        ? SvgPicture.asset(
                      "assets/images/show.svg",
                      color: ColorManager.grey2,
                    )
                        : SvgPicture.asset(
                      "assets/images/hide.svg",
                      color: ColorManager.grey2,
                    ),
                    onPressed: () {
                      setState(() {
                        obscurity2 = !obscurity2;
                      });
                    }),
                borderColor: ColorManager.borderColor,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 20,
                    height: 20,
                    child: Checkbox(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        side: MaterialStateBorderSide.resolveWith(
                              (states) =>
                              BorderSide(width: 1.5, color: ColorManager.grey2),
                        ),
                        value: acceptTerms,
                        materialTapTargetSize:
                        MaterialTapTargetSize.shrinkWrap,
                        checkColor: Colors.white,
                        activeColor: ColorManager.primary,
                        onChanged: _onAcceptTerms),
                  ),
                  Flexible(
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 4),
                      child: RichText(
                          text: TextSpan(
                              text: '  I agree to the ',
                              style: TextStyle(
                                  fontSize: 12,
                                  height: 1.6,
                                  fontWeight: FontWeight.normal,
                                  color: ColorManager.textColor,
                                  fontFamily: 'Nunito'),
                              children: [
                                TextSpan(
                                    recognizer: new TapGestureRecognizer()
                                      ..onTap = _launchURL,
                                    text: 'Terms & Conditions',
                                    style: getGradientStyle2(color: ColorManager.primary)),
                                TextSpan(
                                    text: ' and',
                                  style: TextStyle(
                                      fontSize: 12,
                                      height: 1.6,
                                      fontWeight: FontWeight.normal,
                                      color: ColorManager.textColor,
                                      fontFamily: 'Nunito'),
                                ),
                                TextSpan(
                                    recognizer: new TapGestureRecognizer()
                                      ..onTap = _launchURL,
                                    text: ' Privacy Policy',
                                    style: getGradientStyle2(color: ColorManager.primary)),
                              ])),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                height: 55,
                width: double.infinity,
                child: MainButton(
                  borderColor: ColorManager.primary,
                  color: ColorManager.primary,
                  textColor:Colors.white,
                  onPressed: () {
                  register();
                  },
                  text: AppStrings.signUp,
                  icon: '',
                ),
              ),
              const SizedBox(
                height: 14,
              ),
              GestureDetector(
                onTap: () async {

                },
                child: Container(
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "${AppStrings.alreadyHaveAccount} ",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            fontFamily: FontConstants.fontFamilyNunito,
                            color: ColorManager.textColor,
                          ),
                        ),
                        TextSpan(
                          text: AppStrings.login,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeightManager.bold,
                            fontFamily: FontConstants.fontFamilyNunito,
                            color: ColorManager.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }

  void _launchURL() {

  }

  _onAcceptTerms(bool value) {
    setState(() {
      acceptTerms = value;
    });
  }

  void register() {
    UtilsHelpers.showProgressBar(context, "Registering... Please wait");
   authenticationService.register
     (usernameController.text.trim(),
       emailController.text.trim(),
       fullNameController.text.trim(),
       dobController.text.trim(),
       passController.text.trim()).then((value) {
     Navigator.pushReplacement(
       context,
       MaterialPageRoute(
           builder: (context) =>
           const LoginScreen()),
     );
   }).catchError((error){
     pr.hide();
   });
  }
}
