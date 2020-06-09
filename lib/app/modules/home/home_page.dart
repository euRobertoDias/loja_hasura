import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'home_module.dart';
import 'home_controller.dart';
import 'widgets/card_produto/card_produto_widget.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  HomeController homeController = HomeModule.to.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Observer(
        builder: (BuildContext context) {
          return ListView.builder(
            itemCount: homeController.listaProdutos.length,
            itemBuilder: (BuildContext context, int index) {
              return CardProdutoWidget(
                nomeProduto: homeController.listaProdutos[index].nome,
                valor: homeController.listaProdutos[index].valor.toString(),
                categoriaProduto: homeController.listaProdutos[index].categoriaProduto.descricao,
                tipoProduto: homeController.listaProdutos[index].tipoProduto.descricao,
              );
            }
          );
        }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Modular.to.pushNamed('/AddProduto');
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }
}
