class Product {
  final int id;
  final int userId;
  final String title;
  final String slug;
  final String content;
  final String owner;
  final String image;
  final String price;
  final String phone;
  final String address;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Product({
    required this.id,
    required this.userId,
    required this.title,
    required this.slug,
    required this.content,
    required this.owner,
    required this.image,
    required this.price,
    required this.phone,
    required this.address,
    this.createdAt,
    this.updatedAt,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as int,
      userId: json['user_id'] as int,
      title: json['title'] as String,
      slug: json['slug'] as String,
      content: json['content'] as String,
      owner: json['owner'] as String,
      image: json['image'] as String,
      price: json['price'] as String,
      phone: json['phone'] as String,
      address: json['address'] as String,
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at']) : null,
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'title': title,
      'slug': slug,
      'content': content,
      'owner': owner,
      'image': image,
      'price': price,
      'phone': phone,
      'address': address,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }
} 