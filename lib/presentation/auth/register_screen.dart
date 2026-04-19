
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:quranapp/presentation/auth/widgets/customwidgets.dart';

import '../../data/domain/app_strings.dart';
import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? account = await _googleSignIn.signIn();

      if (account == null) {
        print("User cancelled");
        return;
      }

      final GoogleSignInAuthentication auth = await account.authentication;

      print("Name: ${account.displayName}");
      print("Email: ${account.email}");
      print("Token: ${auth.accessToken}");

    } catch (error) {
      print("Error: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 60, left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Qurania",
                    style: TextStyle(color: Colors.white, fontSize: 25,fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 15,),
                  Padding(
                    padding: const EdgeInsets.only(left: 60),
                    child: Text("Create Your Qurania Account",
                        style: TextStyle(color: Colors.white, fontSize: 25,fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(height: 20,),

                  Customtextformfield(
                    controller: _emailController,
                      hintText: "Enter Email",
                      labelText: "Email",
                      keyboardtype: TextInputType.text,
                      icons: Icons.email,
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return 'Enter your email please';
                        }

                        if(!value.endsWith("@gmail.com")){
                          return "Enter a valid email";
                        }
                        return null;
                      }

                  ),

                  SizedBox(height: 10,),

                  Customtextformfield(
                    controller: _passwordController,
                      hintText: "Enter Password",
                      labelText: "Password",
                      keyboardtype: TextInputType.number,
                      icons: Icons.remove_red_eye,
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return 'Enter your password please';
                        }

                        if(value.length < 6){
                          return "Enter more then 6";
                        }
                        return null;
                      }

                  ),

                  SizedBox(height: 10,),

                  Customtextformfield(
                    controller: _confirmPasswordController,
                      hintText: "Enter Password",
                      labelText: "Confirm Password",
                      keyboardtype: TextInputType.number,
                      icons: Icons.remove_red_eye,
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return 'Enter your password please';
                        }
                        if(value != _passwordController.text){
                          return 'password does not match';
                        }

                        return null;
                      }

                  ),


                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size(double.infinity, 50),
                            backgroundColor: AppColors.primaryButton

                        ),
                        onPressed: (){
                          if (_formKey.currentState!.validate()) {

                            print("Form is valid");

                            Navigator.push(context, MaterialPageRoute(builder: (ctx)=> LoginScreen()));
                          } else {

                            print("Form is not valid");
                          }
                        },
                        child: Text('Register',style: TextStyle(color: AppColors.primaryButtonText),)),
                  ),
                  SizedBox(height: 20,),
                  // ➖ OR CONTINUE WITH ➖
                  Row(
                    children: [
                      Expanded(child: Divider(color: Colors.grey)),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child:
                        Text("Or continue with",style: TextStyle(color: Colors.blue,fontSize: 13),),
                      ),
                      Expanded(child: Divider(color: Colors.grey)),
                    ],
                  ),

                  SizedBox(height: 20),


                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SizedBox(
                      width: double.infinity,
                      height: 55,
                      child: OutlinedButton.icon(
                        onPressed: () {
                          signInWithGoogle();
                        },
                        icon:Icon(Icons.g_mobiledata, size: 28),
                        label: Text("Continue with Google"),
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: Colors.grey),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 15),

                  // ⚫ APPLE BUTTON
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SizedBox(
                      width: double.infinity,
                      height: 55,
                      child: OutlinedButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.apple),
                        label: Text("Continue with Apple"),
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: Colors.grey),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                    ),
                  ),


                ],
              ),
            ),
          ),
        ),

    );
  }
}
