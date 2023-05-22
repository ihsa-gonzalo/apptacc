import 'package:flutter/material.dart';

class CardContainer extends StatelessWidget {
  final Widget child;

  const CardContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32),
      child: Card(
        color: Colors.white,
        elevation: 3,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: this.child,
        ),

        // width: double.infinity,
        // padding: EdgeInsets.all(20),
        // decoration: _createCardShape(),
        // child: this.child,
      ),
    );
  }

  BoxDecoration _createCardShape() => BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: Colors.white,
              blurRadius: 15,
              offset: Offset(
                0,
                5,
              ),
            )
          ]);
}
