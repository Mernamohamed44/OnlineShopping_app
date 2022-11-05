class CategoriesModel {
  CategoriesModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  final int id;
  final String title;
  var price;
  final String description;
  final String category;
  final String image;
  final Rating? rating;

  CategoriesModel copyWith({
    int? id,
    String? title,
    double? price,
    String? description,
    String? category,
    String? image,
    Rating? rating,
  }) {
    return CategoriesModel(
      id: id ?? this.id,
      title: title ?? this.title,
      price: price ?? this.price,
      description: description ?? this.description,
      category: category ?? this.category,
      image: image ?? this.image,
      rating: rating ?? this.rating,
    );
  }

  factory CategoriesModel.fromJson(Map<String, dynamic> json){
    return CategoriesModel(
      id: json["id"] ?? 0,
      title: json["title"] ?? "",
      price: json["price"] ?? 0.toDouble(),
      description: json["description"] ?? "",
      category: json["category"] ?? "",
      image: json["image"] ?? "",
      rating: json["rating"] == null ? null : Rating.fromJson(json["rating"]),
    );
  }

}

class Rating {
  Rating({
    required this.rate,
    required this.count,
  });

  var rate;
  var count;

  Rating copyWith({
    double? rate,
    int? count,
  }) {
    return Rating(
      rate: rate ?? this.rate,
      count: count ?? this.count,
    );
  }

  factory Rating.fromJson(Map<String, dynamic> json){
    return Rating(
      rate: json["rate"] ?? 0.toDouble(),
      count: json["count"] ?? 0,
    );
  }

}
