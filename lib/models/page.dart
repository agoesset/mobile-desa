class PageModel {
  final int id;
  final int userId;
  final String title;
  final String slug;
  final String? content;
  final String createdAt;
  final String updatedAt;

  PageModel({
    required this.id,
    required this.userId,
    required this.title,
    required this.slug,
    this.content,
    required this.createdAt,
    required this.updatedAt,
  });

  factory PageModel.fromJson(Map<String, dynamic> json) {
    return PageModel(
      id: json['id'] as int,
      userId: json['user_id'] as int,
      title: json['title'] as String,
      slug: json['slug'] as String,
      content: json['content'] as String?,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'title': title,
      'slug': slug,
      'content': content,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
} 