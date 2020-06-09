// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_produto_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AddProdutoController on _AddProdutoControllerBase, Store {
  final _$valueAtom = Atom(name: '_AddProdutoControllerBase.value');

  @override
  int get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(int value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  final _$tipoProdutoAtom = Atom(name: '_AddProdutoControllerBase.tipoProduto');

  @override
  TipoCategoriaProdutoDto get tipoProduto {
    _$tipoProdutoAtom.reportRead();
    return super.tipoProduto;
  }

  @override
  set tipoProduto(TipoCategoriaProdutoDto value) {
    _$tipoProdutoAtom.reportWrite(value, super.tipoProduto, () {
      super.tipoProduto = value;
    });
  }

  final _$_AddProdutoControllerBaseActionController =
      ActionController(name: '_AddProdutoControllerBase');

  @override
  void increment() {
    final _$actionInfo = _$_AddProdutoControllerBaseActionController
        .startAction(name: '_AddProdutoControllerBase.increment');
    try {
      return super.increment();
    } finally {
      _$_AddProdutoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value},
tipoProduto: ${tipoProduto}
    ''';
  }
}
