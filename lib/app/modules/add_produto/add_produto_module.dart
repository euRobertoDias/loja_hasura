import 'package:flutter_modular/flutter_modular.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'add_produto_controller.dart';
import 'add_produto_page.dart';

import '../../app_module.dart';
import './repositories/add_produto_repository.dart';

class AddProdutoModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AddProdutoController(i.get<AddProdutoRepository>())),
        
        //Repositories
        Bind((i) => AddProdutoRepository(AppModule.to.get<HasuraConnect>())),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => AddProdutoPage()),
      ];

  static Inject get to => Inject<AddProdutoModule>.of();
}
