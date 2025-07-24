// // booking_model.dart
// class BookingResponse {
//   final List<Booking> bookings;

//   BookingResponse({required this.bookings});

//   factory BookingResponse.fromJson(Map<String, dynamic> json) {
//     return BookingResponse(
//       bookings: (json['bookings'] as List<dynamic>)
//           .map((booking) => Booking.fromJson(booking))
//           .toList(),
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'bookings': bookings.map((booking) => booking.toJson()).toList(),
//     };
//   }
// }

// class Booking {
//   final String id;
//   final String staffId;
//   final String familyMemberId;
//   final DiagnosticInfo diagnosticId;
//   final String serviceType;
//   final CartInfo cartId;
//   final double totalPrice;
//   final String? couponCode;
//   final double discount;
//   final double payableAmount;
//   final String status;
//   final String date;
//   final String timeSlot;
//   final String createdAt;
//   final String updatedAt;

//   //new code
//   final String ?title;
//   final String? name;
//   final double? price;
//   final String? preparation;
//   final bool? fastingRequired;
//   final bool? homeCollectionAvailable;
//   final bool? reportIn24Hrs;
//   final String? description;
//   final String? category;
//   final String? image;

//   // final List<ItemDetails> itemDetails;

//   Booking({
//     required this.id,
//     required this.staffId,
//     required this.familyMemberId,
//     required this.diagnosticId,
//     required this.serviceType,
//     required this.cartId,
//     required this.totalPrice,
//     this.couponCode,
//     required this.discount,
//     required this.payableAmount,
//     required this.status,
//     required this.date,
//     required this.timeSlot,
//     required this.createdAt,
//     required this.updatedAt,
//     // required this.itemDetails,
    

//     this.title,
//     this.name,
//      this.price,
//     this.preparation,
//     this.fastingRequired,
//     this.homeCollectionAvailable,
//     this.reportIn24Hrs,
//     this.description,
//     this.category,
//      this.image,
//   });

//   factory Booking.fromJson(Map<String, dynamic> json) {
//     return Booking(
//       id: json['_id'] ?? '',
//       staffId: json['staffId'] ?? '',
//       familyMemberId: json['familyMemberId'] ?? '',
//       diagnosticId: DiagnosticInfo.fromJson(json['diagnosticId'] ?? {}),
//       serviceType: json['serviceType'] ?? '',
//       cartId: CartInfo.fromJson(json['cartId'] ?? {}),
//       totalPrice: (json['totalPrice'] ?? 0).toDouble(),
//       couponCode: json['couponCode'],
//       discount: (json['discount'] ?? 0).toDouble(),
//       payableAmount: (json['payableAmount'] ?? 0).toDouble(),
//       status: json['status'] ?? '',
//       date: json['date'] ?? '',
//       timeSlot: json['timeSlot'] ?? '',
//       createdAt: json['createdAt'] ?? '',
//       updatedAt: json['updatedAt'] ?? '',


//       //new

//       title: json['title'] ?? '',
//       name: json['name'],
//       price: (json['price'] ?? 0).toDouble(),
//       preparation: json['preparation'],
//       fastingRequired: json['fastingRequired'],
//       homeCollectionAvailable: json['homeCollectionAvailable'],
//       reportIn24Hrs: json['reportIn24Hrs'],
//       description: json['description'],
//       category: json['category'],
//       image: json['image'] ?? '',
      
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       '_id': id,
//       'staffId': staffId,
//       'familyMemberId': familyMemberId,
//       'diagnosticId': diagnosticId.toJson(),
//       'serviceType': serviceType,
//       'cartId': cartId.toJson(),
//       'totalPrice': totalPrice,
//       'couponCode': couponCode,
//       'discount': discount,
//       'payableAmount': payableAmount,
//       'status': status,
//       'date': date,
//       'timeSlot': timeSlot,
//       'createdAt': createdAt,
//       'updatedAt': updatedAt,
       
//       //new
//       'title': title,
//       'name': name,
//       'price': price,
//       'preparation': preparation,
//       'fastingRequired': fastingRequired,
//       'homeCollectionAvailable': homeCollectionAvailable,
//       'reportIn24Hrs': reportIn24Hrs,
//       'description': description,
//       'category': category,
//       'image': image,


//     };
//   }

//   // Helper method to get formatted date
//   String get formattedDate {
//     try {
//       DateTime parsedDate = DateTime.parse(date);
//       return "${parsedDate.day}-${parsedDate.month.toString().padLeft(2, '0')}-${parsedDate.year}";
//     } catch (e) {
//       return date; // Return original if parsing fails
//     }
//   }

