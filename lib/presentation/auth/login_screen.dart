
import 'package:flutter/material.dart';
import 'package:quranapp/presentation/auth/register_screen.dart';
import 'package:quranapp/presentation/auth/widgets/customwidgets.dart';
import 'package:quranapp/presentation/common/bottom_navigation_screen.dart';

import '../../data/domain/app_strings.dart';
import '../home/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
                    child: Text("Login to your account",
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


                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Text("Forgot Password?",
                          style: TextStyle(color: Colors.blue,fontSize: 14,fontWeight: FontWeight.bold),),
                      ),
                    ],
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

                            Navigator.push(context, MaterialPageRoute(builder: (ctx)=> HomeScreen()));

                          } else {

                            print("Form is not valid");
                          }

                        },
                        child: Text('Login',style: TextStyle(color: AppColors.primaryButtonText),)),
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
                            onPressed: () {},
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

                  SizedBox(height: 10,),

                  Center(
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      children: [

                        Text("Don't have an account? ",style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),),

                        GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (ctx)=> BottomNavigationScreen()));
                          },
                          child: Text(
                            "Register",
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                      ],
                    ),
                  )

                ],
              ),
            ),
          ),
        ),

    );
  }
}
