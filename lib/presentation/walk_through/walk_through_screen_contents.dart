enum WalkThroughScreenContents {
  introduction(description: '', title: '', imagePath: '');

  final String title;
  final String description;
  final String? imagePath;

  const WalkThroughScreenContents({
    required this.title,
    required this.description,
    this.imagePath,
  });
}
