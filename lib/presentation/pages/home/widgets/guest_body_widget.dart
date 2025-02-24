import 'package:flutter/material.dart';

class GuestBodyWidget extends StatefulWidget {
  const GuestBodyWidget({Key? key, required this.defaultData})
      : super(key: key);
  final String defaultData;

  @override
  GuestBodyWidgetState createState() => GuestBodyWidgetState();
}

class GuestBodyWidgetState extends State<GuestBodyWidget> {
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
