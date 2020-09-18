import 'package:flutter/material.dart';


class BuildingContainer extends StatelessWidget {
  final Widget child;

  BuildingContainer({@required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      height: 150,
      width: 300,
      child: child,
    );
  }
}