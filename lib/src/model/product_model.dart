class ProductModel {
  final String title;
  final String description;
  final String price;
  final String brends;

  ProductModel({
    required this.title,
    required this.description,
    required this.price,
    required this.brends,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'price': price,
      'brends': brends,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      title: map['title'] as String,
      description: map['description'] as String,
      price: map['price'] as String,
      brends: map['brends'] as String,
    );
  }

}