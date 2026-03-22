class Product {
  final String id;
  final String name;
  final String description;
  final String price;
  final String size; // Added this field
  final String category;
  final String subCategory;
  final String image;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.size, // Added this field
    required this.category,
    required this.subCategory,
    required this.image,
  });
}
