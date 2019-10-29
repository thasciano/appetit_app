import 'package:flutter/material.dart';

///
/// Created by Thasciano Carvalho on 29/10/2019.
/// thasciano@gmail.com
///
/// Classe auxiliar para navegação entre telas. Com essa centralização é possivel
/// manipular e centralizar as auterações.
///
push(BuildContext context, Widget page) {
  return Navigator.push(context, MaterialPageRoute(builder: (context){
    return page;
  }));
}

pushReplacement(BuildContext context, Widget page) {
  return Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
    return page;
  }));
}

pop<T extends Object>(context, [ T result ]) {
  Navigator.pop(context, result);
}