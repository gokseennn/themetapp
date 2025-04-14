class SearchResponse {
  final List<int> artifactIds;
  final int totalArtifacts;

  SearchResponse({
    required this.artifactIds,
    required this.totalArtifacts,
  });

  factory SearchResponse.fromJson(Map<String, dynamic> json) {
    return SearchResponse(
      artifactIds: (json['objectIDs'] as List<dynamic>?)
              ?.map((e) => e as int)
              .toList() ??
          [],
      totalArtifacts: json['total'] ?? 0,
    );
  }
}
