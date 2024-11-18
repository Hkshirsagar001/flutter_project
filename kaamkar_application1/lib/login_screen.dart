import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kaamkar_application1/landing_screen.dart';
import 'package:kaamkar_application1/on_boarding.dart';
import 'signup_screen.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool rememberMe = false;
  bool isObscure = true; // Controls password visibility

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  final TextEditingController _emailTextEditingController = TextEditingController(); 
   final TextEditingController _passwordTextEditingController = TextEditingController(); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xffD7CFFE),
              Color(0xff6D60AF),
            ],
            begin: Alignment.topRight,
            end: Alignment.topLeft,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 60),
                child: Text(
                  "Login In",
                  style: GoogleFonts.lato(
                    color: Colors.white,
                    fontSize: 32, // Title font size
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                      color: Colors.white,
                    ),
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Welcome Back!",
                            style: GoogleFonts.lato(
                              color: Colors.black,
                              fontSize: 28, // Subtitle font size
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "To keep connected with us, please login with your personal info",
                            style: GoogleFonts.lato(
                              color: Colors.grey,
                              fontSize: 16, // Body text font size
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.80),
                                borderRadius: BorderRadius.circular(8.0),
                                // boxShadow: [
                                //   BoxShadow(
                                //     color: Colors.grey.withOpacity(0.25),
                                //     offset: const Offset(0, 4),
                                //   ),
                                // ],
                              ),
                              child: TextField(
                                controller: _emailTextEditingController,
                                decoration: InputDecoration(
                                  hintText: "Email Address",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    borderSide: BorderSide.none,
                                  ),
                                  contentPadding: const EdgeInsets.all(16.0),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.80),
                              borderRadius: BorderRadius.circular(8.0),
                              // boxShadow: [
                              //   BoxShadow(
                              //     color: Colors.grey.withOpacity(0.25),
                              //     offset: const Offset(0, 4),
                              //   ),
                              // ],
                            ),
                            child: TextField(
                              controller: _passwordTextEditingController,
                              decoration: InputDecoration(
                                hintText: "Password",
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    isObscure
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      isObscure = !isObscure;
                                    });
                                  },
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  borderSide: BorderSide.none,
                                ),
                                contentPadding: const EdgeInsets.all(16.0),
                              ),
                              obscureText: isObscure,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Transform.scale(
                                scale:
                                    1.4, // Increase the size of the checkbox by 40%
                                child: Checkbox(
                                  value: rememberMe,
                                  onChanged: (value) {
                                    setState(() {
                                      rememberMe = value ?? false;
                                    });
                                  },
                                ),
                              ),
                              Text("Remember me", style: GoogleFonts.lato()),
                              const Spacer(),
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  "Forgot Password",
                                  style: GoogleFonts.lato(color: const Color(0xff6D60AF)),
                                  // style: TextStyle(
                                  //   color: Color(0xff6D60AF),
                                  // ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Center(
                                child: Container(
                              decoration: BoxDecoration(
                                  //  color: const Color(0xff6D60AF),
                                gradient: const LinearGradient(
                                  colors: [
                                    Color(0xff6D60AF),
                                    Color.fromARGB(255, 180, 166, 241),
                                
                                  ],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ),
                                borderRadius: BorderRadius.circular(14),
                              ),
                              child: ElevatedButton(
                                onPressed: () async{
                                  
                                  try {
                                    UserCredential userCredential =
                                        await _firebaseAuth
                                            .signInWithEmailAndPassword(
                                      email: _emailTextEditingController.text
                                          .trim(),
                                      password: _passwordTextEditingController
                                          .text
                                          .trim(),
                                    );
                                     Navigator.of(context).push( 
                                MaterialPageRoute(builder:(context) {
                                  return LandingScreen(email: userCredential.user!.email);
                                },)
                              );
                                    print(
                                        "Signed in successfully: ${userCredential.user?.email}");
                                  } on FirebaseAuthException catch (e) {
                                    print("Error: $e");
                                  }

                                  // sign-in button action
                                  // Navigator.of(context).pushAndRemoveUntil(
                                  //   MaterialPageRoute(builder: (context) {
                                  //     return const HomeScreen();
                                  //   }),
                                  //   (route) {
                                  //     return false;
                                  //   },
                                  // );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  fixedSize: const Size(340, 50),
                                  shadowColor: Colors
                                      .transparent, // Remove default shadow color
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                  elevation: 8,
                                ),
                                child: Text(
                                  "Login",
                                  style: GoogleFonts.lato(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            )),
                          ),
                          ////////
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push( 
                                MaterialPageRoute(builder:(context) {
                                  return const SignupScreen(

                                  );
                                },)
                              );
                          
                            },
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Text.rich(TextSpan( 
                                  children: [ 
                                    TextSpan(
                                      text: "Dont't have an account ?",
                                      style: GoogleFonts.lato(
                                        fontSize: 16, 
                                      )
                                    ),
                                     TextSpan(
                                      text: " Sign up",
                                      style: GoogleFonts.lato(
                                        fontSize: 16, 
                                        fontWeight: FontWeight.bold,
                                        // decoration: TextDecoration.underline,
                                         color: const Color(0xff6D60AF)
                                      )
                                    )
                                  ]
                                )),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 40),
                            child: Row(
                              children: [
                                const Expanded(
                                  child: Divider(
                                    color: Colors.grey,
                                    thickness: 1,
                                  ),
                                ),
                                Text(
                                  " OR CONNECT WITH ",
                                  style: GoogleFonts.lato(
                                    color: Colors.grey,
                                    fontSize: 14, // Small label font size
                                  ),
                                ),
                                const Expanded(
                                  child: Divider(
                                    color: Colors.grey,
                                    thickness: 1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          Center(
                            child: Column(
                              children: [
                                Container(
                                  width: 300,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.25),
                                        offset: const Offset(0, 4),
                                        blurRadius: 8,
                                      ),
                                    ],
                                  ),
                                  child: SignInButton(
                                    Buttons.Google,
                                    onPressed: () {},
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Container(
                                  width: 300,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.25),
                                        offset: const Offset(0, 4),
                                        blurRadius: 8,
                                      ),
                                    ],
                                  ),
                                  child: SignInButton(
                                    Buttons.FacebookNew,
                                    onPressed: () {},
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