//   // Helper method to get status color
//   String get statusColor {
//     switch (status.toLowerCase()) {
//       case 'completed':
//         return 'blue';
//       case 'confirmed':
//       case 'ongoing':
//         return 'green';
//       case 'cancelled':
//         return 'red';
//       default:
//         return 'grey';
//     }
//   }

//   // Helper method to get primary service name
//   String get primaryServiceName {
//     if (cartId.items.isNotEmpty) {
//       return cartId.items.first.title;
//     }
//     return diagnosticId.name;
//   }
// }

// class DiagnosticInfo {
//   final String id;
//   final String name;
//   final String distance;
//   final String image;

//   DiagnosticInfo({
//     required this.id,
//     required this.name,
//     required this.distance,
//     required this.image,
//   });

//   factory DiagnosticInfo.fromJson(Map<String, dynamic> json) {
//     return DiagnosticInfo(
//       id: json['_id'] ?? '',
//       name: json['name'] ?? '',
//       distance: json['distance'] ?? '',
//       image: json['image'] ?? '',
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       '_id': id,
//       'name': name,
//       'distance': distance,
//       'image': image,
//     };
//   }
// }

// class CartInfo {
//   final String id;
//   final String userId;
//   final List<CartItem> items;
//   final String createdAt;
//   final String updatedAt;

//   CartInfo({
//     required this.id,
//     required this.userId,
//     required this.items,
//     required this.createdAt,
//     required this.updatedAt,
//   });

//   factory CartInfo.fromJson(Map<String, dynamic> json) {
//     return CartInfo(
//       id: json['_id'] ?? '',
//       userId: json['userId'] ?? '',
//       items: (json['items'] as List<dynamic>? ?? [])
//           .map((item) => CartItem.fromJson(item))
//           .toList(),
//       createdAt: json['createdAt'] ?? '',
//       updatedAt: json['updatedAt'] ?? '',
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       '_id': id,
//       'userId': userId,
//       'items': items.map((item) => item.toJson()).toList(),
//       'createdAt': createdAt,
//       'updatedAt': updatedAt,
//     };
//   }
// }

// class CartItem {
//   final String itemId;
//   final String type;
//   final String title;
//   final int quantity;
//   final double price;
//   final double offerPrice;
//   final double totalPayable;
//   final double totalPrice;
//   final String id;
//   final ItemDetails itemDetails;

//   CartItem({
//     required this.itemId,
//     required this.type,
//     required this.title,
//     required this.quantity,
//     required this.price,
//     required this.offerPrice,
//     required this.totalPayable,
//     required this.totalPrice,
//     required this.id,
//     required this.itemDetails,
//   });

//   factory CartItem.fromJson(Map<String, dynamic> json) {
//     return CartItem(
//       itemId: json['itemId'] ?? '',
//       type: json['type'] ?? '',
//       title: json['title'] ?? '',
//       quantity: json['quantity'] ?? 0,
//       price: (json['price'] ?? 0).toDouble(),
//       offerPrice: (json['offerPrice'] ?? 0).toDouble(),
//       totalPayable: (json['totalPayable'] ?? 0).toDouble(),
//       totalPrice: (json['totalPrice'] ?? 0).toDouble(),
//       id: json['_id'] ?? '',
//       itemDetails: ItemDetails.fromJson(json['itemDetails'] ?? {}),
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'itemId': itemId,
//       'type': type,
//       'title': title,
//       'quantity': quantity,
//       'price': price,
//       'offerPrice': offerPrice,
//       'totalPayable': totalPayable,
//       'totalPrice': totalPrice,
//       '_id': id,
//       'itemDetails': itemDetails.toJson(),
//     };
//   }
// }

// class ItemDetails {
//   final String id;
//   final String title;
//   final String? name;
//   final double price;
//   final String? preparation;
//   final bool? fastingRequired;
//   final bool? homeCollectionAvailable;
//   final bool? reportIn24Hrs;
//   final String? description;
//   final String? category;
//   final String image;
//   final String createdAt;
//   final String updatedAt;

//   ItemDetails({
//     required this.id,
//     required this.title,
//     this.name,
//     required this.price,
//     this.preparation,
//     this.fastingRequired,
//     this.homeCollectionAvailable,
//     this.reportIn24Hrs,
//     this.description,
//     this.category,
//     required this.image,
//     required this.createdAt,
//     required this.updatedAt,
//   });

