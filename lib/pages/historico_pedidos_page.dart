import 'package:appetit_app/utils/constants.dart';
import 'package:appetit_app/utils/nav.dart';
import 'package:appetit_app/widgets/card_pedido.dart';
import 'package:flutter/material.dart';

import 'novo_pedido_page.dart';

///
/// Created by Thasciano Carvalho on 29/10/2019.
/// thasciano@gmail.com
///
class HistoricoPedidosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _body(context)),
    );
  }

  Widget _body(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16.0),
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top:56, bottom: 8),
              child: Text("Olá, Alessandra!",
                  style: TextStyle(fontSize: 24, color: Constants.primary_color)),
            ),
            Container(
              width: 240.0,
              height: 2.0,
              color: Constants.verde,),

            GestureDetector(
                onTap: (){
                  push(context, NovoPedidoPage(), false);
                },
                child: Card(
                  margin: EdgeInsets.symmetric(vertical: 24),
                  elevation: 4.0,
                  color: Colors.white,
                  child: ListTile(
                    leading: Icon(Icons.add, size: 24, color: Constants.primary_color,),
                    title: Text("FAZER NOVO PEDIDO", style: TextStyle(fontWeight: FontWeight.w600),),
                  ),
                )
            ),

            TextFormField(
              decoration: InputDecoration(
                  labelText: 'Digite a sua busca aqui',
                  fillColor: Colors.orange,
                  prefixIcon: Icon(Icons.search, color: Constants.primary_color,),
                  suffixIcon: Image.asset("assets/images/ic_filter.png")
              ),
            ),

            Wrap(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: 16, top:24),
                  child: Text("23/10/2019, você já vendeu R\$ 45,90",
                      style: TextStyle(fontSize: 16, color: Constants.primary_text, fontWeight: FontWeight.w600)),
                ),
                ListView.builder(
                    itemCount: 4,
                    shrinkWrap: true,
                    padding: EdgeInsets.all(0.0),
                    physics: ClampingScrollPhysics(),
                    itemBuilder: (BuildContext context, int index){
                      return CardPedido(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTLUQVyLZIdVcExILlASAhOtlZOi29L6zU5-FeIYGjOO97CeOBL",
                          "Hanna Montana",
                          "1x Cuscuz com calabresa, 1x Cuscuz com calabresa, 1x Cuscuz com calabresa ",
                          125.16, false, false, null);
                    }),

                Container(
                  margin: EdgeInsets.only(bottom: 16, top:24),
                  child: Text("23/10/2019, você já vendeu R\$ 45,90",
                      style: TextStyle(fontSize: 16, color: Constants.primary_text, fontWeight: FontWeight.w600)),
                ),

                ListView.builder(
                    itemCount: 4,
                    shrinkWrap: true,
                    padding: EdgeInsets.all(0.0),
                    physics: ClampingScrollPhysics(),
                    itemBuilder: (BuildContext context, int index){
                      return CardPedido(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTLUQVyLZIdVcExILlASAhOtlZOi29L6zU5-FeIYGjOO97CeOBL",
                          "Hanna Montana",
                          "1x Cuscuz com calabresa, 1x Cuscuz com calabresa, 1x Cuscuz com calabresa ",
                          125.16, false, false, null);
                    }),
              ],
            ),
          ],
        ),
      ],
    );
  }

}
