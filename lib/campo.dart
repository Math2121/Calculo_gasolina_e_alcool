import 'package:flutter/material.dart';

class CampoTexto extends StatefulWidget {
  @override
  _CampoTextoState createState() => _CampoTextoState();
}

class _CampoTextoState extends State<CampoTexto> {
  TextEditingController _controllerAlcool = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();
  String _resultado = "";

  void _calcular(){
    double precoAlcool = double.tryParse(_controllerAlcool.text);
      double precoGasolina = double.tryParse(_controllerGasolina.text);
    if(precoAlcool == null || precoGasolina == null){
     
      setState(() {
        _resultado = "Valor do número inválido, digite um número maior que 0 utilizando (.)";
      });
      
    }else{
      
      if((precoAlcool/precoGasolina) >= 0.7){
        setState(() {
        _resultado = "Melhor abastecer com gasolina";
      });
      
      }else{
            setState(() {
        _resultado = "Melhor abastecer com álcool";
      });

      }
      _limparCampos();
    }
  
  }

  void _limparCampos(){
    _controllerAlcool.text = "";
    _controllerGasolina.text = "";
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Álcool ou Gasolina",
          style: TextStyle(fontSize: 15)
          )

      ),
      body: Container(
        padding: EdgeInsets.all(25),
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom:20),
           child: Image.asset('images/logo.png'),
          ),
          Padding(
            padding: EdgeInsets.only(top:10),
            child:Text("Saiba qula a melhor opção para abastecimento do seu carro",
            textAlign:TextAlign.center,
            style:TextStyle(fontWeight: FontWeight.bold,fontSize:20 )
            )
            

          ),
          Padding(
            padding: EdgeInsets.only(bottom:20),
            child:TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Preço do Álcool"
              ),
              controller: _controllerAlcool
            ) ,

          ),

           Padding(
            padding: EdgeInsets.only(bottom:10),
            child:TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Preço da Gasolina"
              ),
              controller: _controllerGasolina
            ) ,
            
          ),

           Padding(
            padding: EdgeInsets.only(top:15),
            child:RaisedButton(
              child:Text('Calcular', style:TextStyle(fontSize: 25),),
              color: Colors.blue,
              textColor:Colors.white,
             
              onPressed: _calcular,
            )

          ),

          Padding(padding: EdgeInsets.only(top:20), child: Text(_resultado),)
         
          
        ],
        ),
        ),
      )
    );
  }
}
