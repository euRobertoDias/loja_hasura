import 'dart:convert';

class TipoCategoriaProdutoDto {
    TipoCategoriaProdutoDto({
        this.tipoProduto,
        this.categoriaProduto,
    });

    final List<TipoECategoriaProdutoDto> tipoProduto;
    final List<TipoECategoriaProdutoDto> categoriaProduto;

    TipoCategoriaProdutoDto copyWith({
        List<TipoECategoriaProdutoDto> tipoProduto,
        List<TipoECategoriaProdutoDto> categoriaProduto,
    }) => 
        TipoCategoriaProdutoDto(
            tipoProduto: tipoProduto ?? this.tipoProduto,
            categoriaProduto: categoriaProduto ?? this.categoriaProduto,
        );

    factory TipoCategoriaProdutoDto.fromJson(String str) => TipoCategoriaProdutoDto.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory TipoCategoriaProdutoDto.fromMap(Map<String, dynamic> json) => TipoCategoriaProdutoDto(
        tipoProduto: List<TipoECategoriaProdutoDto>.from(json["tipo_produto"].map((x) => TipoECategoriaProdutoDto.fromMap(x))),
        categoriaProduto: List<TipoECategoriaProdutoDto>.from(json["categoria_produto"].map((x) => TipoECategoriaProdutoDto.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "tipo_produto": List<dynamic>.from(tipoProduto.map((x) => x.toMap())),
        "categoria_produto": List<dynamic>.from(categoriaProduto.map((x) => x.toMap())),
    };
    //Código não implementado pelo gerador de código.
    static List<TipoCategoriaProdutoDto> fromJsonList(List list) {
      if(list == null) return null;
      return list
        .map<TipoCategoriaProdutoDto>((item) => TipoCategoriaProdutoDto.fromMap(item))
        .toList();
    }
}

class TipoECategoriaProdutoDto {
    TipoECategoriaProdutoDto({
        this.id,
        this.descricao,
    });

    final String id;
    final String descricao;

    TipoECategoriaProdutoDto copyWith({
        String id,
        String descricao,
    }) => 
        TipoECategoriaProdutoDto(
            id: id ?? this.id,
            descricao: descricao ?? this.descricao,
        );

    factory TipoECategoriaProdutoDto.fromJson(String str) => TipoECategoriaProdutoDto.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory TipoECategoriaProdutoDto.fromMap(Map<String, dynamic> json) => TipoECategoriaProdutoDto(
        id: json["id"],
        descricao: json["descricao"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "descricao": descricao,
    };
}
