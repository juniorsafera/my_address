class AddressModel {
  String? id;
  String? postalCode;
  String? neighborhood;
  String? streetName;
  String? complement;
  String? number;
  String? state;
  String? city;
  AddressModel({
    this.id,
    this.postalCode,
    this.neighborhood,
    this.streetName,
    this.complement,
    this.number,
    this.state,
    this.city,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
        id: json["id"],
        postalCode: json["postalCode"],
        neighborhood: json["neighborhood"],
        streetName: json["streetName"],
        complement: json["complement"],
        number: json["number"],
        state: json["state"],
        city: json["city"],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'postalCode': postalCode,
        'neighborhood': neighborhood,
        'streetName': streetName,
        'complement': complement,
        'number': number,
        'state': state,
        'city': city,
      };

  bool filter(String filter) {
    filter = filter.toLowerCase();
    return (postalCode ?? '').toLowerCase().contains(filter) ||
        (neighborhood ?? '').toLowerCase().contains(filter) ||
        (streetName ?? '').toLowerCase().contains(filter) ||
        (state ?? '').toLowerCase().contains(filter) ||
        (city ?? '').toLowerCase().contains(filter);
  }
}
