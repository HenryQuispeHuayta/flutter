import 'package:flutter/material.dart';
import 'package:tic_tac_toe/src/data.dart';

Widget box(int i){
  return GestureDetector(
    onTap: () {
      click(i);
      print('jugadorX $playerX');
      print('jugadorO $playerO');
    },
    child: Container(
      color: Colors.amber,
      
      child: Text('$i', style: TextStyle(fontSize: 80),),
    ),
  );
}

Widget rows(int i, int j, int k){
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      box(i),
      box(j),
      box(k)
    ],
  );
}

click(int i){
  if(sw){
    playerX += '$i';
    sw = false;
  }
  else{
    playerO += '$i';
    sw = true;
  }
}
restar(){
  playerX = '';
  playerO = '';
  sw = true;
}