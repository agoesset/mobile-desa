import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/custom_list_item.dart';
import '../theme/styles.dart';
import '../widgets/bottom_navbar.dart';
import '../models/aparaturs_card.dart';
import '../providers/aparatur_provider.dart';
import '../widgets/loading_widget.dart';
import '../widgets/error_widget.dart';
import '../providers/base_state.dart';
import '../providers/pages_provider.dart';
import '../models/page.dart';
import '../models/aparatur.dart';

class InformationScreen extends StatefulWidget {
  const InformationScreen({Key? key}) : super(key: key);

  @override
  State<InformationScreen> createState() => _InformationScreenState();
}

class _InformationScreenState extends State<InformationScreen> {
  bool _showAparaturs = false;

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<AparaturProvider>().loadAparaturs();
      context.read<PagesProvider>().loadPages();
    });
  }

  Widget _buildButton(String text, bool isActive, VoidCallback onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        decoration: BoxDecoration(
          color: isActive ? const Color(0xFF0F2A1D) : Colors.grey[300],
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              offset: const Offset(0, 4),
              blurRadius: 4,
            ),
          ],
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: isActive ? Colors.white : Colors.black87,
              fontSize: 16,
              fontFamily: 'Alatsi',
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAparatursGrid() {
    return Consumer<AparaturProvider>(
      builder: (context, provider, child) {
        if (provider.state.status == Status.loading) {
          return GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 27,
              mainAxisExtent: 250,
            ),
            itemCount: 4,
            itemBuilder: (context, index) => const LoadingWidget(),
          );
        }

        if (provider.state.status == Status.error) {
          return CustomErrorWidget(
            message: provider.state.errorMessage ?? 'Terjadi kesalahan',
            onRetry: () => provider.loadAparaturs(),
          );
        }

        final List<Aparatur> aparaturs = provider.state.data ?? [];
        if (aparaturs.isEmpty) {
          return Center(
            child: Text(
              'Tidak ada data aparatur',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
                fontFamily: 'Alatsi',
              ),
            ),
          );
        }

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 27,
            mainAxisExtent: 250,
          ),
          itemCount: aparaturs.length,
          itemBuilder: (context, index) {
            final aparatur = aparaturs[index];
            return OfficialCard(
              imageUrl: aparatur.image,
              name: aparatur.name,
              position: aparatur.role,
            );
          },
        );
      },
    );
  }

  Widget _buildPagesList() {
    return Consumer<PagesProvider>(
      builder: (context, provider, child) {
        switch (provider.state.status) {
          case Status.loading:
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 4,
                separatorBuilder: (context, index) => const SizedBox(height: 8.0),
                itemBuilder: (context, index) => Container(
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
                  child: const LoadingWidget(),
                ),
              ),
            );

          case Status.error:
            return CustomErrorWidget(
              message: provider.state.errorMessage ?? 'Terjadi kesalahan',
              onRetry: () => provider.loadPages(),
            );

          case Status.success:
            final List<PageModel> pages = provider.state.data ?? [];
            if (pages.isEmpty) {
              return Center(
                child: Text(
                  'Tidak ada data halaman',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                    fontFamily: 'Alatsi',
                  ),
                ),
              );
            }

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: pages.length,
                separatorBuilder: (context, index) => const SizedBox(height: 8.0),
                itemBuilder: (context, index) {
                  final page = pages[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/page-detail',
                        arguments: page.slug,
                      );
                    },
                    child: Container(
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
                      child: CustomListItem(
                        title: page.title,
                        horizontalPadding: 16.0,
                        verticalPadding: 14.0,
                        titleFontSize: 14.0,
                        iconSize: 24.0,
                      ),
                    ),
                  );
                },
              ),
            );

          case Status.initial:
          default:
            return const SizedBox.shrink();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppStyles.headerBackground,
        title: Row(
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const Icon(Icons.arrow_back, color: Colors.white),
            ),
            const SizedBox(width: 8),
            const Text(
              'Informasi Desa',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontFamily: 'Alatsi',
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        automaticallyImplyLeading: false,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await context.read<PagesProvider>().loadPages();
          if (_showAparaturs) {
            await context.read<AparaturProvider>().loadAparaturs();
          }
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Expanded(
                      child: _buildButton(
                        'Informasi',
                        !_showAparaturs,
                        () => setState(() => _showAparaturs = false),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: _buildButton(
                        'Aparatur',
                        _showAparaturs,
                        () => setState(() => _showAparaturs = true),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              _showAparaturs ? _buildAparatursGrid() : _buildPagesList(),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}