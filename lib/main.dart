import 'package:flutter/material.dart'; //Biblioteca que contém os widgets que iremos utilizar no app

void main() {
  //Função principal do App
  runApp(MaterialApp(
    //Widget tipo materialApp
    home: Home(), //Ao ser executado irá chamar a função Home
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //Barra que fica na parte de cima do aplicativo
        title: Text("Calculadora de IMC"), //Titulo que aparecerá na barra
        centerTitle: true, //Função para centralizar o titulo
        backgroundColor: Colors.indigoAccent, //Cor de fundo da barra
        actions: <Widget>[
          //Adicionado um botão na barra
          IconButton(
            icon: Icon(Icons.refresh), //Atribuindo o tipo de botão
            onPressed:
                () {}, //funcão que vai ser chamada quando o botão for pressionado
          )
        ],
      ),
      backgroundColor: Colors.white, //Cor de fundo do App

      body: Column(
        //Widget usado para agrupar outros widgets na vertical
        crossAxisAlignment: CrossAxisAlignment.stretch,
        //Alinhamento utilizado para que os componentes utilizaem toda a largura da tela

        children: <Widget>[
          Icon(Icons.person_outline, size: 120.0, color: Colors.indigoAccent),
          //Ícone já incluso no sistema

          TextField(
            keyboardType: TextInputType.number,
            //Cria um campo de texto que só aceitará numeros
            decoration: InputDecoration(
              //Usado para formatar o que aparecerá no campo de texto
              labelText: "Peso (Kg)",
              //Texto que aparecerá na tela acima do campo de texto
              labelStyle: TextStyle(
                color: Colors.indigoAccent,
              ),
            ),
            textAlign: TextAlign.center, //Alinhamento do texto central
            style: TextStyle(
                color: Colors.indigoAccent,
                fontSize:
                    25.0), //Cor e tamanho da fonte que será digitado na caixa de texto
          ),

          TextField(
            keyboardType: TextInputType.number,
            //Cria um campo de texto que só aceitará numeros
            decoration: InputDecoration(
              //Usado para formatar o que aparecerá no campo de texto
              labelText: "Altura (cm)",
              //Texto que aparecerá na tela acima do campo de texto
              labelStyle: TextStyle(
                color: Colors.indigoAccent,
              ),
            ),
            textAlign: TextAlign.center, //Alinhamento do texto central
            style: TextStyle(
                color: Colors.indigoAccent,
                fontSize:
                    25.0), //Cor e tamanho da fonte que será digitado na caixa de texto
          )
        ],
      ),
    );
  }
}
