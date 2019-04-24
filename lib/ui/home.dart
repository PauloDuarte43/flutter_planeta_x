import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int radioValue = 1;
  String _nomePlaneta = "";
  final TextEditingController _controllerPeso = new TextEditingController();

  bool selecaoValorA = true;
  bool selecaoValorB = false;
  bool selecaoValorC;
  bool switchValor = false;

  double _resultadoFinal = 0.0;

  void alteraValorRadio(int value) {
    setState(() {
      radioValue = value;
      switch (radioValue) {
        case 0:
          _resultadoFinal = calcularPesoEmPlatena(_controllerPeso.text, 0.06);
          _nomePlaneta =
              "O seu peso em Plutão é ${_resultadoFinal.toStringAsFixed(2)}";
          break;
        case 1:
          _resultadoFinal = calcularPesoEmPlatena(_controllerPeso.text, 0.38);
          _nomePlaneta =
              "O seu peso em Marte é ${_resultadoFinal.toStringAsFixed(2)}";
          break;
        case 2:
          _resultadoFinal = calcularPesoEmPlatena(_controllerPeso.text, 0.91);
          _nomePlaneta =
              "O seu peso em Vênus é ${_resultadoFinal.toStringAsFixed(2)}";
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Planeta X"),
        backgroundColor: Colors.black38,
      ),
      backgroundColor: Colors.blueGrey,
      body: Container(
        alignment: Alignment.topCenter,
        child: ListView(
          padding: const EdgeInsets.all(1.5),
          children: <Widget>[
            Image.asset(
              "assets/planet.png",
              width: 200.0,
              height: 133.0,
            ),
            Container(
              margin: const EdgeInsets.all(3.0),
              alignment: Alignment.center,
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: _controllerPeso,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: "O seu peso na Terra",
                        hintText: "Kg",
                        icon: Icon(Icons.person_outline)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Radio<int>(
                          activeColor: Colors.brown,
                          value: 0,
                          groupValue: radioValue,
                          onChanged: alteraValorRadio),
                      Text(
                        "Plutão",
                        style: TextStyle(color: Colors.white30),
                      ),
                      Radio<int>(
                          activeColor: Colors.brown,
                          value: 1,
                          groupValue: radioValue,
                          onChanged: alteraValorRadio),
                      Text(
                        "Marte",
                        style: TextStyle(color: Colors.white30),
                      ),
                      Radio<int>(
                          activeColor: Colors.brown,
                          value: 2,
                          groupValue: radioValue,
                          onChanged: alteraValorRadio),
                      Text(
                        "Vênus",
                        style: TextStyle(color: Colors.white30),
                      ),
                    ],
                  ),
                  Container(
                    child: Text(
                      _controllerPeso.text.isEmpty
                          ? "Informe o peso"
                          : "$_nomePlaneta",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 19.5,
                          fontWeight: FontWeight.w700),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  double calcularPesoEmPlatena(String peso, double gravidade) {
    if (int.parse(peso).toString().isNotEmpty && int.parse(peso) > 0) {
      return int.parse(peso) * gravidade;
    } else {
      print("Erro");
      return int.parse("180") * 0.38;
    }
  }
}
