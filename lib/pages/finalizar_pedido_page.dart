import 'package:appetit_app/pages/historico_pedidos_page.dart';
import 'package:appetit_app/pages/novo_pedido_page.dart';
import 'package:appetit_app/utils/Constants.dart';
import 'package:appetit_app/utils/nav.dart';
import 'package:appetit_app/widgets/orange_button.dart';
import 'package:flutter/material.dart';

class FinalizarPedidoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        margin: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset("assets/images/ic_pedido_finalizado.png", width: 230, height: 200,),
              Container(
                margin: EdgeInsets.only(top: 24),
                child: Text("Pedido realizado!",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 24, color: Constants.primary_text)),
              ),
              Container(
                margin: EdgeInsets.only(top:84),
                width: MediaQuery.of(context).size.width,
                child: OrangeButton('FAZER UM NOVO PEDIDO', 14.0, Constants.primary_color, (){
                  pushReplacement(context, NovoPedidoPage());
                }),
              ),
              Container(
                margin: EdgeInsets.only(top:16),
                width: MediaQuery.of(context).size.width,
                child: OrangeButton('VOLTAR PARA PÁGINA INICIAL', 14.0, Constants.verde, (){
                  pushReplacement(context, HistoricoPedidosPage());
                }),
              ),
            ],
          )),

    );
  }
}
