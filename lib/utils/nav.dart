import 'package:flutter/material.dart';

///
/// Created by Thasciano Carvalho on 29/10/2019.
/// thasciano@gmail.com
///
/// Classe auxiliar para navegação entre telas. Com essa centralização é possivel
/// manipular e centralizar as alterações.
///
push(BuildContext context, Widget page, bool replacement) {

  PageRouteBuilder pageRouter = PageRouteBuilder(
    transitionDuration: Duration(milliseconds: 250),
    transitionsBuilder: (context, animation, secondaryAnimation, child)=>
        FadeTransition(opacity: animation, child: child,),
    pageBuilder: (_,__,___)=> page,
  );

  if(replacement)
    return Navigator.pushReplacement(context, pageRouter);

  return Navigator.push(context, pageRouter);
}

pop<T extends Object>(context, [ T result ]) {
  Navigator.pop(context, result);
}