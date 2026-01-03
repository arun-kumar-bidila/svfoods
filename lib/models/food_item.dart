class FoodItem {
  final String id;
  final String name;
  final String description;
  final int price;
  final String image;
  final String category;

  FoodItem(
      {required this.id,
      required this.name,
      required this.description,
      required this.price,
      required this.image,
      required this.category});

  factory FoodItem.fromJson(Map<String, dynamic> json) {
    return FoodItem(
        id: json["_id"]??"",
        name: json["name"]??"",
        description: json["description"]??"",
        price: json["price"]??0,
        image: json["image"]??"",
        category: json["category"]??"");
  }
}
