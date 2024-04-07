import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NeuBox extends StatelessWidget {
  final Widget? child;

  const NeuBox({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).colorScheme.background,
        boxShadow: [
        //   darker shadow on bottom right
          BoxShadow(
            color: Colors.grey.shade500,
            blurRadius: 15,
            offset: Offset(4,4),
          ),
        //   lighter shadow on top left
          BoxShadow(
            color: Colors.white,
            blurRadius: 15,
            offset: Offset(-4,-4),
          ),

        ],
      ),
      padding: EdgeInsets.all(12),
      child: child,
    );
  }
}