//   factory ItemDetails.fromJson(Map<String, dynamic> json) {
//     return ItemDetails(
//       id: json['_id'] ?? '',
//       title: json['title'] ?? json['name'] ?? '',
//       name: json['name'],
//       price: (json['price'] ?? 0).toDouble(),
//       preparation: json['preparation'],
//       fastingRequired: json['fastingRequired'],
//       homeCollectionAvailable: json['homeCollectionAvailable'],
//       reportIn24Hrs: json['reportIn24Hrs'],
//       description: json['description'],
//       category: json['category'],
//       image: json['image'] ?? '',
//       createdAt: json['createdAt'] ?? '',
//       updatedAt: json['updatedAt'] ?? '',
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       '_id': id,
//       'title': title,
//       'name': name,
//       'price': price,
//       'preparation': preparation,
//       'fastingRequired': fastingRequired,
//       'homeCollectionAvailable': homeCollectionAvailable,
//       'reportIn24Hrs': reportIn24Hrs,
//       'description': description,
//       'category': category,
//       'image': image,
//       'createdAt': createdAt,
//       'updatedAt': updatedAt,
//     };
//   }
// }

// // Response models for API operations
// class ApiResponse<T> {
//   final bool success;
//   final String message;
//   final T? data;
//   final String? error;

//   ApiResponse({
//     required this.success,
//     required this.message,
//     this.data,
//     this.error,
//   });

//   factory ApiResponse.success(T data, [String message = 'Success']) {
//     return ApiResponse(
//       success: true,
//       message: message,
//       data: data,
//     );
//   }

//   factory ApiResponse.error(String error, [String message = 'Error']) {
//     return ApiResponse(
//       success: false,
//       message: message,
//       error: error,
//     );
//   }
// }





// booking_model.dart
// class BookingResponse {
//   final List<Booking> bookings;

//   BookingResponse({required this.bookings});

//   factory BookingResponse.fromJson(Map<String, dynamic> json) {
//     return BookingResponse(
//       bookings: (json['bookings'] as List<dynamic>)
//           .map((booking) => Booking.fromJson(booking))
//           .toList(),
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'bookings': bookings.map((booking) => booking.toJson()).toList(),
//     };
//   }
// }

// class Booking {
//   final String id;
//   final String staffId;
//   final String familyMemberId;
//   final DiagnosticInfo? diagnosticId;
//   final DoctorInfo? doctorId; // Add this field for doctor consultations
//   final String serviceType;
//   final CartInfo? cartId;
//   final double totalPrice;
//   final String? couponCode;
//   final double discount;
//   final double payableAmount;
//   final String status;
//   final String date;
//   final String timeSlot;
//   final String createdAt;
//   final String updatedAt;

//   // Keep these fields for backward compatibility with diagnostic bookings
//   final String? title;
//   final String? name;
//   final double? price;
//   final String? preparation;
//   final bool? fastingRequired;
//   final bool? homeCollectionAvailable;
//   final bool? reportIn24Hrs;
//   final String? description;
//   final String? category;
//   final String? image;

//   Booking({
//     required this.id,
//     required this.staffId,
//     required this.familyMemberId,
//     this.diagnosticId,
//     this.doctorId, // Add this parameter
//     required this.serviceType,
//     this.cartId,
//     required this.totalPrice,
//     this.couponCode,
//     required this.discount,
//     required this.payableAmount,
//     required this.status,
//     required this.date,
//     required this.timeSlot,
//     required this.createdAt,
//     required this.updatedAt,
//     this.title,
//     this.name,
//     this.price,
//     this.preparation,
//     this.fastingRequired,
//     this.homeCollectionAvailable,
//     this.reportIn24Hrs,
//     this.description,
//     this.category,
//     this.image,
//   });

