import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_page_done/components/my_button.dart';
import 'package:login_page_done/components/my_textfield.dart';
import 'package:login_page_done/pages/forgot_password.dart';
import 'package:login_page_done/pages/home_page.dart';
import 'package:page_transition/page_transition.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  // text editing controller
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // sign user in method
  Future<void> signUserIn() async {
// show loading circle
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(color: Colors.grey),
        );
      },
    );

    // try sign in
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      User? user = userCredential.user;
      if (user != null) {
        // User Berhasil Login
        Navigator.of(context).pushReplacement(
            PageTransition(child: HomePage(), type: PageTransitionType.fade));
      }
    } on FirebaseAuthException catch (e) {
      // pop the loading circle
      Navigator.pop(context);

      // Show error message
      showErrorMessage(e.code, 'Email/Password salah');
    }
  }

  // show error message popup
  void showErrorMessage(String message, String info) {
    Alert(
        context: context,
        type: AlertType.error,
        title: message,
        desc: info,
        buttons: [
          DialogButton(
            onPressed: () => Navigator.pop(context),
            color: Colors.grey.shade200,
            child: const Text('OKE'),
          )
        ]).show();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('lib/images/background.png'),
                fit: BoxFit.cover)),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // logo
                Lottie.asset('lib/lottie/login.zip', height: 350),

                // Tulisan text
                Text(
                  'Login Sekarang',
                  style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                  textAlign: TextAlign.start,
                ),
                const SizedBox(
                  height: 50,
                ),
                // email Textfield
                MyTextField(
                  controller: emailController,
                  hintText: 'Email',
                  obscureText: false,
                ),

                const SizedBox(
                  height: 10,
                ),
                // Password Textfield
                MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),

                const SizedBox(
                  height: 10,
                ),

                // forgot password
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return const ForgotPasswordPage();
                            },
                          ));
                        },
                        child: Text(
                          'Lupa Password?',
                          style: GoogleFonts.roboto(
                              textStyle: TextStyle(color: Colors.grey[600])),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(
                  height: 35,
                ),
                // sign in button
                MyButton(
                  onTap: signUserIn,
                  text: 'Log In',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
