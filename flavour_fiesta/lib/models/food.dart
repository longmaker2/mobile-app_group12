class FoodItem {
  final String name;
  final String imagePath;
  final double price;
  final String description;

  const FoodItem({
    required this.name,
    required this.imagePath,
    required this.price,
    required this.description,
  });
}

class PopularItem {
  final String title;
  final String imagePath;
  final double price;

  const PopularItem({
    required this.title,
    required this.imagePath,
    required this.price,
  });
}

class PromotionsItem {
  final String title;
  final String subtitle;
  final String description;
  final double price;
  final String imagePath;

  const PromotionsItem({
    required this.title,
    required this.subtitle,
    required this.description,
    required this.price,
    required this.imagePath,
  });
}
