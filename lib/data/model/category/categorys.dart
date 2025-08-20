class Categorys {
  String collectionId;
  String id;
  String thumbnail;
  String title;
  String color;
  String icon;

  Categorys(
    this.collectionId,
    this.id,
    this.thumbnail,
    this.title,
    this.color,
    this.icon,
  );

  factory Categorys.fromMapJson(
    Map<String, dynamic> jsonObject,
  ) {
    return Categorys(
      jsonObject['collectionId'],
      jsonObject['id'],
      'https://startflutter.ir/api/files/${jsonObject['collectionId']}/${jsonObject['id']}/${jsonObject['thumbnail']}',
      jsonObject['title'],
      jsonObject['color'],
      'https://startflutter.ir/api/files/${jsonObject['collectionId']}/${jsonObject['id']}/${jsonObject['icon']}',
    );
  }
}
