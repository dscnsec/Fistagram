import 'package:figma_squircle/figma_squircle.dart';
import 'package:fistagram/page/signup_page.dart';
import 'package:fistagram/utils/colors.dart';
import 'package:fistagram/utils/utils.dart';
import 'package:fistagram/widgets/text_field_input.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../resources/auth_methods.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void loginUser() async {
    setState(() {
      _isLoading = true;
    });
    String result = await AuthMethods().loginUser(
        email: _emailController.text, password: _passwordController.text);

    setState(() {
      _isLoading = false;
    });

    if (result == "success") {
      //
    } else {
      showSnackBar(result, context);
    }
  }

  void navigateToSignup() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => SignupPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            width: double.infinity,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(child: Container(), flex: 2),
                //png Image,
                SizedBox(
                    height: 64,
                    child: Image.asset(
                      'assets/img/fistagram_logo.png',
                      color: primaryColor,
                    )),
                //text field for email
                const SizedBox(height: 64),
                TextFieldInput(
                    textEditingController: _emailController,
                    iconType: Icons.email_outlined,
                    hintText: 'Enter your email...',
                    textInputType: TextInputType.emailAddress),
                //text field for password
                const SizedBox(height: 24),
                TextFieldInput(
                  textEditingController: _passwordController,
                  iconType: Icons.lock_clock_outlined,
                  hintText: 'Enter your password...',
                  textInputType: TextInputType.text,
                  isObscure: true,
                ),
                // button login
                const SizedBox(height: 24),
                InkWell(
                  onTap: () {
                    loginUser();
                  },
                  child: Container(
                    child: _isLoading
                        ? const Center(
                            child:
                                CircularProgressIndicator(color: Colors.white),
                          )
                        : const Text(
                            'Log in',
                            style: TextStyle(color: Colors.white),
                          ),
                    width: double.infinity,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          borderRadius: SmoothBorderRadius(
                            cornerRadius: 6,
                            cornerSmoothing: 1,
                          ),
                        ),
                        color: primaryButtonColor),
                  ),
                ),
                Flexible(child: Container(), flex: 2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: const Text("Don't have an account?",
                          style: TextStyle(fontWeight: FontWeight.w300)),
                      padding: const EdgeInsets.symmetric(vertical: 8),
                    ),
                    GestureDetector(
                      onTap: () {
                        navigateToSignup();
                      },
                      child: Container(
                          child: const Text(
                            "Sign up.",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 8)),
                    )
                  ],
                )
                //transitioning to signing up
              ],
            )),
      ),
    );
  }
}
