class HraQuestion {
  final String id;
  final String hraCategoryId;
  final String question;
  final String hraCategoryName;
  final List<String> options;
  final DateTime createdAt;
  final DateTime updatedAt;

  HraQuestion({
    required this.id,
    required this.hraCategoryId,
    required this.question,
    required this.hraCategoryName,
    required this.options,
    required this.createdAt,
    required this.updatedAt,
  });

  factory HraQuestion.fromJson(Map<String, dynamic> json) {
    return HraQuestion(
      id: json['_id'] ?? '',
      hraCategoryId: json['hraCategoryId'] ?? '',
      question: json['question'] ?? '',
      hraCategoryName: json['hraCategoryName'] ?? '',
      options: List<String>.from(json['options'] ?? []),
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'hraCategoryId': hraCategoryId,
      'question': question,
      'hraCategoryName': hraCategoryName,
      'options': options,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}

class HraQuestionsResponse {
  final String message;
  final List<HraQuestion> hraQuestions;

  HraQuestionsResponse({
    required this.message,
    required this.hraQuestions,
  });

  factory HraQuestionsResponse.fromJson(Map<String, dynamic> json) {
    return HraQuestionsResponse(
      message: json['message'] ?? '',
      hraQuestions: (json['hraQuestions'] as List<dynamic>?)
              ?.map((item) => HraQuestion.fromJson(item))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'hraQuestions': hraQuestions.map((q) => q.toJson()).toList(),
    };
  }
}
