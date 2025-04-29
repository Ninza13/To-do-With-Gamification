// ignore_for_file: library_private_types_in_public_api

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:to_do_app/app/router/router.gr.dart';
import 'package:to_do_app/common/strings.dart';
import 'package:to_do_app/ui/base/base_button.dart';

@RoutePage()
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                onLastPage = (index == 2);
              });
            },
            children: [
              // 1-ci səhifə
              OnboardingPage(
                animationPath: 'assets/animations/task_animation.json',
                title: AppStrings.onboardTitleOne,
                description: AppStrings.onboardDescOne,
              ),
              // 2-ci səhifə
              OnboardingPage(
                animationPath: 'assets/animations/level_up_animation.json',
                title: AppStrings.onboardTitleTwo,
                description: AppStrings.onboardDescTwo,
              ),
              // 3-cü səhifə
              OnboardingPage(
                animationPath: 'assets/animations/achievement_animation.json',
                title: AppStrings.onboardTitleThree,
                description: AppStrings.onboardDescThree,
              ),
            ],
          ),

          // indicator və buttonlar
          Positioned(
            bottom: 80,
            left: 0,
            right: 0,
            child: Center(
              child: SmoothPageIndicator(
                controller: _controller,
                count: 3,
                effect: WormEffect(
                  activeDotColor: Colors.orange,
                  dotHeight: 12,
                  dotWidth: 12,
                ),
              ),
            ),
          ),

          Positioned(
            bottom: 20,
            right: 20,
            child:
                onLastPage
                    ? BaseButton(
                      child: Text("Get Started"),
                      onPressed: () {
                        if (mounted) {
                          context.router.replace(MainWrapperRoute());
                        }
                      },
                    )
                    : BaseButton(
                      child: Text("Next"),
                      onPressed: () {
                        _controller.nextPage(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeIn,
                        );
                      },
                    ),
          ),
        ],
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final String animationPath;
  final String title;
  final String description;

  const OnboardingPage({
    super.key,
    required this.animationPath,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(animationPath, height: 250),
          SizedBox(height: 30),
          Text(
            title,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          Text(
            description,
            style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
