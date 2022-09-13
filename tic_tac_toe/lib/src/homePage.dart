import 'package:flutter/material.dart';
import 'package:tic_tac_toe/src/data.dart';

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
        Text(
          '$player turn',
          style: const TextStyle(fontSize: 60),
        ),
        rows(0),
        rows(1),
        rows(2),
        // 0.0 0.1 0.2
        // 1.0 1.1 1.2
        // 2.0 2.1 2.2
        // ElevatedButton(
        //     onPressed: () {
        //       restart();
        //     },
        //     child: Text('restart'))
      ],
    );
  }

  Widget box(int i, int j) {
    return GestureDetector(
      onTap: () {
        click(i, j);
        win(i, j);
        print('jugadorX $player');
        print('jugadorO $player');
      },
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(10),
        width: 110,
        height: 110,
        alignment: Alignment.center,
        color: Colors.amber,
        child: Text(
          matrix[i][j],
          style: TextStyle(fontSize: 90),
        ),
      ),
    );
  }

  Widget rows(int i) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [box(i, 0), box(i, 1), box(i, 2)],
    );
  }

  Future alert(BuildContext context, String res) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(res),
            content: const Text('Restart?'),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context, 'Cancel'),
                  child: const Text('Cancel')),
              TextButton(
                  onPressed: () {
                    restart();
                    Navigator.pop(context);
                  },
                  child: const Text('Ok')),
            ],
          );
        });
  }

  void win(int x, int y) {
    var col = 0, row = 0, diag = 0, rdiag = 0;
    var n = 3;
    var playerAux = matrix[x][y];
    for (int i = 0; i < n ; i++) {
      if (matrix[x][i] == playerAux) col++;
      if (matrix[i][y] == playerAux) row++;
      if (matrix[i][i] == playerAux) diag++;
      if (matrix[i][n - i - 1] == playerAux) rdiag++;
    }
    if (col == n || row == n || diag == n || rdiag == n) alert(context, '$playerAux win');
      // print('$playerAux win');
    // if (playerX.length == 5 || playerO.length == 5) {
    //   print('gano');
    //   alert(context);
    // }
    // if (playerX.length == 5 || playerO.length == 5) alert(context, 'TIE');
  }

  void click(int i, int j) {
    setState(() {
      matrix[i][j] = player;
      player == 'X' ? player = 'O' : player = 'X';
    });

    // sw ? playerX += '$i' : playerO += '$i';
    // sw = !sw;
    // if(sw){
    //   playerX += '$i';
    //   sw = false;
    // }
    // else{
    //   playerO += '$i';
    //   sw = true;
    // }
  }

  void count() {
    List auxX = [], auxO = [];
    auxX.addAll(playerX.split(''));
    auxO.addAll(playerO.split(''));
    auxX.sort();
    auxO.sort();
    playerX = '';
    playerO = '';
    playerX = auxX.join();
    playerO = auxO.join();

    winner.contains(auxX);
  }

  void restart() {
    setState(() {
      player = 'X';
      matrix = [
        ['', '', ''],
        ['', '', ''],
        ['', '', '']
      ];
    });
    print(matrix);
    print(player);

    // playerX = '';
    // playerO = '';
    // sw = true;
  }
}
