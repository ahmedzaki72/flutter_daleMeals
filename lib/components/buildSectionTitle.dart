import 'package:flutter/material.dart';



class BuildSectionTitle extends StatelessWidget {
  final String text;

  BuildSectionTitle(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.title,
      ),
    );
  }
}
