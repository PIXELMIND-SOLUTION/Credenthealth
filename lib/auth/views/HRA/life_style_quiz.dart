
import 'package:consultation_app/auth/views/HRA/life_style_quiz2.dart';
import 'package:consultation_app/auth/views/HRA/life_style_screen.dart';
import 'package:consultation_app/auth/views/HRA/result_screen.dart';
import 'package:consultation_app/auth/views/provider/hra_questions_provider.dart';
import 'package:consultation_app/auth/views/provider/hra_answer_provider.dart'; // Add this import
import 'package:consultation_app/model/hra_question_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LifeStyleQuiz extends StatefulWidget {
  final String? selectedHraId;
  final String? id;
  final List<dynamic>? hraList;
  final String? points;
  final String?text;
  final Set<String>? completedCategories;

  const LifeStyleQuiz({
    super.key,
    this.id,
    this.hraList,
    this.selectedHraId,
    this.completedCategories,
    this.points,
    this.text
  });

  @override
  State<LifeStyleQuiz> createState() => _LifeStyleQuizState();
}

class _LifeStyleQuizState extends State<LifeStyleQuiz> {
  String? selectedAnswer;
  bool isDropdownOpen = false;
  String selectedHraName = 'All';
  late Set<String> completedCategories;

  @override
  void initState() {
    super.initState();

    // Initialize completed categories set
    completedCategories = widget.completedCategories ?? <String>{};

    if (widget.id != null) {
      selectedHraName = widget.id!;
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<HraQuestionsProvider>(context, listen: false)
          .fetchHraQuestions(
              categoryName: selectedHraName == 'All' ? null : selectedHraName);
    });
  }

  // Method to find the next uncompleted category
  String? getNextUncompletedCategory() {
    if (widget.hraList == null || widget.hraList!.isEmpty) return null;

    // Find the next uncompleted category
    for (var hra in widget.hraList!) {
      String categoryName = hra.hraName ?? '';
      if (!completedCategories.contains(categoryName)) {
        return categoryName;
      }
    }

    return null; // All categories completed
  }

  // Method to check if all categories are completed
  bool areAllCategoriesCompleted() {
    if (widget.hraList == null || widget.hraList!.isEmpty) return true;

    for (var hra in widget.hraList!) {
      String categoryName = hra.hraName ?? '';
      if (!completedCategories.contains(categoryName)) {
        return false;
      }
    }

    return true;
  }

  // Method to get completion status text
  String getCompletionStatusText() {
    if (widget.hraList == null || widget.hraList!.isEmpty) return '';

    int totalCategories = widget.hraList!.length;
    int completedCount = completedCategories.length;

    return '$completedCount of $totalCategories completed';
  }

  // Method to handle quiz completion with integrated provider
  void handleQuizCompletion() async {
    final hraProvider =
        Provider.of<HraQuestionsProvider>(context, listen: false);
    final hraAnswerProvider =
        Provider.of<HraAnswerProvider>(context, listen: false);

    // Save all answers from current category to HraAnswerProvider
    Map<String, String> categoryAnswers = {};
    hraProvider.answers.forEach((questionId, answer) {
      categoryAnswers[questionId] = answer;
    });

    // Save category answers
    hraAnswerProvider.saveCategoryAnswers(selectedHraName, categoryAnswers);

    // Mark current category as completed
    completedCategories.add(selectedHraName);

    // Check if all categories are completed
    if (areAllCategoriesCompleted()) {
      // All categories completed, submit all answers and then navigate to results
      await _submitAllAnswersAndNavigate();
    } else {
      // Find next uncompleted category
      final nextCategory = getNextUncompletedCategory();

      if (nextCategory != null) {
        // Navigate to next uncompleted category quiz
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => LifeStyleQuiz(
              id: nextCategory,
              hraList: widget.hraList,
              selectedHraId: widget.selectedHraId,
              completedCategories: completedCategories,
            ),
          ),
        );
      } else {
        // Fallback: submit and navigate to results if no uncompleted category found
        await _submitAllAnswersAndNavigate();
      }
    }
  }

  // Method to submit all answers and navigate to result screen
  // Future<void> _submitAllAnswersAndNavigate() async {
  //   final hraAnswerProvider =
  //       Provider.of<HraAnswerProvider>(context, listen: false);

  //   // Show loading dialog
  //   showDialog(
  //     context: context,
  //     barrierDismissible: false,
  //     builder: (context) => const Center(
  //       child: CircularProgressIndicator(),
  //     ),
  //   );

  //   try {
  //     // Submit all answers
  //     final success = await hraAnswerProvider.submitAllAnswers();

  //     // Close loading dialog
  //     Navigator.of(context).pop();

  //     if (success) {
  //       final resultData = await hraAnswerProvider.submitAllAnswers();
  //       // Navigate to results screen
  //       Navigator.pushAndRemoveUntil(
  //         context,
  //         MaterialPageRoute(builder: (context) => const ResultScreen()),
  //         (Route<dynamic> route) => false,
  //       );
  //     } else {
  //       // Show error dialog
  //       _showErrorDialog(
  //         'Submission Failed',
  //         hraAnswerProvider.submissionError ??
  //             'Failed to submit answers. Please try again.',
  //       );
  //     }
  //   } catch (e) {
  //     // Close loading dialog
  //     Navigator.of(context).pop();

  //     // Show error dialog
  //     _showErrorDialog(
  //       'Error',
  //       'An unexpected error occurred: $e',
  //     );
  //   }
  // }



  // Method to submit all answers and navigate to result screen
