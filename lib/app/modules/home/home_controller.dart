import 'package:mobx/mobx.dart';

import 'models/produto_model.dart';
import 'repositories/home_repository.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final HomeRepository _homeRepository;
  
  _HomeControllerBase(this._homeRepository){
    _homeRepository.getProduto().then((data) => listaProdutos = data);
  }

  @observable
  List<ProdutoModel> listaProdutos = [];

}
