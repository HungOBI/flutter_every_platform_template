import 'package:flutter/material.dart';

class HomeBodyWidget extends StatefulWidget {
  const HomeBodyWidget({Key? key, required this.defaultData}) : super(key: key);
  final String defaultData;

  @override
  HomeBodyWidgetState createState() => HomeBodyWidgetState();
}

class HomeBodyWidgetState extends State<HomeBodyWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(widget.defaultData),
        ],
      ),
    );
  }
}
