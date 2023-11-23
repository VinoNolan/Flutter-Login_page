import 'package:flutter/material.dart';
import 'package:login_page_done/pages/login_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:page_transition/page_transition.dart';
import 'package:lottie/lottie.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({super.key});

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  // controller to keep track of which page we're on
  PageController controlpage = PageController();
  // keep track of if we are on the last page
  bool onLastPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('lib/images/onboardbg.png'),
                fit: BoxFit.cover)),
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Stack(
          children: [
            PageView(
              controller: controlpage,
              onPageChanged: (index) {
                setState(() {
                  onLastPage = (index == 2);
                });
              },
              children: const [
                Screen1(),
                Screen2(),
                Screen3(),
              ],
            ),

            // dot indicators
            Container(
              alignment: const Alignment(0, .23),
              child: SmoothPageIndicator(
                controller: controlpage,
                count: 3,
                effect: ExpandingDotsEffect(
                    dotWidth: 14,
                    dotHeight: 9,
                    activeDotColor: const Color.fromRGBO(72, 219, 251, 1.0),
                    dotColor: Colors.grey.shade300),
              ),
            ),

            // Pengkondisian 2 Button untuk screen 1 sampai 3
            onLastPage
                ?
                // Kondisi 2 Button untuk Screen 3
                Container(
                    alignment: const Alignment(0, 0.85),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType.fade,
                                      child: const LoginPage()));
                            },
                            child: Container(
                              padding: const EdgeInsets.only(
                                  top: 8, bottom: 8, left: 30, right: 30),
                              decoration: BoxDecoration(
                                  color:
                                      const Color.fromRGBO(72, 219, 251, 1.0),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Text(
                                'Log In',
                                style: GoogleFonts.roboto(
                                    textStyle: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 20)),
                              ),
                            ))
                      ],
                    ))
                :
                // Kondisi 2 Button untuk Screen 1 dan 2
                Container(
                    alignment: const Alignment(0, 0.85),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                            onTap: () {
                              controlpage.jumpToPage(2);
                            },
                            child: Container(
                              padding: const EdgeInsets.only(
                                  top: 7, bottom: 7, left: 20, right: 20),
                              decoration: BoxDecoration(
                                  color:
                                      const Color.fromRGBO(72, 219, 251, 1.0),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Text(
                                'Skip',
                                style: GoogleFonts.roboto(
                                    textStyle: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 16)),
                              ),
                            )),
                        GestureDetector(
                            onTap: () {
                              controlpage.nextPage(
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeIn);
                            },
                            child: Container(
                              padding: const EdgeInsets.only(
                                  top: 7, bottom: 7, left: 20, right: 20),
                              decoration: BoxDecoration(
                                  color:
                                      const Color.fromRGBO(72, 219, 251, 1.0),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Text(
                                'Next',
                                style: GoogleFonts.roboto(
                                  textStyle: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 16),
                                ),
                              ),
                            )),
                      ],
                    )),
          ],
        ),
      ),
    ));
  }
}

// Halaman Screen Pertama
class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Lottie.asset('lib/lottie/screen1.zip'),
          const SizedBox(
            height: 100,
          ),
          Text(
            'Hallo',
            textAlign: TextAlign.center,
            style: GoogleFonts.roboto(
                textStyle: const TextStyle(
              color: Colors.black,
              fontSize: 24.0,
              fontWeight: FontWeight.w600,
            )),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Selamat datang di aplikasi Fatui Presence APP',
            textAlign: TextAlign.center,
            style: GoogleFonts.roboto(
                textStyle: const TextStyle(
              color: Colors.black26,
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
            )),
          ),
        ],
      ),
    );
  }
}

// Halaman Screen Kedua
class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Lottie.asset('lib/lottie/screen2.json'),
          const SizedBox(
            height: 100,
          ),
          Text(
            'Memangnya untuk apa?',
            textAlign: TextAlign.center,
            style: GoogleFonts.roboto(
                textStyle: const TextStyle(
              color: Colors.black,
              fontSize: 24.0,
              fontWeight: FontWeight.w600,
            )),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Untuk kamu yang suka kesulitan soal absensi dan hal manajemen lainnya',
            textAlign: TextAlign.center,
            style: GoogleFonts.roboto(
                textStyle: const TextStyle(
              color: Colors.black26,
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
            )),
          ),
        ],
      ),
    );
  }
}

// Halaman Screen Ketiga
class Screen3 extends StatelessWidget {
  const Screen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Lottie.asset('lib/lottie/screen3.json'),
          const SizedBox(
            height: 100,
          ),
          Text(
            'Sudah punya akun?',
            textAlign: TextAlign.center,
            style: GoogleFonts.roboto(
                textStyle: const TextStyle(
              color: Colors.black,
              fontSize: 24.0,
              fontWeight: FontWeight.w600,
            )),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Kalo sudah langsung Log in aja, kalau belum bisa register dulu ya',
            textAlign: TextAlign.center,
            style: GoogleFonts.roboto(
                textStyle: const TextStyle(
              color: Colors.black26,
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
            )),
          ),
        ],
      ),
    );
  }
}