//   factory Booking.fromJson(Map<String, dynamic> json) {
//     return Booking(
//       id: json['bookingId'] ?? '',
//       staffId: json['staffId'] ?? '',
//       familyMemberId: json['familyMemberId'] ?? '',
//       diagnosticId: json['diagnosticId'] != null 
//           ? DiagnosticInfo.fromJson(json['diagnosticId']) 
//           : null,
//       doctorId: json['doctorId'] != null 
//           ? DoctorInfo.fromJson(json['doctorId']) 
//           : null,
//       serviceType: json['serviceType'] ?? '',
//       cartId: json['cartId'] != null 
//           ? CartInfo.fromJson(json['cartId']) 
//           : null,
//       totalPrice: (json['totalPrice'] ?? 0).toDouble(),
//       couponCode: json['couponCode'],
//       discount: (json['discount'] ?? 0).toDouble(),
//       payableAmount: (json['payableAmount'] ?? 0).toDouble(),
//       status: json['status'] ?? '',
//       date: json['date'] ?? '',
//       timeSlot: json['timeSlot'] ?? '',
//       createdAt: json['createdAt'] ?? '',
//       updatedAt: json['updatedAt'] ?? '',
//       title: json['title'] ?? '',
//       name: json['name'],
//       price: (json['price'] ?? 0).toDouble(),
//       preparation: json['preparation'],
//       fastingRequired: json['fastingRequired'],
//       homeCollectionAvailable: json['homeCollectionAvailable'],
//       reportIn24Hrs: json['reportIn24Hrs'],
//       description: json['description'],
//       category: json['category'],
//       image: json['image'] ?? '',
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'bookingId': id,
//       'staffId': staffId,
//       'familyMemberId': familyMemberId,
//       'diagnosticId': diagnosticId?.toJson(),
//       'doctorId': doctorId?.toJson(),
//       'serviceType': serviceType,
//       'cartId': cartId?.toJson(),
//       'totalPrice': totalPrice,
//       'couponCode': couponCode,
//       'discount': discount,
//       'payableAmount': payableAmount,
//       'status': status,
//       'date': date,
//       'timeSlot': timeSlot,
//       'createdAt': createdAt,
//       'updatedAt': updatedAt,
//       'title': title,
//       'name': name,
//       'price': price,
//       'preparation': preparation,
//       'fastingRequired': fastingRequired,
//       'homeCollectionAvailable': homeCollectionAvailable,
//       'reportIn24Hrs': reportIn24Hrs,
//       'description': description,
//       'category': category,
//       'image': image,
//     };
//   }

//   // Helper method to get formatted date
//   String get formattedDate {
//     try {
//       DateTime parsedDate = DateTime.parse(date);
//       return "${parsedDate.day}-${parsedDate.month.toString().padLeft(2, '0')}-${parsedDate.year}";
//     } catch (e) {
//       return date; // Return original if parsing fails
//     }
//   }

//   // Helper method to get status color
//   String get statusColor {
//     switch (status.toLowerCase()) {
//       case 'completed':
//         return 'blue';
//       case 'confirmed':
//       case 'ongoing':
//         return 'green';
//       case 'cancelled':
//         return 'red';
//       default:
//         return 'grey';
//     }
//   }

//   // Helper method to get primary service name
//   String get primaryServiceName {
//     // For doctor consultations, return doctor's name
//     if (doctorId != null) {
//       return doctorId!.name;
//     }
//     // For diagnostic bookings, return from cart or diagnostic info
//     if (cartId != null && cartId!.items.isNotEmpty) {
//       return cartId!.items.first.title;
//     }
//     if (diagnosticId != null) {
//       return diagnosticId!.name;
//     }
//     return 'Unknown Service';
//   }

//   // Helper method to get doctor name
//   String get doctorName {
//     return doctorId?.name ?? name ?? 'Unknown Doctor';
//   }

//   // Helper method to get doctor qualification
//   String get doctorQualification {
//     return doctorId?.qualification ?? description ?? 'Not specified';
//   }

//   // Helper method to get doctor specialization
//   String get doctorSpecialization {
//     return doctorId?.specialization ?? 'Not specified';
//   }
// }

// // Add DoctorInfo class
// class DoctorInfo {
//   final String id;
//   final String name;
//   final String specialization;
//   final String qualification;
//   final String address;

//   DoctorInfo({
//     required this.id,
//     required this.name,
//     required this.specialization,
//     required this.qualification,
//     required this.address,
//   });

//   factory DoctorInfo.fromJson(Map<String, dynamic> json) {
//     return DoctorInfo(
//       id: json['_id'] ?? '',
//       name: json['name'] ?? '',
//       specialization: json['specialization'] ?? '',
//       qualification: json['qualification'] ?? '',
//       address: json['address'] ?? '',
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       '_id': id,
//       'name': name,
//       'specialization': specialization,
//       'qualification': qualification,
//       'address': address,
//     };
//   }
// }

// class DiagnosticInfo {
//   final String id;
//   final String name;
//   final String distance;
//   final String image;

//   DiagnosticInfo({
//     required this.id,
//     required this.name,
//     required this.distance,
//     required this.image,
//   });

//   factory DiagnosticInfo.fromJson(Map<String, dynamic> json) {
//     return DiagnosticInfo(
//       id: json['_id'] ?? '',
//       name: json['name'] ?? '',
//       distance: json['distance'] ?? '',
//       image: json['image'] ?? '',
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       '_id': id,
//       'name': name,
//       'distance': distance,
//       'image': image,
//     };
//   }
// }

// class CartInfo {
//   final String id;
//   final String userId;
//   final List<CartItem> items;
//   final String createdAt;
//   final String updatedAt;

//   CartInfo({
//     required this.id,
//     required this.userId,
//     required this.items,
//     required this.createdAt,
//     required this.updatedAt,
//   });

