import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class FadeAnimation extends StatelessWidget {
  final double delay;
  final Widget child;

  const FadeAnimation(this.delay, this.child, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final movieTween = MovieTween()
      ..tween(
        'opacity',
        Tween(begin: 0.0, end: 1.0),
        duration: const Duration(milliseconds: 500),
      )
      ..tween(
        'translateY',
        Tween(begin: -30.0, end: 0.0),
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeOut,
      );

    return CustomAnimationBuilder(

          control: Control.play,

          //control: CustomAnimationControl.play,
      delay: Duration(milliseconds: (delay * 500).round()),
      duration: movieTween.duration,
      tween: movieTween,
      builder: (context, animation, child) {
        return Opacity(
          opacity: animation.get('opacity'),
          child: Transform.translate(
            offset: Offset(0, animation.get('translateY')),
            child: child,
          ),
        );
      },
      child: child,
    );
  }
}
