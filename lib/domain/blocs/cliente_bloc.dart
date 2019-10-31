

import 'dart:async';
import 'dart:convert';

import 'package:appetit_app/domain/models/cliente.dart';
import 'package:flutter/material.dart';

class ClienteBloc {
  final _streamController = StreamController<List<Cliente>>();
  Stream<List<Cliente>> get getClientes => _streamController.stream;

  List<Cliente> _listClientes;

  void fetch(BuildContext context){
      DefaultAssetBundle.of(context)
          .loadString('assets/json/clientes.json')
          .then((clientesString) {
        final data = json.decode(clientesString);
        _listClientes = data.map<Cliente>((json) => Cliente.fromJson(json))
            .toList();
        _streamController.add(_listClientes);
      });
  }

  void selecionarCliente(int index){
    _listClientes[index].selecionado = !_listClientes[index].selecionado;
    _streamController.add(_listClientes);
  }

  void dispose(){
    _streamController.close();
  }

}