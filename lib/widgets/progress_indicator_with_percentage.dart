import 'package:flutter/material.dart';

class ProgressIndicatorWithPercentage extends StatelessWidget {
  final double progress;
  const ProgressIndicatorWithPercentage({super.key, required this.progress});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          bottom: 0,
          child: Container(
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: Colors.black,
                ),
              ),
            ),
            width: MediaQuery.of(context).size.width - 16,
            child: LinearProgressIndicator(
              minHeight: 30,
              color: Colors.white,
              value: progress,
            ),
          ),
        ),
        Text(
          '${(progress * 100).toStringAsFixed(0)}%',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}
