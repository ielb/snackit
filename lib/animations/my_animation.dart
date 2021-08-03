import 'package:flutter/material.dart';

class MyAnimation extends StatelessWidget {
  MyAnimation(this.child);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
            child: child,
            duration:  Duration(milliseconds: 2000),
            tween: Tween<double>(begin: 0,end: 1),
            builder: (BuildContext context,  value, Widget? child) {
              return Opacity(
                opacity: value,
                child: Padding(padding: EdgeInsets.all(value*8),child: child,),
              );
            },
        );
  }
}