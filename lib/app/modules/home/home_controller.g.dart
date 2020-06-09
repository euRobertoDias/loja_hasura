// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$listaProdutosAtom = Atom(name: '_HomeControllerBase.listaProdutos');

  @override
  List<ProdutoModel> get listaProdutos {
    _$listaProdutosAtom.reportRead();
    return super.listaProdutos;
  }

  @override
  set listaProdutos(List<ProdutoModel> value) {
    _$listaProdutosAtom.reportWrite(value, super.listaProdutos, () {
      super.listaProdutos = value;
    });
  }

  @override
  String toString() {
    return '''
listaProdutos: ${listaProdutos}
    ''';
  }
}
