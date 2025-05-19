class Post {
  final int? id;
  final int? categoryId;
  final int? userId;
  final String title;
  final String slug;
  final String image;
  final String content;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Post({
    this.id,
    this.categoryId,
    this.userId,
    required this.title,
    required this.slug,
    required this.image,
    required this.content,
    this.createdAt,
    this.updatedAt,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'] as int?,
      categoryId: json['category_id'] as int?,
      userId: json['user_id'] as int?,
      title: json['title'] as String? ?? '',
      slug: json['slug'] as String? ?? '',
      image: json['image'] as String? ?? '',
      content: json['content'] as String? ?? '',
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at']) : null,
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'category_id': categoryId,
      'user_id': userId,
      'title': title,
      'slug': slug,
      'image': image,
      'content': content,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }
} 