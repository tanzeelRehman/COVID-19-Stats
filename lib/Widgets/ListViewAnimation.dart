import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

AnimationConfiguration listViewAnimation(Widget child) {
  return AnimationConfiguration.staggeredList(
    position: 1,
    duration: const Duration(milliseconds: 375),
    child: SlideAnimation(
      horizontalOffset: 50.0,
      // verticalOffset: 50.0,
      child: FadeInAnimation(
        child: child,
      ),
    ),
  );
}
