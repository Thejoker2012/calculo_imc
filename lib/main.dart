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
  TextEditingController pesoController =
      TextEditingController(); //Controladores
  TextEditingController alturaController =
      TextEditingController(); //Controladores

  GlobalKey<FormState> _formKey =
      GlobalKey<FormState>(); //instanciando uma chave global

  String _infoText = "Informe seus dados!";
  String _infoText1 = "Insira seu Peso!";
  String _infoText2 = "Insira sua Altura!";


  void _resetFields() {
    //Função para limpar os campos de texto
    pesoController.text = "";
    alturaController.text = "";
    setState(() {
      //Sempre utilizar o setState quando usar variáveis que se modificam dentro do app
      _infoText = "Informe seus dados!";
      _formKey = GlobalKey<FormState>();
    });
  }

  void _calcularImc() {
    //Função para calcular o imc

    setState(() {
      //Informa ao compilador que houve alguma mudanca no layout
      double peso = double.parse(pesoController.text);
      double altura = double.parse(alturaController.text) / 100;
      double imc = peso / (altura * altura);
      if (imc < 18.6) {
        _infoText = "Abaixo do peso (${imc.toStringAsPrecision(4)})";
      } else if (imc >= 18.6 && imc < 24.9) {
        _infoText = "Peso ideal (${imc.toStringAsPrecision(4)})";
      } else if (imc >= 24.9 && imc < 29.9) {
        _infoText = "Levemente Acima do Peso (${imc.toStringAsPrecision(4)})";
      } else if (imc >= 29.9 && imc < 34.9) {
        _infoText = "Obesidade Grau 1 (${imc.toStringAsPrecision(4)})";
      } else if (imc >= 34.9 && imc < 39.9) {
        _infoText = "Obesidade Grau 2 (${imc.toStringAsPrecision(4)})";
      } else if (imc > 40) {
        _infoText = "Obesidade Grau 3(${imc.toStringAsPrecision(4)})";
      }
    });
  }

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
                _resetFields, //funcão que vai ser chamada quando o botão for pressionado
          )
        ],
      ),
      backgroundColor: Colors.white, //Cor de fundo do App

      body: SingleChildScrollView(
        //Adicionando um Scroll
        padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        //Recuo sobre as laterais de toda a ScrowView
        child: Form(
            key: _formKey,
            child: Column(
          //Filho da ScrollView
          //Widget usado para agrupar outros widgets na vertical
          crossAxisAlignment: CrossAxisAlignment.stretch,
          //Alinhamento utilizado para que os componentes utilizaem toda a largura da tela

          children: <Widget>[
            Icon(Icons.person_outline, size: 120.0, color: Colors.indigoAccent),
            //Ícone já incluso no sistema

            TextFormField( //O TextFormField possui uma função chamada validator
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
              textAlign: TextAlign.center,
              //Alinhamento do texto central
              style: TextStyle(color: Colors.indigoAccent, fontSize: 25.0),
              //Cor e tamanho da fonte que será digitado na caixa de texto
              controller:
              pesoController, //Definindo os controladores que serão responsáveis capturar os valores
              validator: (value){ //sempre que digitar algo nos campos e for validar ele vai chamar esta função anonima passando o valor que foi digitado no layout
                if(value.isEmpty){
                  return _infoText1;
                }
              },
            ),

            TextFormField( //O TextFormField possui uma função chamada validator
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
              textAlign: TextAlign.center,
              //Alinhamento do texto central
              style: TextStyle(color: Colors.indigoAccent, fontSize: 25.0),
              //Cor e tamanho da fonte que será digitado na caixa de texto
              controller:
              alturaController, //Definindo os controladores que serão responsáveis capturar os valores
                validator: (value){ //sempre que digitar algo nos campos e for validar ele vai chamar esta função anonima passando o valor que foi digitado no layout
                  if(value.isEmpty){
                    return _infoText2;
                  }
                }
            ),
            Padding(
              //Alinhamento do botão
              padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
              //Tipo de alinhamento onde passamos os parametros
              child: Container(
                //Container que vai receber o RaisedButton
                height: 50.0, //Tamanho do container
                child: RaisedButton(
                  onPressed: (){
                    if(_formKey.currentState.validate()){
                      _calcularImc();
                    }
                  },
                  //Função que será chamada quando botão for clicado
                  child: Text(
                    //filho do RaisedButton
                    "Calcular", //Texto que será exibido no botão
                    style: TextStyle(
                        color: Colors.white, //Cor do texto do Botão
                        fontSize: 25.0), //Tamanho da fonte do texto do botão
                  ),
                  color: Colors.indigoAccent, //Cor do Texto do Botão
                ),
              ),
            ),
            Text(
              //Texto que será exibido como resultado
              _infoText,
              textAlign: TextAlign.center, //Alinhamento do texto
              style: TextStyle(
                  color: Colors.indigoAccent,
                  fontSize: 25.0), //Cor e tamanho do texto
            )
          ],
        )),
      ),
    );
  }
}
