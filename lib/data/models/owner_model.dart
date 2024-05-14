class Owner {
  int? id;
  late String name;
  late String cpf;
  late String birthday;
  late int? addressId;
  late String? email;
  late String telephone;

  Owner(
      {this.id,
      required this.name,
      required this.cpf,
      required this.birthday,
      this.addressId,
      this.email,
      required this.telephone});

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      "name": name,
      "cpf": cpf,
      "birthday": birthday,
      "address_id": addressId,
      "email": email ?? "",
      "telephone": telephone
    };
  }

  Owner.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    name = json['name'] ?? '';
    cpf = json['cpf'] ?? '';
    birthday = json['birthday'] ?? '';
    addressId = json['address_id'] ?? 0;
    email = json['email'] ?? '';
    telephone = json['telephone'] ?? '';
  }
}
