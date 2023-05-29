import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnBoardingMenu {
  static List<PageViewModel> onboardingmmenu = [
    PageViewModel(
        titleWidget: Text("Encontrá la mejor opción para salir", style: titleStyle, textAlign: TextAlign.center,),
        reverse: true,
        bodyWidget: Column(
          children: [

            Text("Todos los cafés, bares y resto en un solo lugar.", style: bodyStyle, textAlign: TextAlign.center),
          ],
        ),
        image: buildImage("cafe.jpg"),
        decoration: pageDecoration.copyWith(
            bodyFlex: 3,
            imageFlex: 4,
            bodyAlignment: Alignment.bottomCenter,
            imageAlignment: Alignment.topCenter,
          )),
   PageViewModel(
        titleWidget: Text("¿Querés comer en tu casa?", style: titleStyle, textAlign: TextAlign.center),
        reverse: true,
        bodyWidget: Text("Disfruta del delivery o takeway de todos los comercios.", style: bodyStyle, textAlign: TextAlign.center),
        image: buildImage("pizza.jpg"),
        decoration: pageDecoration.copyWith(
            bodyFlex: 2,
            imageFlex: 4,
            bodyAlignment: Alignment.bottomCenter,
            imageAlignment: Alignment.topCenter,
          )),
          PageViewModel(
        titleWidget: Container(margin: const EdgeInsets.only(top: 30),  child: Text("Valora y deja tu reseña", style: titleStyle, textAlign: TextAlign.center)),
        reverse: true,
        bodyWidget: Text("Colabora con la guía de comercios para ayudar a toda la comunidad celíaca.", style: bodyStyle, textAlign: TextAlign.center),
        image: buildImage("question.jpg"),
        decoration: pageDecoration.copyWith(
            bodyFlex: 2,
            imageFlex: 4,
            bodyAlignment: Alignment.bottomCenter,
            imageAlignment: Alignment.topCenter,
          )),
  ];


  static var bodyStyle = const TextStyle(fontSize: 19.0, color: Colors.black);
  static var titleStyle = const TextStyle(fontSize: 25.0, color: Colors.black, );

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

   static Widget buildFullscreenImageWithAsset(String assetName) {
    return Center(
      child: Image.asset(
        'assets/images/$assetName',
        fit: BoxFit.cover,
        height: double.infinity,
        width: double.infinity,
        alignment: Alignment.center,
      ),
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
