class ApiConstants {
  static const String baseUrl = 'https://desa-api.aguss.id/api';
  
  // Public Endpoints
  static const String sliders = '/public/sliders';
  static const String posts = '/public/posts';
  static const String postsHome = '/public/posts_home';
  static const String products = '/public/products';
  static const String productsHome = '/public/products_home';
  static const String aparaturs = '/public/aparaturs';
  static const String pages = '/public/pages';
  
  // Timeout duration
  static const int timeoutDuration = 30; // in seconds
}

class AppConstants {
  static const String defaultErrorMessage = 'Terjadi kesalahan. Silakan coba lagi nanti.';
  static const String noInternetMessage = 'Tidak ada koneksi internet.';
  static const String timeoutMessage = 'Koneksi timeout. Silakan coba lagi.';
} 