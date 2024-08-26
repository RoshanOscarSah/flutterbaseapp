import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../config/color.dart';

class LoadingHexa extends StatelessWidget {
  const LoadingHexa({
    super.key,
    this.sizeInt = 20.0,
    this.color = CusColor.kWhite,
  });

  final double sizeInt;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: LoadingAnimationWidget.hexagonDots(
      color: color,
      size: sizeInt,
    ));
  }
}

class LoadingProgressive extends StatelessWidget {
  const LoadingProgressive({
    super.key,
    this.sizeInt = 30.0,
    this.color = CusColor.kWhite,
  });

  final double sizeInt;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: LoadingAnimationWidget.prograssiveDots(
      color: color,
      size: sizeInt,
    ));
  }
}
