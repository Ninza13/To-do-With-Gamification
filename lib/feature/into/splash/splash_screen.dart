import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:to_do_app/app/router/router.gr.dart';

@RoutePage(name: 'SplashRoute')
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      // if (mounted) {
      //   Navigator.of(context).pushReplacement(
      //     MaterialPageRoute(builder: (_) => OnboardingScreen()),
      //   );
      //   // context
      // }
      if (mounted) {
        context.router.replace(OnboardingRoute());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Lottie.asset('assets/animations/splash.json')),
    );
  }
}
