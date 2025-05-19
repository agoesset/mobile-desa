import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../theme/styles.dart';
import '../models/news_card.dart';
import '../pages/news_detail_page.dart';
import '../widgets/bottom_navbar.dart';
import '../providers/post_provider.dart';
import '../utils/constants.dart';
import '../providers/base_state.dart';
import '../models/post.dart';
import 'package:intl/intl.dart';

class NewsPage extends StatefulWidget {
  final String? searchKeyword;
  
  const NewsPage({
    Key? key,
    this.searchKeyword,
  }) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      if (widget.searchKeyword != null && widget.searchKeyword!.isNotEmpty) {
        context.read<PostProvider>().searchPosts(widget.searchKeyword!);
      } else {
        context.read<PostProvider>().loadPosts();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppStyles.headerBackground,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        title: Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(Icons.arrow_back, color: Colors.white),
            ),
            const SizedBox(width: 8),
            Text(
              'Berita Desa',
              style: AppStyles.headerTitle.copyWith(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        automaticallyImplyLeading: false,
      ),
      body: Consumer<PostProvider>(
        builder: (context, provider, child) {
          if (provider.state.status == Status.loading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (provider.state.status == Status.error) {
            return Center(
              child: Text(
                provider.state.errorMessage ?? AppConstants.defaultErrorMessage,
                textAlign: TextAlign.center,
              ),
            );
          }

          final List<Post> posts = (provider.state.data as List<Post>?) ?? [];

          if (posts.isEmpty) {
            return const Center(
              child: Text(
                'Tidak ada berita saat ini',
                textAlign: TextAlign.center,
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.only(
              top: 16,
              bottom: AppStyles.screenPadding,
            ),
            itemCount: posts.length,
            itemBuilder: (context, index) {
              final post = posts[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NewsDetailPage(
                        imageUrl: post.image ?? '',
                        title: post.title ?? '',
                        description: post.content ?? '',
                        date: post.createdAt != null 
                          ? DateFormat('dd MMM yyyy').format(post.createdAt!)
                          : '',
                      ),
                    ),
                  );
                },
                child: NewsCard(
                  imageUrl: post.image ?? '',
                  title: post.title ?? '',
                  description: post.content ?? '',
                  date: post.createdAt,
                ),
              );
            },
          );
        },
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}