//   factory CartInfo.fromJson(Map<String, dynamic> json) {
//     return CartInfo(
//       id: json['_id'] ?? '',
//       userId: json['userId'] ?? '',
//       items: (json['items'] as List<dynamic>? ?? [])
//           .map((item) => CartItem.fromJson(item))
//           .toList(),
//       createdAt: json['createdAt'] ?? '',
//       updatedAt: json['updatedAt'] ?? '',
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       '_id': id,
//       'userId': userId,
//       'items': items.map((item) => item.toJson()).toList(),
//       'createdAt': createdAt,
//       'updatedAt': updatedAt,
//     };
//   }
// }

// class CartItem {
//   final String itemId;
//   final String type;
//   final String title;
//   final int quantity;
//   final double price;
//   final double offerPrice;
//   final double totalPayable;
//   final double totalPrice;
//   final String id;
//   final ItemDetails itemDetails;

//   CartItem({
//     required this.itemId,
//     required this.type,
//     required this.title,
//     required this.quantity,
//     required this.price,
//     required this.offerPrice,
//     required this.totalPayable,
//     required this.totalPrice,
//     required this.id,
//     required this.itemDetails,
//   });

//   factory CartItem.fromJson(Map<String, dynamic> json) {
//     return CartItem(
//       itemId: json['itemId'] ?? '',
//       type: json['type'] ?? '',
//       title: json['title'] ?? '',
//       quantity: json['quantity'] ?? 0,
//       price: (json['price'] ?? 0).toDouble(),
//       offerPrice: (json['offerPrice'] ?? 0).toDouble(),
//       totalPayable: (json['totalPayable'] ?? 0).toDouble(),
//       totalPrice: (json['totalPrice'] ?? 0).toDouble(),
//       id: json['_id'] ?? '',
//       itemDetails: ItemDetails.fromJson(json['itemDetails'] ?? {}),
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'itemId': itemId,
//       'type': type,
//       'title': title,
//       'quantity': quantity,
//       'price': price,
//       'offerPrice': offerPrice,
//       'totalPayable': totalPayable,
//       'totalPrice': totalPrice,
//       '_id': id,
//       'itemDetails': itemDetails.toJson(),
//     };
//   }
// }

// class ItemDetails {
//   final String id;
//   final String title;
//   final String? name;
//   final double price;
//   final String? preparation;
//   final bool? fastingRequired;
//   final bool? homeCollectionAvailable;
//   final bool? reportIn24Hrs;
//   final String? description;
//   final String? category;
//   final String image;
//   final String createdAt;
//   final String updatedAt;

//   ItemDetails({
//     required this.id,
//     required this.title,
//     this.name,
//     required this.price,
//     this.preparation,
//     this.fastingRequired,
//     this.homeCollectionAvailable,
//     this.reportIn24Hrs,
//     this.description,
//     this.category,
//     required this.image,
//     required this.createdAt,
//     required this.updatedAt,
//   });

//   factory ItemDetails.fromJson(Map<String, dynamic> json) {
//     return ItemDetails(
//       id: json['_id'] ?? '',
//       title: json['title'] ?? json['name'] ?? '',
//       name: json['name'],
//       price: (json['price'] ?? 0).toDouble(),
//       preparation: json['preparation'],
//       fastingRequired: json['fastingRequired'],
//       homeCollectionAvailable: json['homeCollectionAvailable'],
//       reportIn24Hrs: json['reportIn24Hrs'],
//       description: json['description'],
//       category: json['category'],
//       image: json['image'] ?? '',
//       createdAt: json['createdAt'] ?? '',
//       updatedAt: json['updatedAt'] ?? '',
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       '_id': id,
//       'title': title,
//       'name': name,
//       'price': price,
//       'preparation': preparation,
//       'fastingRequired': fastingRequired,
//       'homeCollectionAvailable': homeCollectionAvailable,
//       'reportIn24Hrs': reportIn24Hrs,
//       'description': description,
//       'category': category,
//       'image': image,
//       'createdAt': createdAt,
//       'updatedAt': updatedAt,
//     };
//   }
// }

// // Response models for API operations
// class ApiResponse<T> {
//   final bool success;
//   final String message;
//   final T? data;
//   final String? error;

//   ApiResponse({
//     required this.success,
//     required this.message,
//     this.data,
//     this.error,
//   });

//   factory ApiResponse.success(T data, [String message = 'Success']) {
//     return ApiResponse(
//       success: true,
//       message: message,
//       data: data,
//     );
//   }

//   factory ApiResponse.error(String error, [String message = 'Error']) {
//     return ApiResponse(
//       success: false,
//       message: message,
//       error: error,
//     );
//   }
// }













class BookingResponse {
  final List<Booking> bookings;

