import 'package:mobx/mobx.dart';
import 'repositories/add_produto_repository.dart';

import 'models/tipo_categoria_produto_dto.dart';

part 'add_produto_controller.g.dart';

class AddProdutoController = _AddProdutoControllerBase
    with _$AddProdutoController;

abstract class _AddProdutoControllerBase with Store {

  final AddProdutoRepository addProdutoRepository;

  _AddProdutoControllerBase(this.addProdutoRepository) {
    addProdutoRepository.getTipoCategoriaProduto().then((data){
      tipoProduto = data;
    });
  }

  @observable
  String descricao = '';

  @action
  setDescricao(String _desc) {
    descricao = _desc;
  }

  @observable
  String valor = '';

  @action
  setValor(String _valor) {
    valor = _valor;
  }

  @observable
  TipoECategoriaProdutoDto selectedCategoria;

  @action
  setSelectedCategoria(TipoECategoriaProdutoDto _selectedCategoria) {
    selectedCategoria = _selectedCategoria;
  }

  @observable
  TipoECategoriaProdutoDto selectedTipo;

  @action
  setSelectedTipo(TipoECategoriaProdutoDto _selectedTipo) {
    selectedTipo = _selectedTipo;
  }

  @observable
  TipoCategoriaProdutoDto tipoProduto;

  @action
  Future<bool> salvar() async {
    if(descricao != null &&
      valor != null &&
      selectedTipo?.id != null &&
      selectedCategoria?.id != null) {
      return await addProdutoRepository.addProduto(
        descricao, valor, selectedTipo.id, selectedCategoria.id
      );
    }
    return false;
  } 

}
