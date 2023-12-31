// To parse this JSON data, do
//
//     final partnerFromModal = partnerFromModalFromJson(jsonString);

import 'dart:convert';

PartnerFromModal partnerFromModalFromJson(String str) => PartnerFromModal.fromJson(json.decode(str));

String partnerFromModalToJson(PartnerFromModal data) => json.encode(data.toJson());

class PartnerFromModal {
  String status;
  List<DatumPartnerFrom> data;
  List<Product> products;

  PartnerFromModal({
    required this.status,
    required this.products,
    required this.data,
  });

  factory PartnerFromModal.fromJson(Map<String, dynamic> json) => PartnerFromModal(
    status: json["status"],
    data: List<DatumPartnerFrom>.from(json["data"].map((x) => DatumPartnerFrom.fromJson(x))),
    products: json["products"]==null?[]:List<Product>.from(json["products"].map((x) => Product.fromJson(x))),

  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "products": List<dynamic>.from(products.map((x) => x.toJson())),
  };
}

class DatumPartnerFrom {
  String form;
  String title;
  String content;
  List<Element> element;

  DatumPartnerFrom({
    required this.form,
    required this.title,
    required this.content,
    required this.element,
  });

  factory DatumPartnerFrom.fromJson(Map<String, dynamic> json) => DatumPartnerFrom(
    form: json["form"],
    title: json["title"],
    content: json["content"],
    element: List<Element>.from(json["element"].map((x) => Element.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "form": form,
    "title": title,
    "content": content,
    "element": List<dynamic>.from(element.map((x) => x.toJson())),
  };
}

class Element {
  String key;
  String label;
  String placeholder;
  String elementType;
  List<ListElement> list;

  Element({
    required this.key,
    required this.label,
    required this.placeholder,
    required this.elementType,
    required this.list,
  });

  factory Element.fromJson(Map<String, dynamic> json) => Element(
    key: json["key"],
    label: json["label"],
    placeholder:  json["placeholder"],
    elementType: json["element_type"],
    list: List<ListElement>.from(json["list"].map((x) => ListElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "key": key,
    "label": label,
    "placeholder": placeholder,
    "element_type": elementType,
    "list": List<dynamic>.from(list.map((x) => x.toJson())),
  };
}

class ListElement {

  String? key;
  String? value;

  ListElement({

    this.key,
    this.value,
  });

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(

    key: json["key"],
    value: json["value"],
  );

  Map<String, dynamic> toJson() => {

    "Key": key,
    "Value": value,
  };
}

enum Placeholder {
  ALL_TYPE,
  CHOOSE_FILE,
  DOWNLOAD_AGREEMENT,
  EMPTY,
  POST_GRADUATE,
  SELECT,
  SELECT_BANK_NAME,
  SELECT_CITY,
  SELECT_STATE,
  VIEW_AGREEMENT
}

final placeholderValues = EnumValues({
  "all type": Placeholder.ALL_TYPE,
  "Choose File": Placeholder.CHOOSE_FILE,
  "Download Agreement": Placeholder.DOWNLOAD_AGREEMENT,
  "": Placeholder.EMPTY,
  "Post Graduate": Placeholder.POST_GRADUATE,
  "SELECT": Placeholder.SELECT,
  "Select Bank Name": Placeholder.SELECT_BANK_NAME,
  "Select City": Placeholder.SELECT_CITY,
  "Select State": Placeholder.SELECT_STATE,
  "View Agreement": Placeholder.VIEW_AGREEMENT
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
class Product {
  String key;
  String name;
  String image;

  Product({
    required this.key,
    required this.name,
    required this.image,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    key: json["key"],
    name: json["name"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "key": key,
    "name": name,
    "image": image,
  };
}