import 'package:appetit_app/pages/login_page.dart';
import 'package:appetit_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

///
/// Created by Thasciano Carvalho on 29/10/2019.
/// thasciano@gmail.com
///
void main(){
  /**
   * Configuração para evitar rotação de tela
   */
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);
  return runApp(new MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'APPTIT',
      theme: ThemeData(
        fontFamily: 'Open Sans',
        brightness: Brightness.light,
        primaryColor: Constants.primary_color,
        scaffoldBackgroundColor: Constants.background,
      ),
      home: LoginPage(),
    );
  }
}
