class CorporateDocument {
  final String id;
  final String name;
  final String url;
  final int sizeBytes;
  final DateTime uploadedAt;
  final String uploadedBy;
  final Map<String, dynamic>? metadata;

  CorporateDocument({
    required this.id,
    required this.name,
    required this.url,
    required this.sizeBytes,
    required this.uploadedAt,
    required this.uploadedBy,
    this.metadata,
  });

  // Factory constructor to create a Document from Supabase JSON response
  factory CorporateDocument.fromJson(Map<String, dynamic> json) {
    return CorporateDocument(
      id: json['id'] as String,
      name: json['name'] as String,
      url: json['public_url'] as String,
      sizeBytes: json['size_bytes'] ?? 0,
      uploadedAt: DateTime.parse(json['created_at']),
      uploadedBy: json['uploaded_by_user_id'] as String,
      metadata: json['metadata'],
    );
  }

  // Method to convert Document object back to JSON for API calls
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'public_url': url,
      'size_bytes': sizeBytes,
      'created_at': uploadedAt.toIso8601String(),
    };
  }
}
