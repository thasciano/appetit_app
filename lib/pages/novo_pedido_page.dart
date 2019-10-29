import 'package:appetit_app/pages/detalhes_pedido_page.dart';
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
  int page = 1;
  double progressValue = 0.34;
  bool bottonOptionsPage = true;
  double marginBotton = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.background,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Constants.primary_color,),
          onPressed: (){
            if(page>1) {
              setState(() {
                progressValue -= 0.33;
                page -= 1;
              });
            }else
              pop(context);
          },
        ),
      ),
      body: SafeArea( child: _body(),),
      floatingActionButton: page==2 ? FloatingActionButton(
        onPressed: (){ },
        child: Icon(Icons.add),
        backgroundColor: Constants.primary_color,
      ): null,
    );
  }

  Widget _body() {
    return Stack(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(bottom: marginBotton),//56
          child: ListView(
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
                          style: TextStyle(fontSize: 16, color: Constants.secondary_text,))),

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
                          child: Text("${page} de 3",
                              textAlign: TextAlign.right,
                              style: TextStyle(fontSize: 16, color: Constants.secondary_text)),
                        )
                      ],
                    ),
                  ),

                  LinearProgressIndicator(
                    backgroundColor: Colors.black12,
                    value: progressValue,
                    valueColor: AlwaysStoppedAnimation<Color>(Constants.primary_color),
                  ),


                  if(page==1) _pageItensPedido(),



                ],
              ),
            ],
          ),
        ),

        Visibility(
          visible: bottonOptionsPage,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              height: 56,
              decoration: BoxDecoration(
                  color: Constants.primary_color,
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  boxShadow: [BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4.0,
                  )]
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Text("Total: R\$ 3,25", textAlign: TextAlign.start, style: TextStyle( color: Colors.white,fontWeight: FontWeight.w600, fontSize: 16),),
                  ),
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: (){
//                        pop(context, 1);
                        setState(() {
                          marginBotton = 0.0;
                          bottonOptionsPage = false;
                          progressValue += 0.33;
                          page += 1;
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text("Avançar",
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white)),
                          Icon(Icons.arrow_forward_ios, color: Colors.white,)
                        ],),
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _pageItensPedido() {
    return Column(
      children: <Widget>[

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
              textAlign: TextAlign.start,
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
                  return Hero(
                    tag: "hero-tag-${index}",
                    child: CardPedido(
                        "assets/images/logo.png",
                        "Cuscuz Completo",
                        "Milho ou arroz",
                        "R\$ 125,16", true, false, () async {
                      final resultData = push(context, DetalhesPedidoPage()) as Future<int>;

                      return push(context, DetalhesPedidoPage());
                    }),
                  );
                }),
          ],
        ),

        Divider(height: 1, color: Colors.black12,),

        Container(
          margin: EdgeInsets.only(bottom: 16, top:24),
          child: Text("Pães",
              textAlign: TextAlign.start,
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
                      "R\$ 125,16", true, false, (){ return push(context, DetalhesPedidoPage()); });
                }),
          ],
        ),
      ],
    );
  }


}
