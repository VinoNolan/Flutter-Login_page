import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_page_done/components/my_button.dart';
import 'package:login_page_done/components/my_textfield.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:lottie/lottie.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final emailController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  Future paswordReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text.trim());
      showSuccessMessage('Success', 'Cek Email Kamu');
    } on FirebaseAuthException catch (e) {
      showErrorMessage(e.code, 'Email Salah/Tidak Terdaftar');
    }
  }

// Tampil Peringatan Error
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

// Tampil Peringatan Success
  void showSuccessMessage(String message, String info) {
    Alert(
        context: context,
        type: AlertType.success,
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
        body: Center(
      child: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('lib/images/forgotbg.png'),
                fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // logo
            Lottie.asset('lib/lottie/forgot.zip', height: 250),
            const SizedBox(
              height: 70,
            ),
            // Tulisan text
            Text(
              'Masukan Email Kamu',
              style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 24,
                      fontWeight: FontWeight.bold)),
            ),

            const SizedBox(
              height: 25,
            ),
            // email Textfield
            MyTextField(
              controller: emailController,
              hintText: 'email',
              obscureText: false,
            ),
            const SizedBox(
              height: 25,
            ),
            MyButton(onTap: paswordReset, text: 'Reset Password')
          ],
        ),
      ),
    ));
  }
}
