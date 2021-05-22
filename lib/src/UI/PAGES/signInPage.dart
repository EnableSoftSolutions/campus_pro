import 'package:bot_toast/bot_toast.dart';
import 'package:campus_pro/src/UI/WIDGETS/toast.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:campus_pro/src/UI/PAGES/homePage.dart';
import 'package:campus_pro/src/UI/PAGES/userType.dart';
import 'package:campus_pro/src/DATA/BLOC_CUBIT/SIGN_IN_CUBIT/sign_in_cubit.dart';
import 'package:campus_pro/src/UTILS/fieldValidators.dart';
import 'package:campus_pro/src/CONSTANTS/themeData.dart';
import 'package:campus_pro/src/UTILS/appImages.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../DATA/MODELS/signInModel.dart';

class SignInPage extends StatefulWidget {
  static const routeName = "/signin-page";
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController mobileController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool _showPassword = false;

  @override
  void dispose() {
    mobileController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: customGradient,
      ),
      child: Scaffold(
        appBar: AppBar(toolbarHeight: 0.0),
        body: BlocConsumer<SignInCubit, SignInState>(
          listener: (context, state) {
            if (state is SignInLoadSuccess) {
              if (state.status) {
                toast("SignIn Successfully!");
                Navigator.pushNamedAndRemoveUntil(
                    context, UserType.routeName, (route) => false);
              }
            }
            if (state is SignInLoadFail) {
              toastFailedNotification(state.failReason);
            }
          },
          builder: (context, state) {
            if (state is SignInLoadInProgress) {
              return buildSignInForm(context, showLoader: true);
            } else if (state is SignInLoadSuccess) {
              return buildSignInForm(context, showLoader: false);
            } else if (state is SignInLoadFail) {
              return buildSignInForm(context, showLoader: false);
            } else {
              return buildSignInForm(context);
            }
          },
        ),
      ),
    );
  }

  Widget buildSignInForm(BuildContext context, {bool showLoader = false}) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 250,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(AppImages.logo), fit: BoxFit.cover),
              ),
              // child: Image.asset(AppImages.logo, height: 50),
              // color: Colors.red,
            ),
            Container(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  RichText(
                    text: TextSpan(
                      text: "Hi ",
                      style: TextStyle(color: Colors.black, fontSize: 30),
                      children: <TextSpan>[
                        TextSpan(
                          text: "User",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w700),
                          recognizer: TapGestureRecognizer()..onTap = () {},
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    "Sign in to Continue",
                    style: TextStyle(color: Color(0xff777777), fontSize: 16),
                  ),
                  SizedBox(height: 40.0),
                  buildLabels("Mobile Number"),
                  buildTextField(
                      controller: mobileController,
                      validator: FieldValidators.mobileValidator,
                      hintText: "type here",
                      obscureText: _showPassword,
                      suffixIcon: false),
                  SizedBox(height: 20.0),
                  buildLabels("Password"),
                  buildTextField(
                      controller: passwordController,
                      validator: FieldValidators.passwordValidator,
                      hintText: "type here",
                      obscureText: _showPassword,
                      suffixIcon: true),
                  SizedBox(height: 60.0),
                  if (showLoader)
                    Center(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(),
                        SizedBox(width: 12),
                        Text(
                          "Please wait...",
                          textScaleFactor: 1.0,
                        )
                      ],
                    ))
                  else
                    Column(
                      children: [
                        buildSignUpBtn(),
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          width: MediaQuery.of(context).size.width,
                          child: Text(
                            "Forget Password?",
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container buildSignUpBtn() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [accentColor, primaryColor]),
      ),
      child: FlatButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            final credentials = {
              "MobileNo": mobileController.text,
              "Pass": passwordController.text,
            };

            print("Sending credentials data = $credentials");

            context.read<SignInCubit>().signInCubitCall(credentials);
          }
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(),
            Text(
              "SIGN IN",
              style: TextStyle(
                  fontFamily: "BebasNeue-Regular", color: Colors.white),
            ),
            Icon(Icons.arrow_forward, color: Colors.white),
          ],
        ),
      ),
    );
  }

  Container buildTextField({
    bool obscureText = false,
    bool suffixIcon = false,
    String? hintText,
    String? Function(String?)? validator,
    @required TextEditingController? controller,
  }) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      child: TextFormField(
        obscureText: !obscureText ? false : true,
        controller: controller,
        validator: validator,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xffECECEC),
            ),
            gapPadding: 0.0,
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xffECECEC),
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xffECECEC),
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
            ),
          ),
          hintText: hintText,
          hintStyle: TextStyle(color: Color(0xffA5A5A5)),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
          suffixIcon: suffixIcon
              ? InkWell(
                  onTap: () {
                    setState(() {
                      _showPassword = !_showPassword;
                    });
                  },
                  child: !_showPassword
                      ? Icon(Icons.remove_red_eye_outlined)
                      : Icon(Icons.remove_red_eye),
                )
              : null,
        ),
        //   suffixIcon: suffixIcon
        //       ? InkWell(
        //           onTap: () {
        //             setState(() {
        //               _showPassword = !_showPassword;
        //             });
        //           },
        //           child: SizedBox(
        //             width: double.minPositive,
        //             child: Center(
        //               child: Text(
        //                 !_showPassword ? "Hide" : "Show",
        //                 textScaleFactor: 1.0,
        //                 style: TextStyle(
        //                     color: Color(0xff77838F),
        //                     fontWeight: FontWeight.w700),
        //               ),
        //             ),
        //           ),
        //         )
        //       : null,
        // ),
      ),
    );
  }

  Text buildLabels(String label) {
    return Text(
      label,
      style: TextStyle(
        color: Theme.of(context).primaryColor,
        // color: Color(0xffA5A5A5),
      ),
    );
  }
}