  BookingResponse({required this.bookings});

  factory BookingResponse.fromJson(Map<String, dynamic> json) {
    return BookingResponse(
      bookings: (json['bookings'] as List<dynamic>)
          .map((booking) => Booking.fromJson(booking))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'bookings': bookings.map((booking) => booking.toJson()).toList(),
    };
  }
}

class Booking {
  final String id;
  final String staffId;
  final String familyMemberId;
  final DiagnosticInfo? diagnosticId;
  final DoctorInfo? doctorId;
  final String serviceType;
  final String? meetingLink;
  final String type;
  final CartInfo? cartId;
  final bool isBooked;
  final double totalPrice;
  final String? couponCode;
  final double discount;
  final double payableAmount;
  final String status;
  final String date;
  final String timeSlot;
  final String createdAt;
  final String updatedAt;
  final int version;
  final FamilyMember? familyMember;
  final String? reportFile;
  final String? diagPrescription;
  final List<dynamic> doctorReports;
  final List<dynamic> doctorPrescriptions;
  final List<dynamic> doctorReportsAlternate; 
  final List<dynamic> doctorPrescriptionsAlternate;

  // Keep these fields for backward compatibility with diagnostic bookings
  final String? title;
  final String? name;
  final double? price;
  final String? preparation;
  final bool? fastingRequired;
  final bool? homeCollectionAvailable;
  final bool? reportIn24Hrs;
  final String? description;
  final String? category;
  final String? image;

  Booking({
    required this.id,
    required this.staffId,
    required this.familyMemberId,
    this.diagnosticId,
    this.doctorId,
    required this.serviceType,
    required this.type,
    required this.meetingLink,

    this.cartId,
    required this.isBooked,
    required this.totalPrice,
    this.couponCode,
    required this.discount,
    required this.payableAmount,
    required this.status,
    required this.date,
    required this.timeSlot,
    required this.createdAt,
    required this.updatedAt,
    required this.version,
    this.familyMember,
    this.reportFile,
    this.diagPrescription,
    required this.doctorReports,
    required this.doctorPrescriptions,
    required this.doctorReportsAlternate,
    required this.doctorPrescriptionsAlternate,
    this.title,
    this.name,
    this.price,
    this.preparation,
    this.fastingRequired,
    this.homeCollectionAvailable,
    this.reportIn24Hrs,
    this.description,
    this.category,
    this.image,
  });

