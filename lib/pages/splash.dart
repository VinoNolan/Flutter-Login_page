import 'dart:async';
import 'package:flutter/material.dart';
import 'package:login_page_done/pages/trial_onboard.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Delay selama 2 detik, lalu navigasi ke halaman login
    Timer(const Duration(seconds: 4), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) =>
            const OnboardScreen(), // Ganti dengan halaman utama Anda
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Lapisan pertama: Gambar latar belakang
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('lib/images/background.png'),
                    fit: BoxFit.cover)),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'lib/images/logo.png',
                  height: 100,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
