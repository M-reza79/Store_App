class Banners {
  String categoryId;
  String collectionId;
  String id;
  String thumbnail;
  Banners(
    this.categoryId,
    this.collectionId,
    this.id,
    this.thumbnail,
  );
  factory Banners.fromMapJson(
    Map<String, dynamic> jsonObject,
  ) {
    return Banners(
      jsonObject['categoryId'],
      jsonObject['collectionId'],
      jsonObject['id'],
      'https://startflutter.ir/api/files/${jsonObject['collectionId']}/${jsonObject['id']}/${jsonObject['thumbnail']}',
    );
  }
}
