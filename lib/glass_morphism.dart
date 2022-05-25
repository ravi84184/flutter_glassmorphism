import 'dart:ui';

import 'package:flutter/material.dart';

class GlassMorphism extends StatelessWidget {
  final double blur;
  final double opacity;
  final double borderRadius;
  final Widget child;

  const GlassMorphism(
      {Key? key,
      required this.blur,
      required this.opacity,
      required this.borderRadius,
      required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(opacity),
            borderRadius: BorderRadius.circular(borderRadius),
            boxShadow: [
              BoxShadow(
                  color: Colors.white.withOpacity(0.2),
                  blurRadius: 25,
                  spreadRadius: -5)
            ],
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomCenter,
              colors: [
                Colors.white60,
                Colors.white10,
              ],
            ),
            border: Border.all(
              width: 0.5,
              color: Colors.black26,
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}
