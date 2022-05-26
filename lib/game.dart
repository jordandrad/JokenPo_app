import 'dart:math';

import 'package:flutter/material.dart';

class Game extends StatefulWidget {
  const Game({Key? key}) : super(key: key);

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  var _phrase1 = "Escolha uma oção abaixo";
  var _pedra = Image.asset(
    "images/pedra.png",
    height: 100,
  );
  var _papel = Image.asset("images/papel.png", height: 100);
  var _tesoura = Image.asset(
    "images/tesoura.png",
    height: 100,
  );
  var _escolha2 = AssetImage(
    "images/padrao.png",
  );
  var _placarApp = 0;
  var _placarUsuario = 0;

  void joga(String escolhaDoUsuario) {
    var random = Random().nextInt(3);
    var opcoes = ["pedra", "papel", "tesoura"];
    var escolhaApp = opcoes[random];

    switch (escolhaApp) {
      case "pedra":
        setState(() {
          this._escolha2 = AssetImage(
            "images/pedra.png",
          );
        });
        break;
      case "papel":
        setState(() {
          this._escolha2 = AssetImage(
            "images/papel.png",
          );
        });
        break;
      case "tesoura":
        setState(() {
          this._escolha2 = AssetImage(
            "images/tesoura.png",
          );
        });
        break;
    }
    if ((escolhaDoUsuario == "pedra" && escolhaApp == "tesoura") ||
        (escolhaDoUsuario == "tesoura" && escolhaApp == "papel") ||
        (escolhaDoUsuario == "papel" && escolhaApp == "pedra")) {
      setState(() {
        _phrase1 = "Você ganhou!";
      });
      _placarUsuario++;
    } else if ((escolhaApp == "pedra" && escolhaDoUsuario == "tesoura") ||
        (escolhaApp == "tesoura" && escolhaDoUsuario == "papel") ||
        (escolhaApp == "papel" && escolhaDoUsuario == "pedra")) {
      setState(() {
        _phrase1 = "O app ganhou!";
      });
      _placarApp++;
    } else {
      setState(() {
        _phrase1 = "Empate!";
      });
    }
  }

  void zerarPlacar() {
    setState(() {
      _placarApp = 0;
      _placarUsuario = 0;
      _phrase1 = "Escolha uma opção abaixo";
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JokenPo"),
        backgroundColor: Colors.orange.shade900,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 50, bottom: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("App",
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                Text(
                  "$_placarApp X $_placarUsuario",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Você",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              "Escolha do app:",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Image(
            image: this._escolha2,
            height: 100,
          ),
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              _phrase1,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () => joga("pedra"),
                child: _pedra,
              ),
              GestureDetector(
                onTap: () => joga("papel"),
                child: _papel,
              ),
              GestureDetector(
                onTap: () => joga("tesoura"),
                child: _tesoura,
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 100, bottom: 16),
            child: ElevatedButton(
              child: Text("Zerar placar"),
              onPressed: zerarPlacar,
              style: ElevatedButton.styleFrom(primary: Colors.orange.shade900),
            ),
          )
        ],
      ),
    );
  }
}
