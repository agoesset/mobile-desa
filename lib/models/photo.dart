class Photo {
  final int id;
  final String image;
  final String caption;
  final DateTime createdAt;
  final DateTime updatedAt;

  Photo({
    required this.id,
    required this.image,
    required this.caption,
    required this.createdAt,
    required this.updatedAt,
  });

  String get fullImageUrl => image.startsWith('http') ? image : 'https://desa-api.aguss.id$image';

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      id: json['id'],
      image: json['image'],
      caption: json['caption'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
} 