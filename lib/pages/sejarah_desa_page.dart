import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../theme/colors.dart';
import '../theme/text_styles.dart';
import '../widgets/bottom_navbar.dart';
import '../providers/pages_provider.dart';
import '../widgets/loading_widget.dart';
import '../widgets/error_widget.dart';
import '../providers/base_state.dart';
import 'package:flutter_html/flutter_html.dart';

class SejarahDesaScreen extends StatefulWidget {
  const SejarahDesaScreen({Key? key}) : super(key: key);

  @override
  State<SejarahDesaScreen> createState() => _SejarahDesaScreenState();
}

class _SejarahDesaScreenState extends State<SejarahDesaScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<PagesProvider>().loadPageDetail('sejarah-desa');
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F2A1D),
        title: const Text(
          'Sejarah Desa',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
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
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Consumer<PagesProvider>(
                  builder: (context, provider, child) {
                    if (provider.pageDetailState.status == Status.loading) {
                      return const Center(child: LoadingWidget());
                    }

                    if (provider.pageDetailState.status == Status.error) {
                      return CustomErrorWidget(
                        message: provider.pageDetailState.errorMessage ?? 'Terjadi kesalahan',
                        onRetry: () => provider.loadPageDetail('sejarah-desa'),
                      );
                    }

                    final page = provider.pageDetailState.data;
                    if (page == null) {
                      return Center(
                        child: Text(
                          'Konten belum tersedia',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[600],
                            fontFamily: 'Alatsi',
                          ),
                        ),
                      );
                    }

                    return Container(
                      width: screenWidth > 600 ? 568 : screenWidth * 0.95,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE8EFDC),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Html(
                        data: page.content ?? 'Konten tidak tersedia',
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}