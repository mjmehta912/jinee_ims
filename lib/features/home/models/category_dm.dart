class CategoryDm {
  final String category;
  final int count;

  CategoryDm({
    required this.category,
    required this.count,
  });

  factory CategoryDm.fromJson(Map<String, dynamic> json) {
    return CategoryDm(
      category: json['Category'],
      count: json['Count'],
    );
  }
}
