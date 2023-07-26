import 'package:flutter/material.dart';

class ItemProgress extends StatelessWidget {
  const ItemProgress({
    super.key,
    required this.progressValue,
  });

  final double progressValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: 32.0,
      ),
      child: LinearProgressIndicator(
        value: progressValue,
      ),
    );
  }
}
