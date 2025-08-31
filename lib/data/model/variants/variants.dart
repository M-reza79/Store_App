class Variant {
  String? id;
  String? name;
  int? pricechange;
  String? typeid;
  String? value;

  Variant(
    this.id,
    this.name,
    this.pricechange,
    this.typeid,
    this.value,
  );

  factory Variant.fromMapJson(
    Map<String, dynamic> jsonObject,
  ) {
    return Variant(
      jsonObject['id'],
      jsonObject['name'],
      jsonObject['price_change'],
      jsonObject['type_id'],
      jsonObject['value'],
    );
  }
}
