import 'package:appetit_app/utils/Constants.dart';
import 'package:flutter/material.dart';

///
/// Created by Thasciano Carvalho on 29/10/2019.
/// thasciano@gmail.com
///
class CardPedido extends StatelessWidget {

  String imagem;
  String titulo;
  String subTitulo;
  String valor;
  bool selecionado;
  Function onPress;
  bool hasTrailing;

  CardPedido(this.imagem, this.titulo, this.subTitulo, this.valor, this.hasTrailing, this.selecionado, this.onPress);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 8),
      color: selecionado ? Constants.primary_color : Colors.white,
      elevation: 1.0,
      child: ListTile(
        onTap: onPress,
        leading: Image.network(imagem, width: 40, height: 40,),
        title: _titulo(),
        subtitle: subTitulo != null? Text(subTitulo,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 16, color: Constants.secondary_text, )) : null,
            trailing: valor == null ? null : hasTrailing ? Text(valor,
            textAlign: TextAlign.end,
            style: TextStyle(fontSize: 16, color: Constants.primary_text, fontWeight: FontWeight.w600)) : null,
      ),
    );
  }

  Widget _titulo() {
    return hasTrailing ? Text(titulo,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontSize: 16, color: Constants.primary_text, fontWeight: FontWeight.w600)) :
      Row(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Text(titulo,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 16, color: Constants.primary_text, fontWeight: FontWeight.w600)),
          ),
          Expanded(
            flex: 2,
            child: Text(valor,
                textAlign: TextAlign.end,
                style: TextStyle(fontSize: 16, color: Constants.primary_text, fontWeight: FontWeight.w600)),
          )
        ],
      );
  }
}