  factory Booking.fromJson(Map<String, dynamic> json) {
    return Booking(
      id: json['_id'] ?? json['bookingId'] ?? '',
      staffId: json['staffId'] ?? '',
      familyMemberId: json['familyMemberId'] ?? '',
      diagnosticId: json['diagnosticId'] != null 
          ? DiagnosticInfo.fromJson(json['diagnosticId']) 
          : null,
      doctorId: json['doctorId'] != null 
          ? DoctorInfo.fromJson(json['doctorId']) 
          : null,
      serviceType: json['serviceType'] ?? '',
      meetingLink: json['meetingLink'],

      type: json['type'] ?? '',
      cartId: json['cartId'] != null 
          ? CartInfo.fromJson(json['cartId']) 
          : null,
      isBooked: json['isBooked'] ?? false,
      totalPrice: (json['totalPrice'] ?? 0).toDouble(),
      couponCode: json['couponCode'],
      discount: (json['discount'] ?? 0).toDouble(),
      payableAmount: (json['payableAmount'] ?? 0).toDouble(),
      status: json['status'] ?? '',
      date: json['date'] ?? '',
      timeSlot: json['timeSlot'] ?? '',
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
      version: json['__v'] ?? 0,
      familyMember: json['familyMember'] != null 
          ? FamilyMember.fromJson(json['familyMember']) 
          : null,
      reportFile: json['report_file'] ?? json['reportFile'],
      diagPrescription: json['diagPrescription'],
      doctorReports: json['doctorReports'] ?? [],
      doctorPrescriptions: json['doctorPrescriptions'] ?? [],
      doctorReportsAlternate: json['doctor_reports'] ?? [],
      doctorPrescriptionsAlternate: json['doctor_prescriptions'] ?? [],
      title: json['title'] ?? '',
      name: json['name'],
      price: json['price']?.toDouble(),
      preparation: json['preparation'],
      fastingRequired: json['fastingRequired'],
      homeCollectionAvailable: json['homeCollectionAvailable'],
      reportIn24Hrs: json['reportIn24Hrs'],
      description: json['description'],
      category: json['category'],
      image: json['image'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'bookingId': id,
      'staffId': staffId,
      'familyMemberId': familyMemberId,
      'diagnosticId': diagnosticId?.toJson(),
      'doctorId': doctorId?.toJson(),
      'serviceType': serviceType,
      'type': type,
      'meetingLink': meetingLink,

      'cartId': cartId?.toJson(),
      'isBooked': isBooked,
      'totalPrice': totalPrice,
      'couponCode': couponCode,
      'discount': discount,
      'payableAmount': payableAmount,
      'status': status,
      'date': date,
      'timeSlot': timeSlot,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      '__v': version,
      'familyMember': familyMember?.toJson(),
      'report_file': reportFile,
      'reportFile': reportFile,
      'diagPrescription': diagPrescription,
      'doctorReports': doctorReports,
      'doctorPrescriptions': doctorPrescriptions,
      'doctor_reports': doctorReportsAlternate,
      'doctor_prescriptions': doctorPrescriptionsAlternate,
      'title': title,
      'name': name,
      'price': price,
      'preparation': preparation,
      'fastingRequired': fastingRequired,
      'homeCollectionAvailable': homeCollectionAvailable,
      'reportIn24Hrs': reportIn24Hrs,
      'description': description,
      'category': category,
      'image': image,
    };
  }

  // Helper method to get formatted date
  String get formattedDate {
    try {
      DateTime parsedDate = DateTime.parse(date);
      return "${parsedDate.day}-${parsedDate.month.toString().padLeft(2, '0')}-${parsedDate.year}";
    } catch (e) {
      return date; // Return original if parsing fails
    }
  }

  // Helper method to get status color
  String get statusColor {
    switch (status.toLowerCase()) {
      case 'completed':
        return 'blue';
      case 'confirmed':
      case 'ongoing':
        return 'green';
      case 'cancelled':
        return 'red';
      default:
        return 'grey';
    }
  }

  // Helper method to get primary service name
  String get primaryServiceName {
    // For doctor consultations, return doctor's name
    if (doctorId != null) {
      return doctorId!.name;
    }
    // For diagnostic bookings, return from cart or diagnostic info
    if (cartId != null && cartId!.items.isNotEmpty) {
      return cartId!.items.first.title;
    }
    if (diagnosticId != null) {
      return diagnosticId!.name;
    }
    return 'Unknown Service';
  }

  // Helper method to get doctor name
  String get doctorName {
    return doctorId?.name ?? name ?? 'Unknown Doctor';
  }

  // Helper method to get doctor qualification
  String get doctorQualification {
    return doctorId?.qualification ?? description ?? 'Not specified';
  }

  // Helper method to get doctor specialization
  String get doctorSpecialization {
    return doctorId?.specialization ?? 'Not specified';
  }
}

// Add FamilyMember class
class FamilyMember {
  final String id;
  final String fullName;
  final String mobileNumber;
  final int age;
  final String gender;
  final String dob;
  final int height;
  final int weight;
  final String relation;

  FamilyMember({
    required this.id,
    required this.fullName,
    required this.mobileNumber,
    required this.age,
    required this.gender,
    required this.dob,
    required this.height,
    required this.weight,
    required this.relation,
  });

  factory FamilyMember.fromJson(Map<String, dynamic> json) {
    return FamilyMember(
      id: json['_id'] ?? '',
      fullName: json['fullName'] ?? '',
      mobileNumber: json['mobileNumber'] ?? '',
      age: json['age'] ?? 0,
      gender: json['gender'] ?? '',
      dob: json['DOB'] ?? '',
      height: json['height'] ?? 0,
      weight: json['weight'] ?? 0,
      relation: json['relation'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'fullName': fullName,
      'mobileNumber': mobileNumber,
      'age': age,
      'gender': gender,
      'DOB': dob,
      'height': height,
      'weight': weight,
      'relation': relation,
    };
  }
}

// Add DoctorInfo class
class DoctorInfo {
  final String id;
  final String name;
  final String specialization;
  final String qualification;
  final String address;

  DoctorInfo({
    required this.id,
    required this.name,
    required this.specialization,
    required this.qualification,
    required this.address,
  });

  factory DoctorInfo.fromJson(Map<String, dynamic> json) {
    return DoctorInfo(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      specialization: json['specialization'] ?? '',
      qualification: json['qualification'] ?? '',
      address: json['address'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'specialization': specialization,
      'qualification': qualification,
      'address': address,
    };
  }
}

class DiagnosticInfo {
  final String id;
  final String name;
  final String distance;
  final String image;

  DiagnosticInfo({
    required this.id,
    required this.name,
    required this.distance,
    required this.image,
  });

