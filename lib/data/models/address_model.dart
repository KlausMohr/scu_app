class Address {
  int? id;
  late String cep;
  late String logradouro;
  late String? complemento;
  late String bairro;
  late String localidade;
  late String uf;
  late String? country;

  Address(
      {this.id,
      required this.cep,
      required this.logradouro,
      required this.complemento,
      required this.bairro,
      required this.localidade,
      required this.uf,
      required this.country});

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      "cep": cep,
      "logradouro": logradouro,
      "complemento": complemento ?? "",
      "bairro": bairro,
      "localidade": localidade,
      "uf": uf,
      "country": country ?? ""
    };
  }

  Address.fromJson(Map<String, dynamic> json) {
    id = json["id"] ?? 0;
    cep = json["cep"];
    logradouro = json["logradouro"];
    complemento = json["complemento"] ?? "";
    bairro = json["bairro"];
    localidade = json["localidade"];
    uf = json["uf"];
    country = json["country"] ?? "";
  }

  @override
  String toString() {
    return "cep = $cep, logradouro= $logradouro, complemento= $complemento,bairro= $bairro,localidade = $localidade, uf = $uf";
  }
}
