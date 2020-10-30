import 'package:flutter/material.dart';

class Initial extends StatelessWidget {
  const Initial({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/youtube.png',
            width: 60.0,
          ),
          const SizedBox(width: 10.0),
          const Text(
            'Search Youtube',
            style: TextStyle(
              fontSize: 20.0,
              //fontWeight: FontWeight.bold,
              color: Colors.blueGrey
            ),
          )
        ],
      ),
    );
  }
}