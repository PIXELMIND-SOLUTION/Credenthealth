

// class Blog {
//   final String id;
//   final String title;
//   final String description;
//   final String image;
//   final Doctor doctor;
//   final String createdAt;

//   Blog({
//     required this.id,
//     required this.title,
//     required this.description,
//     required this.image,
//     required this.doctor,
//     required this.createdAt,
//   });

//   factory Blog.fromJson(Map<String, dynamic> json) {
//     return Blog(
//       id: json['_id'] ?? '',
//       title: json['title'] ?? '',
//       description: json['description'] ?? '',
//       image: json['image'] ?? '',
//       doctor: Doctor.fromJson(json['doctor'] ?? {}),
//       createdAt: json['createdAt'] ?? '',
//     );
//   }
// }

// class Doctor {
//   final String id;
//   final String name;
//   final String email;
//   final String specialization;
//   final String qualification;
//   final String description;
//   final int consultationFee;
//   final String address;
//   final String image;
//   final String category;

//   Doctor({
//     required this.id,
//     required this.name,
//     required this.email,
//     required this.specialization,
//     required this.qualification,
//     required this.description,
//     required this.consultationFee,
//     required this.address,
//     required this.image,
//     required this.category,
//   });

//   factory Doctor.fromJson(Map<String, dynamic> json) {
//     return Doctor(
//       id: json['_id'] ?? '',
//       name: json['name'] ?? '',
//       email: json['email'] ?? '',
//       specialization: json['specialization'] ?? '',
//       qualification: json['qualification'] ?? '',
//       description: json['description'] ?? '',
//       consultationFee: json['consultation_fee'] ?? 0,
//       address: json['address'] ?? '',
//       image: json['image'] ?? '',
//       category: json['category'] ?? '',
//     );
//   }
// }











class Blog {
  final String id;
  final String title;
  final String description;
  final String image;
  final Doctor doctor;
  final String createdAt;

  Blog({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.doctor,
    required this.createdAt,
  });

  factory Blog.fromJson(Map<String, dynamic> json, String baseImageUrl) {
    return Blog(
      id: json['_id'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      image: _buildImageUrl(json['image'] ?? '', baseImageUrl),
      doctor: Doctor.fromJson(json['doctor'] ?? {}, baseImageUrl),
      createdAt: json['createdAt'] ?? '',
    );
  }

  static String _buildImageUrl(String imagePath, String baseUrl) {
    if (imagePath.isEmpty) return '';
    
  
    if (imagePath.startsWith('http://') || imagePath.startsWith('https://')) {
      return imagePath;
    }
    
    // If it starts with file:// or /uploads, remove the file:// part and build the URL
    if (imagePath.startsWith('file://')) {
      imagePath = imagePath.substring(7); // Remove 'file://'
    }
    
    // If it doesn't start with /, add it
    if (!imagePath.startsWith('/')) {
      imagePath = '/$imagePath';
    }
    
    return '$baseUrl$imagePath';
  }
}

class Doctor {
  final String id;
  final String name;
  final String email;
  final String specialization;
  final String qualification;
  final String description;
  final int consultationFee;
  final String address;
  final String image;
  final String category;

  Doctor({
    required this.id,
    required this.name,
    required this.email,
    required this.specialization,
    required this.qualification,
    required this.description,
    required this.consultationFee,
    required this.address,
    required this.image,
    required this.category,
  });

  factory Doctor.fromJson(Map<String, dynamic> json, String baseImageUrl) {
    return Doctor(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      specialization: json['specialization'] ?? '',
      qualification: json['qualification'] ?? '',
      description: json['description'] ?? '',
      consultationFee: json['consultation_fee'] ?? 0,
      address: json['address'] ?? '',
      image: _buildImageUrl(json['image'] ?? '', baseImageUrl),
      category: json['category'] ?? '',
    );
  }

  static String _buildImageUrl(String imagePath, String baseUrl) {
    if (imagePath.isEmpty) return '';
    
    // If it's already a complete URL, return as is
    if (imagePath.startsWith('http://') || imagePath.startsWith('https://')) {
      return imagePath;
    }
    
    // If it starts with file:// or /uploads, remove the file:// part and build the URL
    if (imagePath.startsWith('file://')) {
      imagePath = imagePath.substring(7); // Remove 'file://'
    }
    
    // If it doesn't start with /, add it
    if (!imagePath.startsWith('/')) {
      imagePath = '/$imagePath';
    }
    
    return '$baseUrl$imagePath';
  }
}