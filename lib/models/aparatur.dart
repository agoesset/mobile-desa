class Aparatur {
  final int id;
  final String name;
  final String role;
  final String image;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Aparatur({
    required this.id,
    required this.name,
    required this.role,
    required this.image,
    this.createdAt,
    this.updatedAt,
  });

  factory Aparatur.fromJson(Map<String, dynamic> json) {
    return Aparatur(
      id: json['id'] as int,
      name: json['name'] as String,
      role: json['role'] as String,
      image: json['image'] as String,
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at']) : null,
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'role': role,
      'image': image,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }
} 