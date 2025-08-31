class Properties {
  String collectionId;
  String id;
  String productId;
  String title;
  String value;

  Properties(
    this.collectionId,
    this.id,
    this.productId,
    this.title,
    this.value,
  );

  factory Properties.fromMapJson(
    Map<String, dynamic> jsonObject,
  ) {
    return Properties(
      jsonObject['collectionId'],
      jsonObject['id'],
      jsonObject['product_id'],
      jsonObject['title'],
      jsonObject['value'],
    );
  }
}
