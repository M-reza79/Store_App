class Products {
  String category;
  String collectionId;
  String collectionName;
  String description;
  int discount_price;
  String id;
  String name;
  String popularity;
  int price;
  int quantity;
  String thumbnail;
  Products(
    this.category,
    this.collectionId,
    this.collectionName,
    this.description,
    this.discount_price,
    this.id,
    this.name,
    this.popularity,
    this.price,
    this.quantity,
    this.thumbnail,
  );

  factory Products.fromMapJson(
    Map<String, dynamic> jsonObject,
  ) {
    return Products(
      jsonObject['category'],
      jsonObject['collectionId'],
      jsonObject['collectionName'],
      jsonObject['description'],
      jsonObject['discount_price'],
      jsonObject['id'],
      jsonObject['name'],
      jsonObject['popularity'],
      jsonObject['price'],
      jsonObject['quantity'],
      'https://startflutter.ir/api/files/${jsonObject['collectionId']}/${jsonObject['id']}/${jsonObject['thumbnail']}',
    );
  }
}
