import 'package:flutter_modular/flutter_modular.dart';
import 'package:hasura_connect/hasura_connect.dart';
import '../../app_module.dart';
import 'repositories/home_repository.dart';
import 'widgets/card_produto/card_produto_controller.dart';

import 'home_controller.dart';
import 'home_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        //Controlers
        Bind((i) => CardProdutoController()),
        Bind((i) => HomeController(i.get<HomeRepository>())),
        //Repositories      
        Bind((i) => HomeRepository(AppModule.to.get<HasuraConnect>())),
  ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => HomePage()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
