import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_html/flutter_html.dart';
import '../providers/pages_provider.dart';
import '../theme/styles.dart';
import '../widgets/loading_widget.dart';
import '../widgets/error_widget.dart';
import '../providers/base_state.dart';

class PageDetailScreen extends StatefulWidget {
  final String slug;

  const PageDetailScreen({Key? key, required this.slug}) : super(key: key);

  @override
  State<PageDetailScreen> createState() => _PageDetailScreenState();
}

class _PageDetailScreenState extends State<PageDetailScreen> {
  String _cleanHtml(String html) {
    return html
        .replaceAll('</p><p>', '</p>\n<p>')
        .replaceAll('<br>', '\n')
        .replaceAll('<br/>', '\n')
        .replaceAll('<br />', '\n')
        .replaceAll('</strong>', '</b>')
        .replaceAll('<strong>', '<b>');
  }

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<PagesProvider>().loadPageDetail(widget.slug);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppStyles.headerBackground,
        title: Consumer<PagesProvider>(
          builder: (context, provider, child) {
            if (provider.pageDetailState.status == Status.success) {
              return Text(
                provider.pageDetailState.data?.title ?? 'Detail Page',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontFamily: 'Alatsi',
                  fontWeight: FontWeight.bold,
                ),
              );
            }
            return const Text(
              'Detail Page',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontFamily: 'Alatsi',
                fontWeight: FontWeight.bold,
              ),
            );
          },
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
      ),
      body: Consumer<PagesProvider>(
        builder: (context, provider, child) {
          if (provider.pageDetailState.status == Status.loading) {
            return const Center(child: LoadingWidget());
          }

          if (provider.pageDetailState.status == Status.error) {
            return CustomErrorWidget(
              message: provider.pageDetailState.errorMessage ?? 'Terjadi kesalahan',
              onRetry: () => provider.loadPageDetail(widget.slug),
            );
          }

          final page = provider.pageDetailState.data;
          if (page == null) {
            return const Center(
              child: Text('Data tidak ditemukan'),
            );
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Html(
              data: _cleanHtml(page.content ?? 'Konten tidak tersedia'),
              style: {
                "body": Style(
                  fontSize: FontSize(14),
                  fontFamily: 'Alatsi',
                ),
                "h1": Style(
                  fontSize: FontSize(24),
                  fontWeight: FontWeight.bold,
                  margin: Margins(bottom: Margin(16)),
                ),
                "h2": Style(
                  fontSize: FontSize(20),
                  fontWeight: FontWeight.bold,
                  margin: Margins(bottom: Margin(12), top: Margin(8)),
                ),
                "p": Style(
                  fontSize: FontSize(14),
                  lineHeight: LineHeight(1.5),
                  margin: Margins(bottom: Margin(8)),
                ),
                "ul": Style(
                  margin: Margins(left: Margin(16), bottom: Margin(8)),
                ),
                "li": Style(
                  margin: Margins(bottom: Margin(4)),
                ),
                "b": Style(
                  fontWeight: FontWeight.bold,
                ),
              },
            ),
          );
        },
      ),
    );
  }
} 