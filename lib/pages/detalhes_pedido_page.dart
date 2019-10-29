import 'package:appetit_app/utils/Constants.dart';
import 'package:appetit_app/utils/nav.dart';
import 'package:flutter/material.dart';

///
/// Created by Thasciano Carvalho on 29/10/2019.
/// thasciano@gmail.com
///
class DetalhesPedidoPage extends StatefulWidget {
  @override
  _DetalhesPedidoPageState createState() => _DetalhesPedidoPageState();
}

class _DetalhesPedidoPageState extends State<DetalhesPedidoPage> {
  String tag;

  List<String> _texts = [
    "Cuscuz de milho",
    "Cuscuz de arroz",
  ];
  int _currentIndex = 0;

  OutlineInputBorder bordasInputText = new OutlineInputBorder(
      borderRadius: new BorderRadius.circular(4.0),
      borderSide: new BorderSide(
          width: 1,
          color: Colors.white
      ));

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
      body: _body(),
    );
  }

  Widget _body() {
    return Stack(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(bottom: 68),
          child: ListView(
            padding: EdgeInsets.all(16.0),
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: 8),
                    child: Text("Detalhes do pedido",
                        style: TextStyle(fontSize: 24, color: Constants.primary_color)),
                  ),
                  Container(width: 240, height: 2,color: Constants.verde,),

                  Container(
                      margin: EdgeInsets.only(top:16),
                      child: Text("caso queira, aproveite para adicionar alguma observação para este pedido.", textAlign: TextAlign.start,
                          style: TextStyle(fontSize: 16, color: Constants.secondary_text))),

                  Container(
                    margin: EdgeInsets.only(bottom: 24, top: 24),
                    height: 72,
                    child: Card(
                      color: Colors.white,
                      child: ListTile(
                        onTap: (){
                          push(context, DetalhesPedidoPage());
                        },
                        leading: Image.asset("assets/images/logo.png", width: 40, height: 40,),
                        title: Text("Cuscuz Completo",
                            style: TextStyle(fontSize: 16, color: Constants.primary_text, fontWeight: FontWeight.w600)),
                        subtitle: Text("Milho ou arroz",
                            style: TextStyle(fontSize: 16, color: Constants.secondary_text, )),
                        trailing: Text("R\$ 2,25",
                            style: TextStyle(fontSize: 16, color: Constants.primary_text, fontWeight: FontWeight.w600 )),
                      ),
                    ),
                  ),

                  Divider(height: 1, color: Colors.black12,),

                  Container(
                    margin: EdgeInsets.only(top:24),
                    child: Text("Opções",
                        style: TextStyle(fontSize: 16, color: Constants.primary_text, fontWeight: FontWeight.w600)),
                  ),
                  Container(
                      child: Text("Escolha uma das opções de massas disponíveis abaixo.", textAlign: TextAlign.start,
                          style: TextStyle(fontSize: 16, color: Constants.secondary_text))
                  ),

                  Wrap(
                    children: <Widget>[
                      ListView.builder(
                          itemCount: _texts.length,
                          padding: EdgeInsets.all(0.0),
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                          itemBuilder: (BuildContext context, int index){
                            return Card(
                              color: Colors.white,
                              child: ListTile(
                                  title: RadioListTile(
                                    groupValue: _currentIndex,
                                    title: Text("${_texts[index]}"),
                                    value: index,
                                    onChanged: (val) {
                                      setState(() {
                                        _currentIndex = index;
                                      });
                                    },
                                    activeColor: Constants.primary_color,
                                  )
                              ),
                            );
                          }),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top:24),
                    child: Text("Observações",
                        style: TextStyle(fontSize: 16, color: Constants.primary_text, fontWeight: FontWeight.w600)),
                  ),
                  Container(
                    margin: EdgeInsets.only(top:32),
                    child: TextFormField(
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: 'Deseja adicionar alguma obs.?',
                        hintText: "Deseja adicionar alguma obs.?",
                        filled: true,
                        fillColor: Colors.white,
                        border: bordasInputText,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            height: 68,
            decoration: BoxDecoration(
                color: Colors.white,
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.add),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        child: Text("1", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),),
                      ),
                      Icon(Icons.add)
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: RaisedButton(
                    onPressed: (){
                      pop(context, 1);
                    },
                    shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(2.0)),
                    color: Constants.primary_color,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Adicionar",
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.white)),
                        Text("R\$ 3,25",
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.white)),
                      ],),
                  ),
                )
              ],
            ),
          ),
        )

      ],
    );
  }
}
