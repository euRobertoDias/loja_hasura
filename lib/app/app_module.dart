//import 'package:loja_hasura/app/shared/custom_combobox/custom_combobox_controller.dart';
//import 'shared/widgets/label/label_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hasura_connect/hasura_connect.dart';

import 'app_controller.dart';
import 'app_widget.dart';

import 'modules/add_produto/add_produto_module.dart';
import 'modules/home/home_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        //Bind((i) => CustomComboboxController()),
        //Bind((i) => LabelController()),
        Bind((i) => AppController()),
        //Outros
        Bind((i) => HasuraConnect('https://loja-rasura.herokuapp.com/v1/graphql')),
      ];

  @override
  List<Router> get routers => [
        Router('/', module: HomeModule()),
        Router('/AddProduto', module: AddProdutoModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
