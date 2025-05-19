import 'package:flutter/material.dart';
import '../widgets/bottom_navbar.dart'; // Import BottomNavBar
import '../theme/app_theme.dart';
import 'package:html/parser.dart' show parse;

class NewsDetailPage extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final String date; // Contoh format: '17 Agt 2024'

  const NewsDetailPage({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.date,
  }) : super(key: key);

  bool get _hasValidImage => imageUrl.isNotEmpty && Uri.tryParse(imageUrl)?.hasAbsolutePath == true;

  String _getFormattedDate() {
    if (date.isEmpty) return 'Tanggal tidak tersedia';
    return date;
  }

  String _getFormattedTitle() {
    if (title.isEmpty) return 'Judul tidak tersedia';
    return title;
  }

  String _stripHtml(String htmlString) {
    final document = parse(htmlString);
    String text = document.body?.text ?? '';
    
    // Clean excess whitespace
    text = text.replaceAll(RegExp(r'\s+'), ' ').trim();
    
    // Split into sentences, preserving punctuation
    List<String> sentences = text.split(RegExp(r'(?<=[.!?])\s+'));
    sentences = sentences.where((s) => s.trim().isNotEmpty).toList();
    
    // Group sentences into paragraphs (3-4 sentences per paragraph)
    List<String> paragraphs = [];
    for (var i = 0; i < sentences.length; i += 3) {
      var end = i + 3;
      if (end > sentences.length) end = sentences.length;
      var paragraph = sentences.sublist(i, end).join(' ');
      
      // Only add non-empty paragraphs with proper indentation
      if (paragraph.trim().isNotEmpty) {
        // Add two spaces for first line indentation
        paragraphs.add('  ' + paragraph.trim());
      }
    }
    
    // Join paragraphs with double line breaks
    return paragraphs.join('\n\n');
  }

  Widget _buildFormattedText(String text) {
    final formattedText = _stripHtml(text);
    return Text(
      formattedText,
      style: const TextStyle(
        fontSize: 16,
        height: 1.8,
        letterSpacing: 0.3,
        color: Colors.black87,
      ),
      textAlign: TextAlign.justify,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.primaryColor,
        title: const Text(
          'Berita Desa',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontFamily: 'Alatsi',
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(Icons.arrow_back, color: Colors.white),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
      ),
      body: description.isEmpty
          ? const Center(
              child: Text(
                'Konten tidak tersedia',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            )
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE8EFDC),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _getFormattedTitle(),
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            const Icon(Icons.person_outline, size: 14, color: Colors.grey),
                            const SizedBox(width: 4),
                            const Text(
                              'Administrator',
                              style: TextStyle(color: Colors.grey, fontSize: 10),
                            ),
                            const SizedBox(width: 16),
                            const Icon(Icons.calendar_today_outlined, size: 14, color: Colors.grey),
                            const SizedBox(width: 4),
                            Text(
                              _getFormattedDate(),
                              style: const TextStyle(color: Colors.grey, fontSize: 10),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  if (_hasValidImage)
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFE8EFDC),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            imageUrl,
                            width: double.infinity,
                            height: 200,
                            fit: BoxFit.cover,
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) return child;
                              return Container(
                                height: 200,
                                width: double.infinity,
                                color: Colors.grey[200],
                                child: Center(
                                  child: CircularProgressIndicator(
                                    value: loadingProgress.expectedTotalBytes != null
                                        ? loadingProgress.cumulativeBytesLoaded /
                                            loadingProgress.expectedTotalBytes!
                                        : null,
                                  ),
                                ),
                              );
                            },
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                height: 200,
                                width: double.infinity,
                                color: Colors.grey[200],
                                child: const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.image_not_supported, size: 40, color: Colors.grey),
                                    SizedBox(height: 8),
                                    Text(
                                      'Gambar tidak tersedia',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  const SizedBox(height: 16),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: _buildFormattedText(description),
                  ),
                ],
              ),
            ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}