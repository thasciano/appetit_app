import 'package:appetit_app/utils/Constants.dart';
import 'package:appetit_app/utils/nav.dart';
import 'package:appetit_app/widgets/card_pedido.dart';
import 'package:flutter/material.dart';

///
/// Created by Thasciano Carvalho on 29/10/2019.
/// thasciano@gmail.com
///
class NovoPedidoPage extends StatefulWidget {
  @override
  _NovoPedidoPageState createState() => _NovoPedidoPageState();
}

class _NovoPedidoPageState extends State<NovoPedidoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.background,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Constants.primary_color,),
          onPressed: (){
            pop(context);
          },
        ),
      ),
      body: SafeArea( child: _body(),),
    );
  }

  Widget _body() {
    return ListView(
      padding: EdgeInsets.all(16.0),
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 8),
              child: Text("Informações para o pedido",
                  style: TextStyle(fontSize: 24, color: Constants.primary_color)),
            ),
            Container(width: 240,
              height: 2, color: Constants.verde,),

            Container(
                margin: EdgeInsets.only(top:24),
                child: Text("Preencha as informações abaixo para concluir o pedido.", textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 16, color: Constants.secondary_text))),

            Container(
              margin: EdgeInsets.only(bottom: 8, top:24),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 4,
                    child: Text("O que você está vendendo?",
                        style: TextStyle(fontSize: 16, color: Constants.primary_text, fontWeight: FontWeight.w600)),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text("1 de 3",
                        textAlign: TextAlign.right,
                        style: TextStyle(fontSize: 16, color: Constants.secondary_text)),
                  )
                ],
              ),
            ),

            LinearProgressIndicator(
              backgroundColor: Colors.black12,
              value: 0.33,
              valueColor: AlwaysStoppedAnimation<Color>(Constants.primary_color),
            ),

            TextFormField(
              decoration: InputDecoration(
                labelText: 'Digite a sua busca aqui',
                fillColor: Colors.orange,
                prefixIcon: Icon(Icons.search, color: Constants.primary_color,),
              ),
            ),

            Container(
              margin: EdgeInsets.only(bottom: 16, top:24),
              child: Text("Cuscuz",
                  style: TextStyle(fontSize: 16, color: Constants.primary_text, fontWeight: FontWeight.w600)),
            ),

            Wrap(
              children: <Widget>[
                ListView.builder(
                    itemCount: 2,
                    padding: EdgeInsets.all(0.0),
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemBuilder: (BuildContext context, int index){
                      return CardPedido(
                          "assets/images/logo.png",
                          "Cuscuz Completo",
                          "Milho ou arroz",
                          "R\$ 125,16", true, (){ /*push(context, DetalhesPedidoPage() )*/});
                    }),
              ],
            ),

            Divider(height: 1, color: Colors.black12,),
            Container(
              margin: EdgeInsets.only(bottom: 16, top:24),
              child: Text("Pães",
                  style: TextStyle(fontSize: 16, color: Constants.primary_text, fontWeight: FontWeight.w600)),
            ),

            Wrap(
              children: <Widget>[
                ListView.builder(
                    itemCount: 2,
                    padding: EdgeInsets.all(0.0),
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemBuilder: (BuildContext context, int index){
                      return CardPedido(
                          "assets/images/logo.png",
                          "Pão caseiro",
                          null,
                          "R\$ 125,16", true, (){ /*push(context, DetalhesPedidoPage() )*/});
                    }),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
