// import 'package:consultation_app/auth/views/api/getall_blog_service.dart';
// import 'package:consultation_app/model/get_all_model.dart';
// import 'package:flutter/material.dart';

// class GetAllBlogProvider extends ChangeNotifier {
//   final GetallBlogService _blogService = GetallBlogService();
  
//   List<Blog> _blogs = [];
//   bool _isLoading = false;
//   String _errorMessage = '';

//   // Getters
//   List<Blog> get blogs => _blogs;
//   bool get isLoading => _isLoading;
//   String get errorMessage => _errorMessage;
//   bool get hasError => _errorMessage.isNotEmpty;

//   // Fetch all blogs
//   Future<void> fetchAllBlogs() async {
//     _isLoading = true;
//     _errorMessage = '';
//     notifyListeners();

//     try {
//       _blogs = await _blogService.getAllBlogs();
//       _errorMessage = '';
//     } catch (e) {
//       _errorMessage = e.toString();
//       _blogs = [];
//     } finally {
//       _isLoading = false;
//       notifyListeners();
//     }
//   }

//   // Clear error message
//   void clearError() {
//     _errorMessage = '';
//     notifyListeners();
//   }

//   // Refresh blogs
//   Future<void> refreshBlogs() async {
//     await fetchAllBlogs();
//   }

//   // Format date for display
//   String formatDate(String dateString) {
//     try {
//       DateTime date = DateTime.parse(dateString);
//       List<String> months = [
//         'January', 'February', 'March', 'April', 'May', 'June',
//         'July', 'August', 'September', 'October', 'November', 'December'
//       ];
//       return '${months[date.month - 1]} ${date.day}, ${date.year}';
//     } catch (e) {
//       return 'Unknown Date';
//     }
//   }
// }







import 'package:consultation_app/auth/views/api/getall_blog_service.dart';
import 'package:consultation_app/model/get_all_model.dart';
import 'package:flutter/material.dart';

class GetAllBlogProvider extends ChangeNotifier {
  final GetallBlogService _blogService = GetallBlogService();
  
  List<Blog> _blogs = [];
  Blog? _selectedBlog;
  bool _isLoading = false;
  bool _isSingleBlogLoading = false;
  String _errorMessage = '';

  // Getters
  List<Blog> get blogs => _blogs;
  Blog? get selectedBlog => _selectedBlog;
  bool get isLoading => _isLoading;
  bool get isSingleBlogLoading => _isSingleBlogLoading;
  String get errorMessage => _errorMessage;
  bool get hasError => _errorMessage.isNotEmpty;

  // Fetch all blogs
  Future<void> fetchAllBlogs() async {
    _isLoading = true;
    _errorMessage = '';
    notifyListeners();

    try {
      _blogs = await _blogService.getAllBlogs();
      _errorMessage = '';
    } catch (e) {
      _errorMessage = e.toString();
      _blogs = [];
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Fetch single blog
  Future<void> fetchSingleBlog(String blogId) async {
    _isSingleBlogLoading = true;
    _errorMessage = '';
    notifyListeners();

    try {
      _selectedBlog = await _blogService.getSingleBlog(blogId);
      _errorMessage = '';
    } catch (e) {
      _errorMessage = e.toString();
      _selectedBlog = null;
    } finally {
      _isSingleBlogLoading = false;
      notifyListeners();
    }
  }

  // Clear selected blog
  void clearSelectedBlog() {
    _selectedBlog = null;
    notifyListeners();
  }

  // Clear error message
  void clearError() {
    _errorMessage = '';
    notifyListeners();
  }

  // Refresh blogs
  Future<void> refreshBlogs() async {
    await fetchAllBlogs();
  }

  // Format date for display
  String formatDate(String dateString) {
    try {
      DateTime date = DateTime.parse(dateString);
      List<String> months = [
        'January', 'February', 'March', 'April', 'May', 'June',
        'July', 'August', 'September', 'October', 'November', 'December'
      ];
      return '${months[date.month - 1]} ${date.day}, ${date.year}';
    } catch (e) {
      return 'Unknown Date';
    }
  }
}