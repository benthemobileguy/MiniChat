import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:email_validator/email_validator.dart';
import 'package:mini_chat/app/data/network/authentication-service.dart';
import 'package:mini_chat/helpers/alert-manager.dart';
import 'package:mini_chat/helpers/global-variables.dart';
import 'package:mini_chat/helpers/utils-helpers.dart';
import 'package:mini_chat/presentation/components/default-text-form-field.dart';
import 'package:mini_chat/presentation/components/main-button.dart';
import 'package:mini_chat/presentation/resources/assets-manager.dart';
import 'package:mini_chat/presentation/resources/color-manager.dart';
import 'package:mini_chat/presentation/resources/font-manager.dart';
import 'package:mini_chat/presentation/resources/strings-manager.dart';
import 'package:mini_chat/presentation/resources/styles-manager.dart';
import 'package:mini_chat/presentation/resources/values-manager.dart';
import 'package:mini_chat/presentation/screens/home/home-screen.dart';
import 'package:mini_chat/presentation/screens/signup-screen.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool obscurity = false;
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  AuthenticationService authenticationService;
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
          height: MediaQuery.of(context).size.height * 0.95,
          child: Form(
            key: _formKey,
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
                Text(AppStrings.loginHeading,
                  style: getGradientStyle(color: ColorManager.primary),),
                const SizedBox(
                  height: 30,
                ),
                DefaultTextFormField(
                  controller: emailController,
                  hintText: AppStrings.loginHint1,
                  borderColor: ColorManager.borderColor,
                  prefixIcon: ImageAssets.user,
                  validator: (value) {
                    if (!EmailValidator.validate(
                        value.trim())) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                DefaultTextFormField(
                  controller: passController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Password must be empty';
                    }
                    return null;
                  },
                  prefixIcon: ImageAssets.password,
                  hintText: AppStrings.loginHint2,
                  suffixIcon: IconButton(
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
                  borderColor: ColorManager.borderColor,
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
                      login();
                    },
                    text: AppStrings.login,
                    icon: '',
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const RegisterScreen()),
                    );
                  },
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "${AppStrings.dontHaveAccount} ",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            fontFamily: FontConstants.fontFamilyNunito,
                            color: ColorManager.textColor,
                          ),
                        ),
                        TextSpan(
                          text: AppStrings.signUp,
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
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void login() {
    if (emailController.text.isNotEmpty && passController.text.isNotEmpty) {
      UtilsHelpers.showProgressBar(context, "Logging in...");
      authenticationService.login(emailController.text.trim(),
          passController.text.trim()).then((value){
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  const HomeScreen()),
        );
      }).catchError((error){
        pr.hide();
      });
    }else{
      AlertManager.showToast("Please fill in all fields");
    }



  }
}