Future<void> _submitAllAnswersAndNavigate() async {
  final hraAnswerProvider = Provider.of<HraAnswerProvider>(context, listen: false);

  // Show loading dialog
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => const Center(
      child: CircularProgressIndicator(),
    ),
  );

  try {
    // Submit all answers and get the result data
    final resultData = await hraAnswerProvider.submitAllAnswers();

    // Close loading dialog
    Navigator.of(context).pop();

    if (resultData != null) {
      // Navigate to results screen with the returned data
      // Navigator.pushAndRemoveUntil(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => ResultScreen(
      //       totalPoints: resultData['point'] ?? 0,
      //       riskLevel: resultData['riskLevel'] ?? 'Moderate',
      //       riskMessage: resultData['text'] ?? 'Assessment completed successfully.',
      //     ),
      //   ),
      //   (Route<dynamic> route) => false,
      // );
       Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => ResultScreen(
            totalPoints: resultData['totalPoints'],
            riskLevel: resultData['riskLevel'],
            riskMessage: resultData['riskMessage'],
          ),
        ),
        (Route<dynamic> route) => false,
      );
    } else {
      // Show error dialog
      _showErrorDialog(
        'Submission Failed',
        hraAnswerProvider.submissionError ?? 'Failed to submit answers. Please try again.',
      );
    }
  } catch (e) {
    // Close loading dialog
    Navigator.of(context).pop();

    // Show error dialog
    _showErrorDialog(
      'Error',
      'An unexpected error occurred: $e',
    );
  }
}

  // Method to show error dialog
  void _showErrorDialog(String title, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              // Retry submission
              _submitAllAnswersAndNavigate();
            },
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'HRA',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Consumer2<HraQuestionsProvider, HraAnswerProvider>(
          builder: (context, hraProvider, hraAnswerProvider, child) {
            if (hraProvider.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (hraProvider.error != null) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Icon(
                    //   Icons.error_outline,
                    //   size: 64,
                    //   color: Colors.red[300],
                    // ),
                    const SizedBox(height: 300),
                    Text(
                      'No Hra Questions added',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 8),
                    // Text(
                    //   hraProvider.error!,
                    //   textAlign: TextAlign.center,
                    //   style: TextStyle(
                    //     fontSize: 14,
                    //     color: Colors.red[600],
                    //   ),
                    // ),
                    const SizedBox(height: 16),
                    // ElevatedButton(
                    //   onPressed: () {
                    //     hraProvider.fetchHraQuestions(
                    //       categoryName:
                    //           selectedHraName == 'All' ? null : selectedHraName,
                    //     );
                    //   },
                    //   child: const Text('Retry'),
                    // ),
                  ],
                ),
              );
            }

            if (hraProvider.hraQuestions.isEmpty) {
              return const Center(
                child: Text(
                  'No questions available',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
              );
            }

            final currentQuestion = hraProvider.currentQuestion;
            if (currentQuestion == null) {
              return const Center(
                child: Text('No current question available'),
              );
            }

            // Get the saved answer for the current question
            final savedAnswer = hraProvider.getAnswer(currentQuestion.id);
            if (savedAnswer != null && selectedAnswer != savedAnswer) {
              selectedAnswer = savedAnswer;
            }

            return Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 10),

                      // Title with category completion status
                      Column(
                        children: [
                          Text(
                            selectedHraName,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          if (widget.hraList != null &&
                              widget.hraList!.isNotEmpty)
                            Column(
                              children: [
                                Text(
                                  getCompletionStatusText(),
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey[600],
                                  ),
                                ),
                                const SizedBox(height: 5),
                                // Overall progress bar
                                LinearProgressIndicator(
                                  value: widget.hraList!.isNotEmpty
                                      ? completedCategories.length /
                                          widget.hraList!.length
                                      : 0,
                                  backgroundColor: Colors.grey[200],
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.green),
                                ),
                              ],
                            ),
                        ],
                      ),
                      const SizedBox(height: 20),

                      // Dropdown Button
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isDropdownOpen = !isDropdownOpen;
                          });
                        },
                        child: Container(
                          width: 100,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 8),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey[300]!),
                            borderRadius: BorderRadius.circular(8),
                            color:
                                isDropdownOpen ? Colors.grey[50] : Colors.white,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'All',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(width: 20),
                              Icon(
                                isDropdownOpen
                                    ? Icons.keyboard_arrow_up
                                    : Icons.keyboard_arrow_down,
                                color: Colors.black,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 25),

                      // Current category progress indicator
                      LinearProgressIndicator(
                        value: hraProvider.progressPercentage,
                        backgroundColor: Colors.grey[200],
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Question ${hraProvider.currentQuestionIndex + 1} of ${hraProvider.hraQuestions.length}',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                      const SizedBox(height: 15),

                      // Question Card
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          border: Border.all(),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              spreadRadius: 1,
                              blurRadius: 10,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Question
                            Text(
                              '${hraProvider.currentQuestionIndex + 1}. ${currentQuestion.question}',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                                height: 1.4,
                              ),
                            ),
                            const SizedBox(height: 20),

                            // Answer Options
                            ...currentQuestion.options.map((option) {
                              return Column(
                                children: [
                                  _buildRadioOption(option, currentQuestion.id),
                                  const SizedBox(height: 12),
                                ],
                              );
                            }).toList(),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),

                      // Navigation Buttons
                      Row(
                        children: [
                          // Previous Button
                          if (hraProvider.currentQuestionIndex > 0)
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  hraProvider.goToPreviousQuestion();
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.grey[200],
                                  foregroundColor: Colors.black,
                                  elevation: 0,
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 12),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.chevron_left,
                                      size: 20,
                                    ),
                                    SizedBox(width: 4),
                                    Text(
                                      'Previous',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                          if (hraProvider.currentQuestionIndex > 0)
                            const SizedBox(width: 12),

                          // Next Button
                          Expanded(
                            child: ElevatedButton(
                              onPressed: selectedAnswer != null
                                  ? () {
                                      if (hraProvider.hasMoreQuestions) {
                                        hraProvider.goToNextQuestion();
                                        setState(() {
                                          selectedAnswer =
                                              null; // Reset for next question
                                        });
                                      } else {
                                        // Quiz completed - handle auto-navigation with submission
                                        handleQuizCompletion();
                                      }
                                    }
                                  : null,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: selectedAnswer != null
                                    ? Colors.blue
                                    : Colors.grey[300],
                                foregroundColor: selectedAnswer != null
                                    ? Colors.white
                                    : Colors.grey[600],
                                elevation: 0,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 12),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: hraAnswerProvider.isSubmitting
                                  ? const SizedBox(
                                      width: 20,
                                      height: 20,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                                Colors.white),
                                      ),
                                    )
                                  : Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          hraProvider.hasMoreQuestions
                                              ? 'Next'
                                              : _getButtonText(),
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        const SizedBox(width: 4),
                                        Icon(
                                          hraProvider.hasMoreQuestions
                                              ? Icons.chevron_right
                                              : _getButtonIcon(),
                                          size: 20,
                                        ),
                                      ],
                                    ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // Dropdown Overlay
                if (isDropdownOpen &&
                    widget.hraList != null &&
                    widget.hraList!.isNotEmpty)
                  Positioned(
                    top: 140,
                    left: 20,
                    right: 20,
                    child: Container(
                      constraints: const BoxConstraints(maxHeight: 400),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                        border: Border.all(color: Colors.grey[300]!),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: ListView.separated(
                          shrinkWrap: true,
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          itemCount: widget.hraList!.length,
                          separatorBuilder: (context, index) =>
                              const Divider(height: 1),
                          itemBuilder: (context, index) {
                            final hra = widget.hraList![index];
                            final hraName = hra.hraName ?? 'Unknown HRA';
                            final isCompleted =
                                completedCategories.contains(hraName);

                            return ListTile(
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 4),
                              leading: CircleAvatar(
                                backgroundColor: Colors.grey[100],
                                radius: 16,
                                child: hra.hraImage != null &&
                                        hra.hraImage.isNotEmpty
                                    ? ClipOval(
                                        child: Image.network(
                                          'http://194.164.148.244:4051${hra.hraImage}',
                                          width: 32,
                                          height: 32,
                                          fit: BoxFit.cover,
                                          errorBuilder:
                                              (context, error, stackTrace) {
                                            return Icon(
                                              Icons
                                                  .image_not_supported_outlined,
                                              color: Colors.grey[500],
                                              size: 16,
                                            );
                                          },
                                        ),
                                      )
                                    : Icon(
                                        Icons.image_outlined,
                                        color: Colors.grey[500],
                                        size: 16,
                                      ),
                              ),
                              title: Text(
                                hraName,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: selectedHraName == hraName
                                      ? FontWeight.w600
                                      : FontWeight.normal,
                                  color: selectedHraName == hraName
                                      ? Colors.blue
                                      : (isCompleted
                                          ? Colors.green[700]
                                          : Colors.black),
                                ),
                              ),
                              trailing: selectedHraName == hraName
                                  ? Icon(
                                      Icons.check_circle,
                                      color: Colors.blue,
                                      size: 20,
                                    )
                                  : (isCompleted
                                      ? Icon(
                                          Icons.check_circle,
                                          color: Colors.green[700],
                                          size: 20,
                                        )
                                      : null),
                              onTap: () {
                                setState(() {
                                  selectedHraName = hraName;
                                  isDropdownOpen = false;
                                });

                                // Fetch questions for the selected category
                                hraProvider.setSelectedCategory(hraName);
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  ),

                // Transparent overlay to close dropdown when tapped outside
                if (isDropdownOpen)
                  Positioned.fill(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isDropdownOpen = false;
                        });

                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LifeStyleQuiz(
                              id: widget.id,
                              hraList: widget.hraList,
                              selectedHraId: widget.selectedHraId,
                              completedCategories: completedCategories,
                              points: widget.points,
                              text: widget.text,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        color: Colors.transparent,
                      ),
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }

  // Helper method to get button text based on completion status
  String _getButtonText() {
    // Will include current category after completion
    Set<String> willBeCompleted = Set.from(completedCategories)
      ..add(selectedHraName);

    if (widget.hraList != null && widget.hraList!.isNotEmpty) {
      bool allWillBeCompleted = widget.hraList!
          .every((hra) => willBeCompleted.contains(hra.hraName ?? ''));

      if (allWillBeCompleted) {
        return 'Complete All';
      } else {
        return 'Next Category';
      }
    }

    return 'Complete';
  }

  // Helper method to get button icon based on completion status
  IconData _getButtonIcon() {
    // Will include current category after completion
    Set<String> willBeCompleted = Set.from(completedCategories)
      ..add(selectedHraName);

    if (widget.hraList != null && widget.hraList!.isNotEmpty) {
      bool allWillBeCompleted = widget.hraList!
          .every((hra) => willBeCompleted.contains(hra.hraName ?? ''));

      if (allWillBeCompleted) {
        return Icons.check;
      } else {
        return Icons.skip_next;
      }
    }

    return Icons.check;
  }

  // Widget _buildRadioOption(String value, String questionId) {
  //   return GestureDetector(
  //     onTap: () {
  //       setState(() {
  //         selectedAnswer = value;
  //       });
  //       // Save the answer to both providers
  //       final hraProvider =
  //           Provider.of<HraQuestionsProvider>(context, listen: false);
  //       final hraAnswerProvider =
  //           Provider.of<HraAnswerProvider>(context, listen: false);

  //       hraProvider.saveAnswer(questionId, value);
  //       hraAnswerProvider.saveAnswer(selectedHraName, questionId, value);
  //     },
  //     child: Container(
  //       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
  //       decoration: BoxDecoration(
  //         color: Colors.grey[50],
  //         borderRadius: BorderRadius.circular(8),
  //         border: Border.all(
  //           color: selectedAnswer == value ? Colors.blue : Colors.grey[200]!,
  //           width: selectedAnswer == value ? 2 : 1,
  //         ),
  //       ),
  //       child: Row(
  //         children: [
  //           Expanded(
  //             child: Text(
  //               value,
  //               style: TextStyle(
  //                 fontSize: 16,
  //                 color: selectedAnswer == value ? Colors.blue : Colors.black,
  //                 fontWeight: selectedAnswer == value
  //                     ? FontWeight.w500
  //                     : FontWeight.normal,
  //               ),
  //             ),
  //           ),
  //           Radio<String>(
  //             value: value,
  //             groupValue: selectedAnswer,
  //             onChanged: (String? newValue) {
  //               setState(() {
  //                 selectedAnswer = newValue;
  //               });
  //               if (newValue != null) {
  //                 final hraProvider =
  //                     Provider.of<HraQuestionsProvider>(context, listen: false);
  //                 final hraAnswerProvider =
  //                     Provider.of<HraAnswerProvider>(context, listen: false);

  //                 hraProvider.saveAnswer(questionId, newValue);
  //                 hraAnswerProvider.saveAnswer(
  //                     selectedHraName, questionId, newValue);
  //               }
  //             },
  //             activeColor: Colors.blue,
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
  Widget _buildRadioOption(HraOption option, String questionId) {
  return GestureDetector(
    onTap: () {
      setState(() {
        selectedAnswer = option.id; // Store the option ID or text as needed
      });
      // Save the answer to both providers
      final hraProvider =
          Provider.of<HraQuestionsProvider>(context, listen: false);
      final hraAnswerProvider =
          Provider.of<HraAnswerProvider>(context, listen: false);

      hraProvider.saveAnswer(questionId, option.id); // or option.text
      hraAnswerProvider.saveAnswer(selectedHraName, questionId, option.id); // or option.text
    },
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: selectedAnswer == option.id ? Colors.blue : Colors.grey[200]!,
          width: selectedAnswer == option.id ? 2 : 1,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              option.text, // Display the text property
              style: TextStyle(
                fontSize: 16,
                color: selectedAnswer == option.id ? Colors.blue : Colors.black,
                fontWeight: selectedAnswer == option.id
                    ? FontWeight.w500
                    : FontWeight.normal,
              ),
            ),
          ),
          Radio<String>(
            value: option.id, // or option.text
            groupValue: selectedAnswer,
            onChanged: (String? newValue) {
              setState(() {
                selectedAnswer = newValue;
              });
              if (newValue != null) {
                final hraProvider =
                    Provider.of<HraQuestionsProvider>(context, listen: false);
                final hraAnswerProvider =
                    Provider.of<HraAnswerProvider>(context, listen: false);

                hraProvider.saveAnswer(questionId, newValue);
                hraAnswerProvider.saveAnswer(
                    selectedHraName, questionId, newValue);
              }
            },
            activeColor: Colors.blue,
          ),
        ],
      ),
    ),
  );
}
}
