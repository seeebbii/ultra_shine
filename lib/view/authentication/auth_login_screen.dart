import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ultra_shine/app/constant/controllers.dart';
import 'package:ultra_shine/app/constant/image_paths.dart';
import 'package:ultra_shine/app/constant/imp.dart';
import 'package:ultra_shine/app/utils/colors.dart';
import 'package:ultra_shine/view/components/auth_button.dart';
import 'package:ultra_shine/view/components/auth_social_button.dart';
import 'package:ultra_shine/view/components/auth_textfield.dart';

class AuthLoginScreen extends StatefulWidget {
  const AuthLoginScreen({Key? key}) : super(key: key);

  @override
  State<AuthLoginScreen> createState() => _AuthLoginScreenState();
}

class _AuthLoginScreenState extends State<AuthLoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool obSecureText = true;

  void _trySubmit() async {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();

    if (isValid) {
      // CALL LOGIN METHOD

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        width: double.infinity,
        child: Form(
          key: _formKey,
          child: Stack(
            children: [
              Positioned(
                top: 0.05.sh,
                left: 0.02.sw,
                child: GestureDetector(
                  onTap: () => navigationController.goBack(),
                    child: Image.asset(
                  ImagePaths.backArrow,
                  scale: 0.9,
                )),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 0.18.sh,
                      ),
                      Text('Welcome',
                          style: Theme.of(context).textTheme.headline1),
                      Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: Text('Login to your account',
                              style: Theme.of(context).textTheme.headline2)),
                      SizedBox(
                        height: 0.12.sh,
                      ),
                      _buildEmailField(),
                      _buildPasswordField(),
                      SizedBox(
                        height: 0.03.sh,
                      ),
                      _buildLoginButton(),
                      SizedBox(
                        height: 0.02.sh,
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Divider(
                              indent: 0.05.sw,
                              endIndent: 0.05.sw,
                            ),
                          ),
                          Text(
                            "or sign in with",
                            style:
                                Theme.of(context).textTheme.headline2?.copyWith(
                                      color: Colors.black,
                                    ),
                          ),
                          Expanded(
                            child: Divider(
                              indent: 0.05.sw,
                              endIndent: 0.05.sw,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 0.02.sh,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _buildFacebookButton(),
                          _buildGoogleButton()
                        ],
                      ),
                      SizedBox(
                        height: 0.08.sh,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEmailField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: AuthTextField(
        controller: emailController,
        borderRadius: authTextFieldContainerBorderRadius,
        containerBoxColor: authTextFieldContainerColor,
        hintText: 'Email',
        suffixIcon: const SizedBox.shrink(),
        keyType: TextInputType.emailAddress,
        validator: (str) {
          if (str == null || str == '') {
            return "Email is required";
          } else if (!emailValidate.hasMatch(str)) {
            return "Email is not valid";
          }
          return null;
        },
        obSecureText: false,
        action: TextInputAction.next,
      ),
    );
  }

  Widget _buildPasswordField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: AuthTextField(
        controller: passwordController,
        borderRadius: authTextFieldContainerBorderRadius,
        containerBoxColor: authTextFieldContainerColor,
        hintText: 'Password',
        suffixIcon: IconButton(
          splashRadius: 0.1,
          onPressed: () => setState(() => obSecureText = !obSecureText),
          icon: obSecureText
              ? const Icon(
                  Icons.visibility,
                )
              : const Icon(
                  Icons.visibility_off,
                ),
        ),
        validator: (str) {
          if (str == null || str == '') {
            return "Password is required";
          }
          return null;
        },
        action: TextInputAction.done,
        obSecureText: obSecureText,
        keyType: TextInputType.text,
      ),
    );
  }

  Widget _buildLoginButton() {
    return AuthButton(
      onPressed: _trySubmit,
      buttonText: 'LOGIN',
    );
  }

  Widget _buildFacebookButton() {
    return AuthSocialButton(
        onPressed: () {
          debugPrint("Facebook pressed");
        },
        socialName: 'Facebook',
        imagePath: ImagePaths.facebookIcon,
        backGroundColor: facebookColor,
        textColor: Colors.white);
  }

  Widget _buildGoogleButton() {
    return AuthSocialButton(
        onPressed: () {
          debugPrint("Google pressed");
        },
        socialName: 'Google',
        imagePath: ImagePaths.google,
        backGroundColor: googleColor,
        textColor: Colors.black54);
  }

  Widget _buildSignUpText() {
    return RichText(
      text: TextSpan(children: [
        TextSpan(
          text: "Dont't have an account? ",
          style: Theme.of(context).textTheme.headline2?.copyWith(
                color: Colors.black,
              ),
        ),
        TextSpan(
          text: "Signup",
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              print("SIGNUP TAPPED");
            },
          style: Theme.of(context).textTheme.headline2?.copyWith(
              color: Colors.red, decoration: TextDecoration.underline),
        ),
      ]),
    );
  }
}
