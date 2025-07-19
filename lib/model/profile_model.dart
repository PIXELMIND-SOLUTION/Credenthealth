class ProfileModel {
  final String? id;
  final String? name;
  final String? email;
  final String? mobileNumber;
  final int? age;
  final String? gender;
  final String? profileImage;
  final String? staffId;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  ProfileModel({
    this.id,
    this.name,
    this.email,
    this.mobileNumber,
    this.age,
    this.gender,
    this.profileImage,
    this.staffId,
    this.createdAt,
    this.updatedAt,
  });

  // Factory constructor to create ProfileModel from JSON
  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      id: json['_id'] ?? json['id'],
      name: json['name'],
      email: json['email'],
      mobileNumber: json['mobileNumber'] ?? json['mobile_number'] ?? json['phone'],
      age: json['age'] != null ? int.tryParse(json['age'].toString()) : null,
      gender: json['gender'],
      profileImage: json['profileImage'] ?? json['profile_image'],
      staffId: json['staffId'] ?? json['staff_id'],
      createdAt: json['createdAt'] != null ? DateTime.tryParse(json['createdAt']) : null,
      updatedAt: json['updatedAt'] != null ? DateTime.tryParse(json['updatedAt']) : null,
    );
  }

  // Convert ProfileModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'mobileNumber': mobileNumber,
      'age': age,
      'gender': gender,
      'profileImage': profileImage,
      'staffId': staffId,
    };
  }

  // Convert to JSON for API requests (excluding null values)
  Map<String, dynamic> toApiJson() {
    Map<String, dynamic> json = {};
    
    if (name != null) json['name'] = name;
    if (email != null) json['email'] = email;
    if (mobileNumber != null) json['mobileNumber'] = mobileNumber;
    if (age != null) json['age'] = age;
    if (gender != null) json['gender'] = gender;
    if (profileImage != null) json['profileImage'] = profileImage;
    if (staffId != null) json['staffId'] = staffId;
    
    return json;
  }

  // Create a copy of ProfileModel with updated values
  ProfileModel copyWith({
    String? id,
    String? name,
    String? email,
    String? mobileNumber,
    int? age,
    String? gender,
    String? profileImage,
    String? staffId,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return ProfileModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      mobileNumber: mobileNumber ?? this.mobileNumber,
      age: age ?? this.age,
      gender: gender ?? this.gender,
      profileImage: profileImage ?? this.profileImage,
      staffId: staffId ?? this.staffId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  // Get full profile image URL
  String? get fullProfileImageUrl {
    if (profileImage != null && profileImage!.isNotEmpty) {
      // If the profile image is already a full URL, return it
      if (profileImage!.startsWith('http')) {
        return profileImage;
      }
      // Otherwise, construct the full URL
      return 'http://194.164.148.244:4051$profileImage';
    }
    return null;
  }

  @override
  String toString() {
    return 'ProfileModel(id: $id, name: $name, email: $email, mobileNumber: $mobileNumber, age: $age, gender: $gender, profileImage: $profileImage, staffId: $staffId)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ProfileModel &&
        other.id == id &&
        other.name == name &&
        other.email == email &&
        other.mobileNumber == mobileNumber &&
        other.age == age &&
        other.gender == gender &&
        other.profileImage == profileImage &&
        other.staffId == staffId;
  }

  @override
  int get hashCode {
    return Object.hash(
      id,
      name,
      email,
      mobileNumber,
      age,
      gender,
      profileImage,
      staffId,
    );
  }
}