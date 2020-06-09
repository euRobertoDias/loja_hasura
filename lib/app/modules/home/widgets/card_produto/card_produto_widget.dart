import 'package:flutter/material.dart';

class CardProdutoWidget extends StatelessWidget {
  final String nomeProduto;
  final String categoriaProduto;
  final String tipoProduto;
  final String valor;

  const CardProdutoWidget({
    Key key, @required this.nomeProduto,
    @required this.categoriaProduto,
    @required this.tipoProduto,
    @required this.valor
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 50,
            right: -50,
            child: CircleAvatar(
              radius: 130,
              backgroundColor: Theme.of(context).primaryColor.withOpacity(.4),
            ),
          ),
          Positioned(
            top: 100,
            right: 50,
            child: CircleAvatar(
              radius: 130,
              backgroundColor: Theme.of(context).primaryColor.withOpacity(.3),
            ),
          ),
          Positioned(
            top: 120,
            right: 150,
            child: CircleAvatar(
              radius: 130,
              backgroundColor: Theme.of(context).primaryColor.withOpacity(.1),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(nomeProduto,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.w500
                  ),
                ),
                SizedBox(height: 10,),
                Text(categoriaProduto,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18
                  ),
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(tipoProduto,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Text('R\$ ${double.parse(valor).toStringAsFixed(2).replaceAll('.', ',')}',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30
                      ),
                    )
                  ],
                )
              ],
            )
          )
        ],
      ),
    );
  }
}
