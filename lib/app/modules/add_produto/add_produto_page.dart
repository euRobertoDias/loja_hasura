import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import 'add_produto_module.dart';
import 'add_produto_controller.dart';

import '../../shared/custom_combobox/custom_combobox_widget.dart';
import '../../shared/widgets/label/label_widget.dart';
import 'models/tipo_categoria_produto_dto.dart';

class AddProdutoPage extends StatefulWidget {
  final String title;
  const AddProdutoPage({Key key, this.title = "Adicionar produto"}) : super(key: key);

  @override
  _AddProdutoPageState createState() => _AddProdutoPageState();
}

class _AddProdutoPageState
    extends ModularState<AddProdutoPage, AddProdutoController> {
  //use 'controller' variable to access controller
  AddProdutoController controller = AddProdutoModule.to.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 500,
            right: -50,
            child: CircleAvatar(
              radius: 130,
              backgroundColor: Theme.of(context).primaryColor.withOpacity(.4),
            ),
          ),
          Positioned(
            top: 530,
            right: 50,
            child: CircleAvatar(
              radius: 130,
              backgroundColor: Theme.of(context).primaryColor.withOpacity(.3),
            ),
          ),
          Positioned(
            top: 550,
            right: 150,
            child: CircleAvatar(
              radius: 130,
              backgroundColor: Theme.of(context).primaryColor.withOpacity(.1),
            ),
          ),
          Container(height: MediaQuery.of(context).size.height,),
          SingleChildScrollView(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                LabelWidget(
                  title: 'Descrição:',
                ),
                TextField(
                  onChanged: controller.setDescricao,
                  style: TextStyle(color: Theme.of(context).primaryColor),
                  decoration: InputDecoration(
                    hintText: 'Descrição do produto',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).primaryColor, width: 2,
                      )
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).primaryColor, width: 2,
                      )
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).primaryColor, width: 2,
                      )
                    )
                  ),
                ),
                SizedBox(height: 20,),
                LabelWidget(
                  title: 'Valor:',
                ),
                TextField(
                  onChanged: controller.setValor,
                  keyboardType: TextInputType.number,
                  style: TextStyle(color: Theme.of(context).primaryColor),
                  decoration: InputDecoration(
                    hintText: 'Valor',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).primaryColor, width: 2,
                      )
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).primaryColor, width: 2,
                      )
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).primaryColor, width: 2,
                      )
                    )
                  ),
                ),
                SizedBox(height: 20,),
                LabelWidget(
                  title: 'Categoria do produto',
                ),
                Observer(
                  builder: (BuildContext context) {
                    if(controller.tipoProduto == null) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          border: Border.all(
                            width: 2,
                            color: Theme.of(context).primaryColor
                          )
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CircularProgressIndicator(),
                            ),
                          ],
                        ),
                      );
                    }
                    return CustomComboboxWidget(
                      items:controller.tipoProduto.categoriaProduto
                        .map((data)=>Model(data.id, data.descricao))
                        .toList(),
                      onChange: (tipo) => controller.setSelectedCategoria(
                        TipoECategoriaProdutoDto(
                          id: tipo.id, descricao: tipo.descricao
                        )
                      ),
                      itemSelecionado: null,
                    );
                  }
                ),
                LabelWidget(
                  title: 'Tipo do produto',
                ),
                Observer(
                  builder: (BuildContext context) {
                    if(controller.tipoProduto == null) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          border: Border.all(
                            width: 2,
                            color: Theme.of(context).primaryColor
                          )
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CircularProgressIndicator(),
                            ),
                          ],
                        ),
                      );
                    }
                    return CustomComboboxWidget(
                      items:controller.tipoProduto.tipoProduto
                        .map((data)=>Model(data.id, data.descricao))
                        .toList(),
                      onChange: (tipo) => controller.setSelectedTipo(
                        TipoECategoriaProdutoDto(
                          id: tipo.id, descricao: tipo.descricao
                        )
                      ),
                      itemSelecionado: null,
                    );
                  }
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: RaisedButton(
                    color: Theme.of(context).primaryColor,
                    onPressed: () async{
                      var result = await controller.salvar();

                      if(result) {
                        Navigator.of(context).pop();
                      } else {
                        showDialog(context: context,
                          child: AlertDialog(
                            content: Text('Erro ao tentar salvar o produto!'),
                            actions: <Widget>[
                              FlatButton(
                                child: Text('Fechar'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },

                              )
                            ],
                          )
                        ); 
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text('Salvar',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      )
    );
  }
}
