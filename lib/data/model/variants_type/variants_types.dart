class VariantsTypes {
  String id;
  String name;
  String title;
  VariantsTypeEnum type;

  VariantsTypes(
    this.id,
    this.name,
    this.title,
    this.type,
  );

  factory VariantsTypes.fromMapJson(
    Map<String, dynamic> jsonObject,
  ) {
    return VariantsTypes(
      jsonObject['id'],
      jsonObject['name'],
      jsonObject['title'],
      getVariantsTypeEnum(
        jsonObject['type'],
      ),
    );
  }
}

VariantsTypeEnum getVariantsTypeEnum(
  String type,
) {
  switch (type) {
    case 'Color':
      return VariantsTypeEnum.color;
    case 'Storage':
      return VariantsTypeEnum.storage;
    case 'Voltage':
      return VariantsTypeEnum.voltage;

    default:
      return VariantsTypeEnum.color;
  }
}

//یعنی یه نوع داده (data type) که بهت اجازه می‌ده یه لیست از مقادیر ثابت و محدود رو تعریف کنی.
//وقتی می‌خوای متغیری فقط یه مقدار از بین چند گزینه مشخص داشته باشه → از enum استفاده می‌کنی.

enum VariantsTypeEnum {
  color,
  storage,
  voltage,
}
