class CategoryEntity {
  final int id;
  final String name;
  final String image;
  final List<dynamic> child;

  CategoryEntity({
    required this.id,
    required this.name,
    required this.image,
    this.child = const [],
  });
}
