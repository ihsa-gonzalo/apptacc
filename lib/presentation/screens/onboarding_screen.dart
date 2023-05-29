import 'package:apptacc/config/onboarding_menu.dart';
import 'package:apptacc/config/theme.dart';
import 'package:apptacc/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final introKey = GlobalKey<IntroductionScreenState>();

  Future<void> onDone(context) async 
  {
    final SharedPreferences prefs =  await SharedPreferences.getInstance();
    await prefs.setBool("showHome", true);

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const HomeScreen()),
    );
     
     
  }


  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white,
      allowImplicitScrolling: true,
      autoScrollDuration: 3000,
      pages: OnBoardingMenu.onboardingmmenu,
      onDone: () => onDone(context),
      showSkipButton: true,
      skipSemantic: "Saltar",
      showBackButton: false,
      back: const Icon(Icons.arrow_back),
      skip: const Text('Saltar',
          style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black)),
      next: const Icon(Icons.arrow_forward),
      done: const Text('Listo!',
          style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black)),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: DotsDecorator(
        size: const Size(10.0, 10.0),
        color: AppTheme.naranja,
        activeSize: const Size(22.0, 10.0),
        activeShape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      dotsContainerDecorator: ShapeDecoration(
          color: AppTheme.light_naranja,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          )),
    );
  }
}
