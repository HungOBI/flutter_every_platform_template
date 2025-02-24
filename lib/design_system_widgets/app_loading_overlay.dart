import 'package:flutter/material.dart';

class AppLoadingOverlay extends OverlayEntry {
  AppLoadingOverlay()
      : super(builder: (BuildContext bContext) {
          return Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.black.withOpacity(0.1),
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
}
