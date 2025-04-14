class Artifact {
  final int objectId;
  final String imageUrl;
  final String culture;
  final String objectDate;
  final String title;
  final String medium;
  final String dimensions;
  final String classification;
  final String creditLine;
  final String accessionNumber;

  Artifact({
    required this.objectId,
    required this.imageUrl,
    required this.culture,
    required this.objectDate,
    required this.title,
    required this.medium,
    required this.dimensions,
    required this.classification,
    required this.creditLine,
    required this.accessionNumber,
  });

  factory Artifact.fromJson(Map<String, dynamic> json) {
    return Artifact(
      objectId: json['objectID'] ?? 0,
      imageUrl: json['primaryImage'] ?? "",
      culture: json['culture'] ?? "",
      objectDate: json['objectDate'] ?? "",
      title: json['title'] ?? "",
      medium: json['medium'] ?? "",
      dimensions: json['dimensions'] ?? "",
      classification: json['classification'] ?? "",
      creditLine: json['creditLine'] ?? "",
      accessionNumber: json['accessionNumber'] ?? "",
    );
  }
}
