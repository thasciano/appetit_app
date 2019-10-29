import 'package:appetit_app/utils/Constants.dart';
import 'package:flutter/material.dart';

///
/// Created by Thasciano Carvalho on 29/10/2019.
/// thasciano@gmail.com
///
class HistoricoPedidosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _body()),
    );
  }

  Widget _body() {
    return ListView(
      padding: EdgeInsets.all(16.0),
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top:56, bottom: 8),
          child: Text("Olá, Alessandra!",
              style: TextStyle(fontSize: 24, color: Constants.primary_color)),
        ),
        SizedBox(
          width: 240.0,
          height: 2,
          child: Container(color: Constants.verde,),
        ),

        GestureDetector(
          onTap: (){
//            push(context, NovoPedidoPage());
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
                  return _cardPedidos();
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
                  return _cardPedidos();
                }),
          ],
        ),
      ],
    );
  }

  Widget _cardPedidos() {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      height: 72,
      child: Card(
        color: Colors.white,
        child: ListTile(
          leading: Image.asset("assets/images/logo.png", width: 40, height: 40,),
          title: Row(
            children: <Widget>[
              Expanded(
                flex: 3,
                child: Text("Hanna Montana",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 16, color: Constants.primary_text, fontWeight: FontWeight.w600)),
              ),
              Expanded(
                flex: 2,
                child: Text("R\$ 125,16",
                    textAlign: TextAlign.end,
                    style: TextStyle(fontSize: 16, color: Constants.primary_text, fontWeight: FontWeight.w600)),
              )
            ],
          ),
          subtitle: Text("1x Cuscuz com calabresa, 1x Cuscuz com calabresa, 1x Cuscuz com calabresa ",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 16, color: Constants.secondary_text, )),
        ),
      ),
    );
  }


}
