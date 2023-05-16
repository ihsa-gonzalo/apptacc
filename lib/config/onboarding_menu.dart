import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnBoardingMenu {
  static List<PageViewModel> onboardingmmenu = [
    PageViewModel(
        title: "Pagina 1",
        body: "Body 1",
        image: buildImage("logo.png"),
        decoration: pageDecoration),
    PageViewModel(
        title: "Pagina 2",
        body: "Body 2",
        image: buildFullscreenImage(),
        decoration: pageDecoration.copyWith(

            contentMargin: EdgeInsets.symmetric(horizontal: 16),
            fullScreen: true,
            bodyFlex: 2,
            imageFlex: 3,
            safeArea: 100)),  
  ];

  static var bodyStyle = const TextStyle(fontSize: 19.0);

  static Widget buildImage(String assetName, [double width = 350]) {
    return Image.asset('assets/images/$assetName', width: width);
  }

   static Widget buildFullscreenImage() {
    return Image.asset(
      'assets/images/fullscreen.png',
      fit: BoxFit.cover,
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
    );
  }

  static var pageDecoration = PageDecoration(
    titleTextStyle:
        const TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
    bodyTextStyle: bodyStyle,
    bodyPadding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
    imagePadding: EdgeInsets.zero,
  );
}
