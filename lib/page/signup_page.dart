import 'package:figma_squircle/figma_squircle.dart';
import 'package:fistagram/utils/colors.dart';
import 'package:fistagram/widgets/text_field_input.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  
  @override
  Widget build(BuildContext context) {
   final TextEditingController _emailController= TextEditingController();
   final TextEditingController _passwordController= TextEditingController();
   final TextEditingController _bioController = TextEditingController();
   final TextEditingController _usernameController = TextEditingController();
   @override
   void dispose(){
     super.dispose();
     _emailController.dispose();
     _passwordController.dispose();
     _bioController.dispose();
     _usernameController.dispose();
   }

   return Scaffold(
     backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(child: Container(), flex: 1),
                //png Image,
                SizedBox(
                  height: 64,
                  child: Image.asset('assets/img/fistagram_logo.png', color: primaryColor,)
                ),
                const SizedBox( height: 24),
                //profile pic
                Stack(
                  children: [
                    const CircleAvatar(
                      radius: 64,
                      backgroundImage: NetworkImage(
                        'https://images.unsplash.com/photo-1511367461989-f85a21fda167?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1631&q=80',
                      ),
                    ),
                    Positioned(
                      bottom: -10,
                      left: 80,
                      child: IconButton(
                        onPressed: (){}, 
                        icon: const Icon(
                          Icons.add_a_photo, 
                          color: primaryColor,
                        )),
                      )
                  ]
                ),
                const SizedBox( height: 24),
                //text field for username 
                TextFieldInput(textEditingController: _usernameController, iconType: Icons.portrait_rounded, hintText: 'Enter your username...', textInputType: TextInputType.text),
                const SizedBox( height: 24),
                //text field for bio
                TextFieldInput(textEditingController: _bioController, iconType: Icons.text_fields_outlined, hintText: 'Enter your bio...', textInputType: TextInputType.text),
                const SizedBox( height: 24),
                //text field for email
                TextFieldInput(textEditingController: _emailController,iconType: Icons.email_outlined, hintText: 'Enter your email...', textInputType: TextInputType.emailAddress),
                //text field for password
                const SizedBox( height: 24),
                TextFieldInput(textEditingController: _passwordController, iconType: Icons.lock_clock_outlined,hintText: 'Enter your password...', textInputType: TextInputType.text, isObscure: true,),
                // button login 
                const SizedBox( height: 24),
                InkWell(
                  onTap: (){},
                  child: Container(
                    child: const Text('Sign up', 
                      style: TextStyle(
                        color: Colors.white
                      ),
                    ),
                    width: double.infinity,
                    height: 44,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: ShapeDecoration(shape: RoundedRectangleBorder(
                      borderRadius: SmoothBorderRadius(
                        cornerRadius: 6,
                        cornerSmoothing: 1,
                      ),
                    ),
                    color: primaryButtonColor),
                  ),
                ),
                const SizedBox( height: 14),
                Flexible(child: Container(), flex: 1),
                Row (
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: const Text("Already have an account?",
                        style: TextStyle(
                          fontWeight: FontWeight.w300
                        )
                      ),
                      padding: const EdgeInsets.symmetric( vertical: 8),
                    ),
                    GestureDetector(
                      onTap: (){},
                      child: Container(
                        child: const Text("Log in.",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 8)
                        ),
                    )
                  ],
                ),
                ],) 
              ),
            ),
      ),
        );
    }
  }