  factory DiagnosticInfo.fromJson(Map<String, dynamic> json) {
    return DiagnosticInfo(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      distance: json['distance'] ?? '',
      image: json['image'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'distance': distance,
      'image': image,
    };
  }
}

class CartInfo {
  final String id;
  final String userId;
  final List<CartItem> items;
  final String createdAt;
  final String updatedAt;
  final int version;

  CartInfo({
    required this.id,
    required this.userId,
    required this.items,
    required this.createdAt,
    required this.updatedAt,
    required this.version,
  });

  factory CartInfo.fromJson(Map<String, dynamic> json) {
    return CartInfo(
      id: json['_id'] ?? '',
      userId: json['userId'] ?? '',
      items: (json['items'] as List<dynamic>? ?? [])
          .map((item) => CartItem.fromJson(item))
          .toList(),
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
      version: json['__v'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'userId': userId,
      'items': items.map((item) => item.toJson()).toList(),
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      '__v': version,
    };
  }
}

class CartItem {
  final String itemId;
  final String type;
  final String title;
  final int quantity;
  final double? price;
  final double offerPrice;
  final double totalPayable;
  final double totalPrice;
  final String id;
  final ItemDetails itemDetails;

  CartItem({
    required this.itemId,
    required this.type,
    required this.title,
    required this.quantity,
    this.price,
    required this.offerPrice,
    required this.totalPayable,
    required this.totalPrice,
    required this.id,
    required this.itemDetails,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      itemId: json['itemId'] ?? '',
      type: json['type'] ?? '',
      title: json['title'] ?? '',
      quantity: json['quantity'] ?? 0,
      price: json['price']?.toDouble(),
      offerPrice: (json['offerPrice'] ?? 0).toDouble(),
      totalPayable: (json['totalPayable'] ?? 0).toDouble(),
      totalPrice: (json['totalPrice'] ?? 0).toDouble(),
      id: json['_id'] ?? '',
      itemDetails: ItemDetails.fromJson(json['itemDetails'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'itemId': itemId,
      'type': type,
      'title': title,
      'quantity': quantity,
      'price': price,
      'offerPrice': offerPrice,
      'totalPayable': totalPayable,
      'totalPrice': totalPrice,
      '_id': id,
      'itemDetails': itemDetails.toJson(),
    };
  }
}

class ItemDetails {
  final String id;
  final String title;
  final String? name;
  final double? price;
  final String? preparation;
  final bool? fastingRequired;
  final bool? homeCollectionAvailable;
  final bool? reportIn24Hrs;
  final String? description;
  final String? category;
  final String image;
  final String createdAt;
  final String updatedAt;
  final int version;

  ItemDetails({
    required this.id,
    required this.title,
    this.name,
    this.price,
    this.preparation,
    this.fastingRequired,
    this.homeCollectionAvailable,
    this.reportIn24Hrs,
    this.description,
    this.category,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
    required this.version,
  });

  factory ItemDetails.fromJson(Map<String, dynamic> json) {
    return ItemDetails(
      id: json['_id'] ?? '',
      title: json['title'] ?? json['name'] ?? '',
      name: json['name'],
      price: json['price']?.toDouble(),
      preparation: json['preparation'],
      fastingRequired: json['fastingRequired'],
      homeCollectionAvailable: json['homeCollectionAvailable'],
      reportIn24Hrs: json['reportIn24Hrs'],
      description: json['description'],
      category: json['category'],
      image: json['image'] ?? '',
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
      version: json['__v'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'title': title,
      'name': name,
      'price': price,
      'preparation': preparation,
      'fastingRequired': fastingRequired,
      'homeCollectionAvailable': homeCollectionAvailable,
      'reportIn24Hrs': reportIn24Hrs,
      'description': description,
      'category': category,
      'image': image,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      '__v': version,
    };
  }
}

// Response models for API operations
class ApiResponse<T> {
  final bool success;
  final String message;
  final T? data;
  final String? error;

  ApiResponse({
    required this.success,
    required this.message,
    this.data,
    this.error,
  });

  factory ApiResponse.success(T data, [String message = 'Success']) {
    return ApiResponse(
      success: true,
      message: message,
      data: data,
    );
  }

  factory ApiResponse.error(String error, [String message = 'Error']) {
    return ApiResponse(
      success: false,
      message: message,
      error: error,
    );
  }

  factory ApiResponse.fromJson(Map<String, dynamic> json, T Function(Map<String, dynamic>) fromJsonT) {
    return ApiResponse(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
      data: json['booking'] != null ? fromJsonT(json['booking']) : null,
      error: json['error'],
    );
  }

  Map<String, dynamic> toJson(Map<String, dynamic> Function(T) toJsonT) {
    return {
      'success': success,
      'message': message,
      'booking': data != null ? toJsonT(data as T) : null,
      'error': error,
    };
  }
}