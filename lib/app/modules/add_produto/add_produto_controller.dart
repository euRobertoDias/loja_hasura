import 'package:mobx/mobx.dart';
import 'repositories/add_produto_repository.dart';

import 'models/tipo_categoria_produto_dto.dart';

part 'add_produto_controller.g.dart';

class AddProdutoController = _AddProdutoControllerBase
    with _$AddProdutoController;

abstract class _AddProdutoControllerBase with Store {

  final AddProdutoRepository addProdutoRepository;

  @observable
  int value = 0;

  _AddProdutoControllerBase(this.addProdutoRepository) {
    addProdutoRepository.getTipoCategoriaProduto().then((data){
      tipoProduto = data;
    });
  }

  @observable
  TipoCategoriaProdutoDto tipoProduto;

  @action
  void increment() {
    value++;
  }
}
