import 'package:flutter/material.dart';
import 'package:tic_tac_toe/src/widgets.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        rows(0, 1, 2),
        rows(3, 4, 5),
        rows(6, 7, 8),
        ElevatedButton(onPressed: () {
          restar();
        }, child: Text('restart'))
      ],
    );
  }
}