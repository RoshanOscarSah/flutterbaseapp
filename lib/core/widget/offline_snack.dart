import 'package:flutter/material.dart';

import '../config/color.dart';

class OfflineSnack extends StatelessWidget {
  const OfflineSnack({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      width: double.infinity,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(5), color: kE100),
      child: const Text(
        "No Internet Connection",
        style: TextStyle(
          fontSize: 16,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
