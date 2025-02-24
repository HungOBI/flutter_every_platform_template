import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../app_loading_widget.dart';

class AppImageLoadingWidget extends StatelessWidget {
  final double? width;
  final double? height;

  const AppImageLoadingWidget({Key? key, this.width, this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: height ?? 54,
        width: width,
        child: const AppLoadingWidget(),
      ),
    );
  }
}
