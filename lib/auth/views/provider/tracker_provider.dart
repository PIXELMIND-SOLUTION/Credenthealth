// import 'package:consultation_app/Helper/auth_preference.dart';
// import 'package:consultation_app/auth/views/api/tracker_services.dart';
// import 'package:flutter/material.dart';
// // Your SharedPrefsHelper class

// class TrackerProvider extends ChangeNotifier {
//   bool _isLoading = false;
//   String _errorMessage = '';
//   Map<String, dynamic>? _stepsData;
//   int _currentSteps = 0;
//   int _totalCoins = 300;
//   List<Map<String, dynamic>> _progressHistory = [];

//   // Getters
//   bool get isLoading => _isLoading;
//   String get errorMessage => _errorMessage;
//   Map<String, dynamic>? get stepsData => _stepsData;
//   int get currentSteps => _currentSteps;
//   int get totalCoins => _totalCoins;
//   List<Map<String, dynamic>> get progressHistory => _progressHistory;

//   // Calculate progress percentage (assuming goal is 10000 steps)
//   double get progressPercentage {
//     const int goalSteps = 10000;
//     return _currentSteps / goalSteps;
//   }

//   // Set loading state
//   void _setLoading(bool loading) {
//     _isLoading = loading;
//     notifyListeners();
//   }

//   // Set error message
//   void _setError(String error) {
//     _errorMessage = error;
//     notifyListeners();
//   }

//   // Clear error message
//   void clearError() {
//     _errorMessage = '';
//     notifyListeners();
//   }

//   // Add steps
//   Future<bool> addSteps(int steps) async {
//     try {
//       _setLoading(true);
//       clearError();

//       // Get staff ID from SharedPreferences
//       final staffId = await SharedPrefsHelper.getStaffIdWithFallback();
//       if (staffId.isEmpty) {
//         _setError('Staff ID not found. Please login again.');
//         _setLoading(false);
//         return false;
//       }

//       final result = await TrackerServices.addSteps(
//         staffId: staffId,
//         steps: steps,
//       );

//       if (result['success']) {
//         _stepsData = result['data'];
//         _currentSteps += steps;
        
//         // Calculate coins earned (assuming 1 coin per 100 steps)
//         int coinsEarned = (steps / 100).floor();
//         _totalCoins += coinsEarned;
        
//         print('✅ Steps added successfully: $steps');
//         print('🪙 Coins earned: $coinsEarned');
        
//         _setLoading(false);
//         return true;
//       } else {
//         _setError(result['message']);
//         _setLoading(false);
//         return false;
//       }
//     } catch (e) {
//       _setError('Failed to add steps: $e');
//       _setLoading(false);
//       return false;
//     }
//   }

//   // Get all steps
//   Future<bool> getAllSteps() async {
//     try {
//       _setLoading(true);
//       clearError();

//       // Get staff ID from SharedPreferences
//       final staffId = await SharedPrefsHelper.getStaffIdWithFallback();
//       if (staffId.isEmpty) {
//         _setError('Staff ID not found. Please login again.');
//         _setLoading(false);
//         return false;
//       }

//       final result = await TrackerServices.getAllSteps(staffId: staffId);

//       if (result['success']) {
//         _stepsData = result['data'];
        
//         // Update current steps from API response
//         if (_stepsData != null) {
//           // Assuming the API returns steps data in a format like:
//           // {"steps": [{"date": "2025-01-09", "steps": 2003, "coins": 20}]}
//           if (_stepsData!['steps'] != null && _stepsData!['steps'] is List) {
//             List steps = _stepsData!['steps'];
//             _progressHistory = steps.cast<Map<String, dynamic>>();
            
//             // Get today's steps (assuming the last entry is today)
//             if (steps.isNotEmpty) {
//               final todayData = steps.last;
//               _currentSteps = todayData['steps'] ?? 0;
//               _totalCoins = todayData['totalCoins'] ?? _totalCoins;
//             }
//           } else if (_stepsData!['totalSteps'] != null) {
//             _currentSteps = _stepsData!['totalSteps'];
//           }
//         }
        
//         print('✅ Steps retrieved successfully');
//         _setLoading(false);
//         return true;
//       } else {
//         _setError(result['message']);
//         _setLoading(false);
//         return false;
//       }
//     } catch (e) {
//       _setError('Failed to get steps: $e');
//       _setLoading(false);
//       return false;
//     }
//   }

//   // Reset steps
//   // Future<bool> resetSteps() async {
//   //   try {
//   //     _setLoading(true);
//   //     clearError();

//   //     // Get staff ID from SharedPreferences
//   //     final staffId = await SharedPrefsHelper.getStaffIdWithFallback();
//   //     if (staffId.isEmpty) {
//   //       _setError('Staff ID not found. Please login again.');
//   //       _setLoading(false);
//   //       return false;
//   //     }

//   //     final result = await TrackerServices.resetSteps(staffId: staffId);

//   //     if (result['success']) {
//   //       _currentSteps = 0;
//   //       _stepsData = result['data'];
        
//   //       print('✅ Steps reset successfully');
//   //       _setLoading(false);
//   //       return true;
//   //     } else {
//   //       _setError(result['message']);
//   //       _setLoading(false);
//   //       return false;
//   //     }
//   //   } catch (e) {
//   //     _setError('Failed to reset steps: $e');
//   //     _setLoading(false);
//   //     return false;
//   //   }
//   // }

//   // Simulate adding steps (for testing without actual step counter)
//   Future<bool> simulateSteps(int steps) async {
//     return await addSteps(steps);
//   }

//   // Initialize data when screen loads
//   Future<void> initializeData() async {
//     await getAllSteps();
//   }

//   // Refresh data
//   Future<void> refreshData() async {
//     await getAllSteps();
//   }
// }












import 'dart:async';

import 'package:consultation_app/Helper/auth_preference.dart';
import 'package:consultation_app/auth/views/api/tracker_services.dart';
import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'dart:math' as math;

// class TrackerProvider extends ChangeNotifier {
//   bool _isLoading = false;
//   String _errorMessage = '';
//   Map<String, dynamic>? _stepsData;
//   int _currentSteps = 0;
//   int _totalCoins = 300;
//   List<Map<String, dynamic>> _progressHistory = [];
  
//   // Motion detection variables
//   StreamSubscription<AccelerometerEvent>? _accelerometerSubscription;
//   bool _isTrackingMotion = false;
//   double _lastMagnitude = 0;
//   DateTime _lastStepTime = DateTime.now();
//   int _stepBuffer = 0;
//   List<double> _magnitudeHistory = [];
//   static const double _stepThreshold = 12.0; // Threshold for step detection
//   static const int _minTimeBetweenSteps = 300; // Minimum milliseconds between steps
//   static const int _bufferSize = 10; // Size of magnitude history buffer

//   // Getters
//   bool get isLoading => _isLoading;
//   String get errorMessage => _errorMessage;
//   Map<String, dynamic>? get stepsData => _stepsData;
//   int get currentSteps => _currentSteps;
//   int get totalCoins => _totalCoins;
//   List<Map<String, dynamic>> get progressHistory => _progressHistory;
//   bool get isTrackingMotion => _isTrackingMotion;

//   // Calculate progress percentage (assuming goal is 10000 steps)
//   double get progressPercentage {
//     const int goalSteps = 10000;
//     return _currentSteps / goalSteps;
//   }

//   // Set loading state
//   void _setLoading(bool loading) {
//     _isLoading = loading;
//     notifyListeners();
//   }

//   // Set error message
//   void _setError(String error) {
//     _errorMessage = error;
//     notifyListeners();
//   }

//   // Clear error message
//   void clearError() {
//     _errorMessage = '';
//     notifyListeners();
//   }

//   // Start motion tracking
//   Future<void> startMotionTracking() async {
//     try {
//       if (_isTrackingMotion) return;

//       print('🚶 Starting motion tracking...');
//       _isTrackingMotion = true;
//       _stepBuffer = 0;
//       _magnitudeHistory.clear();
      
//       // Listen to accelerometer events
//       _accelerometerSubscription = accelerometerEvents.listen(
//         (AccelerometerEvent event) {
//           _processAccelerometerData(event);
//         },
//         onError: (error) {
//           print('❌ Accelerometer error: $error');
//           _setError('Motion sensor error: $error');
//         },
//       );
      
//       notifyListeners();
//       print('✅ Motion tracking started successfully');
//     } catch (e) {
//       print('❌ Failed to start motion tracking: $e');
//       _setError('Failed to start motion tracking: $e');
//     }
//   }

//   // Stop motion tracking
//   void stopMotionTracking() {
//     if (!_isTrackingMotion) return;

//     print('🛑 Stopping motion tracking...');
//     _accelerometerSubscription?.cancel();
//     _accelerometerSubscription = null;
//     _isTrackingMotion = false;
//     _magnitudeHistory.clear();
    
//     notifyListeners();
//     print('✅ Motion tracking stopped');
//   }

//   // Process accelerometer data to detect steps
//   void _processAccelerometerData(AccelerometerEvent event) {
//     // Calculate magnitude of acceleration vector
//     double magnitude = math.sqrt(
//       event.x * event.x + event.y * event.y + event.z * event.z
//     );
    
//     // Add to history buffer
//     _magnitudeHistory.add(magnitude);
//     if (_magnitudeHistory.length > _bufferSize) {
//       _magnitudeHistory.removeAt(0);
//     }
    
//     // Only process if we have enough data points
//     if (_magnitudeHistory.length < 3) return;
    
//     // Apply simple low-pass filter to smooth the data
//     double smoothedMagnitude = _magnitudeHistory.reduce((a, b) => a + b) / _magnitudeHistory.length;
    
//     // Detect step using peak detection algorithm
//     if (_isStep(smoothedMagnitude)) {
//       DateTime now = DateTime.now();
//       int timeDiff = now.difference(_lastStepTime).inMilliseconds;
      
//       // Check minimum time between steps to avoid false positives
//       if (timeDiff > _minTimeBetweenSteps) {
//         _stepBuffer++;
//         _lastStepTime = now;
        
//         print('👟 Step detected! Buffer: $_stepBuffer');
        
//         // Update steps every 5 detected steps to reduce API calls
//         if (_stepBuffer >= 5) {
//           _processStepBuffer();
//         }
//       }
//     }
    
//     _lastMagnitude = smoothedMagnitude;
//   }

//   // Determine if current reading indicates a step
//   bool _isStep(double currentMagnitude) {
//     if (_magnitudeHistory.length < 3) return false;
    
//     // Get previous readings
//     double prev1 = _magnitudeHistory[_magnitudeHistory.length - 2];
//     double prev2 = _magnitudeHistory[_magnitudeHistory.length - 3];
    
//     // Look for peak: previous < current > next pattern
//     // and magnitude above threshold
//     bool isPeak = prev2 < prev1 && prev1 > currentMagnitude && 
//                   prev1 > _stepThreshold;
    
//     return isPeak;
//   }

//   // Process accumulated steps in buffer
//   Future<void> _processStepBuffer() async {
//     if (_stepBuffer <= 0) return;
    
//     int stepsToAdd = _stepBuffer;
//     _stepBuffer = 0;
    
//     // Update local count immediately for better UX
//     _currentSteps += stepsToAdd;
    
//     // Calculate coins earned (1 coin per 100 steps)
//     int coinsEarned = (stepsToAdd / 100).floor();
//     _totalCoins += coinsEarned;
    
//     notifyListeners();
    
//     // Send to API in background
//     try {
//       final staffId = await SharedPrefsHelper.getStaffIdWithFallback();
//       if (staffId.isNotEmpty) {
//         final result = await TrackerServices.addSteps(
//           staffId: staffId,
//           steps: stepsToAdd,
//         );
        
//         if (result['success']) {
//           print('✅ Steps synced to server: $stepsToAdd');
//         } else {
//           print('❌ Failed to sync steps: ${result['message']}');
//           // Optionally store failed steps for retry later
//         }
//       }
//     } catch (e) {
//       print('❌ Error syncing steps: $e');
//     }
//   }

//   // Manual step addition (keeping original functionality)
//   Future<bool> addSteps(int steps) async {
//     try {
//       _setLoading(true);
//       clearError();

//       final staffId = await SharedPrefsHelper.getStaffIdWithFallback();
//       if (staffId.isEmpty) {
//         _setError('Staff ID not found. Please login again.');
//         _setLoading(false);
//         return false;
//       }

//       final result = await TrackerServices.addSteps(
//         staffId: staffId,
//         steps: steps,
//       );

//       if (result['success']) {
//         _stepsData = result['data'];
//         _currentSteps += steps;
        
//         int coinsEarned = (steps / 100).floor();
//         _totalCoins += coinsEarned;
        
//         print('✅ Steps added successfully: $steps');
//         print('🪙 Coins earned: $coinsEarned');
        
//         _setLoading(false);
//         return true;
//       } else {
//         _setError(result['message']);
//         _setLoading(false);
//         return false;
//       }
//     } catch (e) {
//       _setError('Failed to add steps: $e');
//       _setLoading(false);
//       return false;
//     }
//   }

//   // Get all steps
//   Future<bool> getAllSteps() async {
//     try {
//       _setLoading(true);
//       clearError();

//       final staffId = await SharedPrefsHelper.getStaffIdWithFallback();
//       if (staffId.isEmpty) {
//         _setError('Staff ID not found. Please login again.');
//         _setLoading(false);
//         return false;
//       }

//       final result = await TrackerServices.getAllSteps(staffId: staffId);

//       if (result['success']) {
//         _stepsData = result['data'];
        
//         if (_stepsData != null) {
//           if (_stepsData!['steps'] != null && _stepsData!['steps'] is List) {
//             List steps = _stepsData!['steps'];
//             _progressHistory = steps.cast<Map<String, dynamic>>();
            
//             if (steps.isNotEmpty) {
//               final todayData = steps.last;
//               _currentSteps = todayData['steps'] ?? 0;
//               _totalCoins = todayData['totalCoins'] ?? _totalCoins;
//             }
//           } else if (_stepsData!['totalSteps'] != null) {
//             _currentSteps = _stepsData!['totalSteps'];
//           }
//         }
        
//         print('✅ Steps retrieved successfully');
//         _setLoading(false);
//         return true;
//       } else {
//         _setError(result['message']);
//         _setLoading(false);
//         return false;
//       }
//     } catch (e) {
//       _setError('Failed to get steps: $e');
//       _setLoading(false);
//       return false;
//     }
//   }

//   // Simulate adding steps (for testing)
//   Future<bool> simulateSteps(int steps) async {
//     return await addSteps(steps);
//   }

//   // Initialize data when screen loads
//   Future<void> initializeData() async {
//     await getAllSteps();
//     // Auto-start motion tracking
//     await startMotionTracking();
//   }

//   // Refresh data
//   Future<void> refreshData() async {
//     await getAllSteps();
//   }

//   // Clean up resources
//   @override
//   void dispose() {
//     stopMotionTracking();
//     super.dispose();
//   }
// }










// class TrackerProvider extends ChangeNotifier {
//   bool _isLoading = false;
//   String _errorMessage = '';
//   Map<String, dynamic>? _stepsData;
//   int _currentSteps = 0;
//   int _totalCoins = 300;
//   List<Map<String, dynamic>> _progressHistory = [];
  
//   // Motion detection variables
//   StreamSubscription<AccelerometerEvent>? _accelerometerSubscription;
//   bool _isTrackingMotion = false;
//   double _lastMagnitude = 0;
//   DateTime _lastStepTime = DateTime.now();
//   int _stepBuffer = 0;
//   List<double> _magnitudeHistory = [];
//   static const double _stepThreshold = 12.0; // Threshold for step detection
//   static const int _minTimeBetweenSteps = 300; // Minimum milliseconds between steps
//   static const int _bufferSize = 10; // Size of magnitude history buffer

//   // Getters
//   bool get isLoading => _isLoading;
//   String get errorMessage => _errorMessage;
//   Map<String, dynamic>? get stepsData => _stepsData;
//   int get currentSteps => _currentSteps;
//   int get totalCoins => _totalCoins;
//   List<Map<String, dynamic>> get progressHistory => _progressHistory;
//   bool get isTrackingMotion => _isTrackingMotion;

//   // Calculate progress percentage (assuming goal is 10000 steps)
//   double get progressPercentage {
//     const int goalSteps = 10000;
//     return _currentSteps / goalSteps;
//   }

//   // Set loading state
//   void _setLoading(bool loading) {
//     _isLoading = loading;
//     notifyListeners();
//   }

//   // Set error message
//   void _setError(String error) {
//     _errorMessage = error;
//     notifyListeners();
//   }

//   // Clear error message
//   void clearError() {
//     _errorMessage = '';
//     notifyListeners();
//   }

//   // Start motion tracking
//   Future<void> startMotionTracking() async {
//     try {
//       if (_isTrackingMotion) return;

//       print('🚶 Starting motion tracking...');
//       _isTrackingMotion = true;
//       _stepBuffer = 0;
//       _magnitudeHistory.clear();
      
//       // Listen to accelerometer events
//       _accelerometerSubscription = accelerometerEvents.listen(
//         (AccelerometerEvent event) {
//           _processAccelerometerData(event);
//         },
//         onError: (error) {
//           print('❌ Accelerometer error: $error');
//           _setError('Motion sensor error: $error');
//         },
//       );
      
//       notifyListeners();
//       print('✅ Motion tracking started successfully');
//     } catch (e) {
//       print('❌ Failed to start motion tracking: $e');
//       _setError('Failed to start motion tracking: $e');
//     }
//   }

//   // Stop motion tracking
//   void stopMotionTracking() {
//     if (!_isTrackingMotion) return;

//     print('🛑 Stopping motion tracking...');
//     _accelerometerSubscription?.cancel();
//     _accelerometerSubscription = null;
//     _isTrackingMotion = false;
//     _magnitudeHistory.clear();
    
//     notifyListeners();
//     print('✅ Motion tracking stopped');
//   }

//   // Process accelerometer data to detect steps
//   void _processAccelerometerData(AccelerometerEvent event) {
//     // Calculate magnitude of acceleration vector
//     double magnitude = math.sqrt(
//       event.x * event.x + event.y * event.y + event.z * event.z
//     );
    
//     // Add to history buffer
//     _magnitudeHistory.add(magnitude);
//     if (_magnitudeHistory.length > _bufferSize) {
//       _magnitudeHistory.removeAt(0);
//     }
    
//     // Only process if we have enough data points
//     if (_magnitudeHistory.length < 3) return;
    
//     // Apply simple low-pass filter to smooth the data
//     double smoothedMagnitude = _magnitudeHistory.reduce((a, b) => a + b) / _magnitudeHistory.length;
    
//     // Detect step using peak detection algorithm
//     if (_isStep(smoothedMagnitude)) {
//       DateTime now = DateTime.now();
//       int timeDiff = now.difference(_lastStepTime).inMilliseconds;
      
//       // Check minimum time between steps to avoid false positives
//       if (timeDiff > _minTimeBetweenSteps) {
//         _stepBuffer++;
//         _lastStepTime = now;
        
//         print('👟 Step detected! Buffer: $_stepBuffer');
        
//         // Update steps every 5 detected steps to reduce API calls
//         if (_stepBuffer >= 5) {
//           _processStepBuffer();
//         }
//       }
//     }
    
//     _lastMagnitude = smoothedMagnitude;
//   }

//   // Determine if current reading indicates a step
//   bool _isStep(double currentMagnitude) {
//     if (_magnitudeHistory.length < 3) return false;
    
//     // Get previous readings
//     double prev1 = _magnitudeHistory[_magnitudeHistory.length - 2];
//     double prev2 = _magnitudeHistory[_magnitudeHistory.length - 3];
    
//     // Look for peak: previous < current > next pattern
//     // and magnitude above threshold
//     bool isPeak = prev2 < prev1 && prev1 > currentMagnitude && 
//                   prev1 > _stepThreshold;
    
//     return isPeak;
//   }

//   // Process accumulated steps in buffer
//   Future<void> _processStepBuffer() async {
//     if (_stepBuffer <= 0) return;
    
//     int stepsToAdd = _stepBuffer;
//     _stepBuffer = 0;
    
//     // Update local count immediately for better UX
//     _currentSteps += stepsToAdd;
    
//     // Calculate coins earned (1 coin per 100 steps)
//     int coinsEarned = (stepsToAdd / 100).floor();
//     _totalCoins += coinsEarned;
    
//     notifyListeners();
    
//     // Send to API in background
//     try {
//       final staffId = await SharedPrefsHelper.getStaffIdWithFallback();
//       if (staffId.isNotEmpty) {
//         final result = await TrackerServices.addSteps(
//           staffId: staffId,
//           steps: stepsToAdd,
//         );
        
//         if (result['success']) {
//           print('✅ Steps synced to server: $stepsToAdd');
//         } else {
//           print('❌ Failed to sync steps: ${result['message']}');
//           // Optionally store failed steps for retry later
//         }
//       }
//     } catch (e) {
//       print('❌ Error syncing steps: $e');
//     }
//   }

//   // Manual step addition (keeping original functionality)
//   Future<bool> addSteps(int steps) async {
//     try {
//       _setLoading(true);
//       clearError();

//       final staffId = await SharedPrefsHelper.getStaffIdWithFallback();
//       if (staffId.isEmpty) {
//         _setError('Staff ID not found. Please login again.');
//         _setLoading(false);
//         return false;
//       }

//       final result = await TrackerServices.addSteps(
//         staffId: staffId,
//         steps: steps,
//       );

//       if (result['success']) {
//         _stepsData = result['data'];
//         _currentSteps += steps;
        
//         int coinsEarned = (steps / 100).floor();
//         _totalCoins += coinsEarned;
        
//         print('✅ Steps added successfully: $steps');
//         print('🪙 Coins earned: $coinsEarned');
        
//         _setLoading(false);
//         return true;
//       } else {
//         _setError(result['message']);
//         _setLoading(false);
//         return false;
//       }
//     } catch (e) {
//       _setError('Failed to add steps: $e');
//       _setLoading(false);
//       return false;
//     }
//   }

//   // Get all steps
//   Future<bool> getAllSteps() async {
//     try {
//       _setLoading(true);
//       clearError();

//       final staffId = await SharedPrefsHelper.getStaffIdWithFallback();
//       if (staffId.isEmpty) {
//         _setError('Staff ID not found. Please login again.');
//         _setLoading(false);
//         return false;
//       }

//       final result = await TrackerServices.getAllSteps(staffId: staffId);

//       if (result['success']) {
//         _stepsData = result['data'];
        
//         if (_stepsData != null) {
//           if (_stepsData!['steps'] != null && _stepsData!['steps'] is List) {
//             List steps = _stepsData!['steps'];
//             _progressHistory = steps.cast<Map<String, dynamic>>();
            
//             if (steps.isNotEmpty) {
//               final todayData = steps.last;
//               _currentSteps = todayData['steps'] ?? 0;
//               _totalCoins = todayData['totalCoins'] ?? _totalCoins;
//             }
//           } else if (_stepsData!['totalSteps'] != null) {
//             _currentSteps = _stepsData!['totalSteps'];
//           }
//         }
        
//         print('✅ Steps retrieved successfully');
//         _setLoading(false);
//         return true;
//       } else {
//         _setError(result['message']);
//         _setLoading(false);
//         return false;
//       }
//     } catch (e) {
//       _setError('Failed to get steps: $e');
//       _setLoading(false);
//       return false;
//     }
//   }

//   // Simulate adding steps (for testing)
//   Future<bool> simulateSteps(int steps) async {
//     return await addSteps(steps);
//   }

//   // Initialize data when screen loads
//   Future<void> initializeData() async {
//     await getAllSteps();
//     // Auto-start motion tracking
//     await startMotionTracking();
//   }

//   // Refresh data
//   Future<void> refreshData() async {
//     await getAllSteps();
//   }

//   // Clean up resources
//   @override
//   void dispose() {
//     stopMotionTracking();
//     super.dispose();
//   }
// }










// import 'dart:async';
// import 'dart:math' as math;
// import 'package:flutter/foundation.dart';
// import 'package:sensors_plus/sensors_plus.dart';

// class TrackerProvider extends ChangeNotifier {
//   bool _isLoading = false;
//   String _errorMessage = '';
//   Map<String, dynamic>? _stepsData;
//   int _currentSteps = 0;
//   int _totalCoins = 300;
//   List<Map<String, dynamic>> _progressHistory = [];
  
//   // Motion detection variables
//   StreamSubscription<AccelerometerEvent>? _accelerometerSubscription;
//   bool _isTrackingMotion = false;
//   double _lastMagnitude = 0;
//   DateTime _lastStepTime = DateTime.now();
//   int _stepBuffer = 0;
//   List<double> _magnitudeHistory = [];
//   static const double _stepThreshold = 12.0;
//   static const int _minTimeBetweenSteps = 300;
//   static const int _bufferSize = 10;

//   // Date tracking variables
//   DateTime _lastResetDate = DateTime.now();
//   Timer? _midnightTimer;

//   // Getters
//   bool get isLoading => _isLoading;
//   String get errorMessage => _errorMessage;
//   Map<String, dynamic>? get stepsData => _stepsData;
//   int get currentSteps => _currentSteps;
//   int get totalCoins => _totalCoins;
//   List<Map<String, dynamic>> get progressHistory => _progressHistory;
//   bool get isTrackingMotion => _isTrackingMotion;

//   // Calculate progress percentage (assuming goal is 10000 steps)
//   double get progressPercentage {
//     const int goalSteps = 10000;
//     return _currentSteps / goalSteps;
//   }

//   // Set loading state
//   void _setLoading(bool loading) {
//     _isLoading = loading;
//     notifyListeners();
//   }

//   // Set error message
//   void _setError(String error) {
//     _errorMessage = error;
//     notifyListeners();
//   }

//   // Clear error message
//   void clearError() {
//     _errorMessage = '';
//     notifyListeners();
//   }

//   // Setup midnight reset timer
//   void _setupMidnightResetTimer() {
//     _midnightTimer?.cancel();
    
//     final now = DateTime.now();
//     final tomorrow = DateTime(now.year, now.month, now.day + 1);
//     final timeUntilMidnight = tomorrow.difference(now);
    
//     print('⏰ Setting up midnight reset timer. Time until midnight: ${timeUntilMidnight.inMinutes} minutes');
    
//     _midnightTimer = Timer(timeUntilMidnight, () {
//       _performMidnightReset();
//       // Setup the timer again for the next day
//       _setupMidnightResetTimer();
//     });
//   }

//   // Perform midnight reset
//   void _performMidnightReset() {
//     print('🌙 Performing midnight reset...');
    
//     // Save current day's progress to history before reset
//     _saveCurrentDayProgress();
    
//     // Reset current steps
//     _currentSteps = 0;
    
//     // Update last reset date
//     _lastResetDate = DateTime.now();
    
//     // Notify listeners
//     notifyListeners();
    
//     print('✅ Midnight reset completed. Steps reset to 0');
//   }

//   // Save current day's progress to history
//   void _saveCurrentDayProgress() {
//     if (_currentSteps > 0) {
//       final yesterday = DateTime.now().subtract(const Duration(days: 1));
//       final progressEntry = {
//         'date': _formatDate(yesterday),
//         'steps': _currentSteps,
//         'coins': (_currentSteps / 100).floor(),
//         'timestamp': yesterday.toIso8601String(),
//       };
      
//       _progressHistory.add(progressEntry);
      
//       // Keep only last 7 days of history
//       if (_progressHistory.length > 7) {
//         _progressHistory.removeAt(0);
//       }
      
//       print('📊 Saved progress for ${_formatDate(yesterday)}: $_currentSteps steps');
//     }
//   }

//   // Format date for display
//   String _formatDate(DateTime date) {
//     final weekdays = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
//     final months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
    
//     return '${weekdays[date.weekday % 7]} ${months[date.month - 1]} ${date.day}';
//   }

//   // Check if a new day has started
//   bool _isNewDay() {
//     final now = DateTime.now();
//     final lastReset = DateTime(_lastResetDate.year, _lastResetDate.month, _lastResetDate.day);
//     final today = DateTime(now.year, now.month, now.day);
    
//     return today.isAfter(lastReset);
//   }

//   // Start motion tracking
//   Future<void> startMotionTracking() async {
//     try {
//       if (_isTrackingMotion) return;

//       // Check if we need to reset for a new day
//       if (_isNewDay()) {
//         _performMidnightReset();
//       }

//       print('🚶 Starting motion tracking...');
//       _isTrackingMotion = true;
//       _stepBuffer = 0;
//       _magnitudeHistory.clear();
      
//       // Setup midnight reset timer
//       _setupMidnightResetTimer();
      
//       // Listen to accelerometer events
//       _accelerometerSubscription = accelerometerEvents.listen(
//         (AccelerometerEvent event) {
//           _processAccelerometerData(event);
//         },
//         onError: (error) {
//           print('❌ Accelerometer error: $error');
//           _setError('Motion sensor error: $error');
//         },
//       );
      
//       notifyListeners();
//       print('✅ Motion tracking started successfully');
//     } catch (e) {
//       print('❌ Failed to start motion tracking: $e');
//       _setError('Failed to start motion tracking: $e');
//     }
//   }

//   // Stop motion tracking
//   void stopMotionTracking() {
//     if (!_isTrackingMotion) return;

//     print('🛑 Stopping motion tracking...');
//     _accelerometerSubscription?.cancel();
//     _accelerometerSubscription = null;
//     _isTrackingMotion = false;
//     _magnitudeHistory.clear();
    
//     // Cancel midnight timer
//     _midnightTimer?.cancel();
//     _midnightTimer = null;
    
//     notifyListeners();
//     print('✅ Motion tracking stopped');
//   }

//   // Process accelerometer data to detect steps
//   void _processAccelerometerData(AccelerometerEvent event) {
//     // Check if we need to reset for a new day
//     if (_isNewDay()) {
//       _performMidnightReset();
//     }

//     // Calculate magnitude of acceleration vector
//     double magnitude = math.sqrt(
//       event.x * event.x + event.y * event.y + event.z * event.z
//     );
    
//     // Add to history buffer
//     _magnitudeHistory.add(magnitude);
//     if (_magnitudeHistory.length > _bufferSize) {
//       _magnitudeHistory.removeAt(0);
//     }
    
//     // Only process if we have enough data points
//     if (_magnitudeHistory.length < 3) return;
    
//     // Apply simple low-pass filter to smooth the data
//     double smoothedMagnitude = _magnitudeHistory.reduce((a, b) => a + b) / _magnitudeHistory.length;
    
//     // Detect step using peak detection algorithm
//     if (_isStep(smoothedMagnitude)) {
//       DateTime now = DateTime.now();
//       int timeDiff = now.difference(_lastStepTime).inMilliseconds;
      
//       // Check minimum time between steps to avoid false positives
//       if (timeDiff > _minTimeBetweenSteps) {
//         _stepBuffer++;
//         _lastStepTime = now;
        
//         print('👟 Step detected! Buffer: $_stepBuffer');
        
//         // Update steps every 5 detected steps to reduce API calls
//         if (_stepBuffer >= 5) {
//           _processStepBuffer();
//         }
//       }
//     }
    
//     _lastMagnitude = smoothedMagnitude;
//   }

//   // Determine if current reading indicates a step
//   bool _isStep(double currentMagnitude) {
//     if (_magnitudeHistory.length < 3) return false;
    
//     // Get previous readings
//     double prev1 = _magnitudeHistory[_magnitudeHistory.length - 2];
//     double prev2 = _magnitudeHistory[_magnitudeHistory.length - 3];
    
//     // Look for peak: previous < current > next pattern
//     // and magnitude above threshold
//     bool isPeak = prev2 < prev1 && prev1 > currentMagnitude && 
//                   prev1 > _stepThreshold;
    
//     return isPeak;
//   }

//   // Process accumulated steps in buffer
//   Future<void> _processStepBuffer() async {
//     if (_stepBuffer <= 0) return;
    
//     int stepsToAdd = _stepBuffer;
//     _stepBuffer = 0;
    
//     // Update local count immediately for better UX
//     _currentSteps += stepsToAdd;
    
//     // Calculate coins earned (1 coin per 100 steps)
//     int coinsEarned = (stepsToAdd / 100).floor();
//     _totalCoins += coinsEarned;
    
//     notifyListeners();
    
//     // Send to API in background
//     try {
//       final staffId = await SharedPrefsHelper.getStaffIdWithFallback();
//       if (staffId.isNotEmpty) {
//         final result = await TrackerServices.addSteps(
//           staffId: staffId,
//           steps: stepsToAdd,
//         );
        
//         if (result['success']) {
//           print('✅ Steps synced to server: $stepsToAdd');
//         } else {
//           print('❌ Failed to sync steps: ${result['message']}');
//         }
//       }
//     } catch (e) {
//       print('❌ Error syncing steps: $e');
//     }
//   }

//   // Manual step addition (keeping original functionality)
//   Future<bool> addSteps(int steps) async {
//     try {
//       _setLoading(true);
//       clearError();

//       // Check if we need to reset for a new day
//       if (_isNewDay()) {
//         _performMidnightReset();
//       }

//       final staffId = await SharedPrefsHelper.getStaffIdWithFallback();
//       if (staffId.isEmpty) {
//         _setError('Staff ID not found. Please login again.');
//         _setLoading(false);
//         return false;
//       }

//       final result = await TrackerServices.addSteps(
//         staffId: staffId,
//         steps: steps,
//       );

//       if (result['success']) {
//         _stepsData = result['data'];
//         _currentSteps += steps;
        
//         int coinsEarned = (steps / 100).floor();
//         _totalCoins += coinsEarned;
        
//         print('✅ Steps added successfully: $steps');
//         print('🪙 Coins earned: $coinsEarned');
        
//         _setLoading(false);
//         return true;
//       } else {
//         _setError(result['message']);
//         _setLoading(false);
//         return false;
//       }
//     } catch (e) {
//       _setError('Failed to add steps: $e');
//       _setLoading(false);
//       return false;
//     }
//   }

//   // Get all steps
//   Future<bool> getAllSteps() async {
//     try {
//       _setLoading(true);
//       clearError();

//       // Check if we need to reset for a new day
//       if (_isNewDay()) {
//         _performMidnightReset();
//       }

//       final staffId = await SharedPrefsHelper.getStaffIdWithFallback();
//       if (staffId.isEmpty) {
//         _setError('Staff ID not found. Please login again.');
//         _setLoading(false);
//         return false;
//       }

//       final result = await TrackerServices.getAllSteps(staffId: staffId);

//       if (result['success']) {
//         _stepsData = result['data'];
        
//         if (_stepsData != null) {
//           if (_stepsData!['steps'] != null && _stepsData!['steps'] is List) {
//             List steps = _stepsData!['steps'];
//             _progressHistory = steps.cast<Map<String, dynamic>>();
            
//             // Only use today's data from server, not historical data
//             final today = DateTime.now();
//             final todayString = _formatDate(today);
            
//             // Find today's entry or use 0 if not found
//             final todayEntry = steps.firstWhere(
//               (entry) => entry['date'] == todayString,
//               orElse: () => {'steps': 0, 'totalCoins': _totalCoins},
//             );
            
//             _currentSteps = todayEntry['steps'] ?? 0;
//             _totalCoins = todayEntry['totalCoins'] ?? _totalCoins;
            
//           } else if (_stepsData!['totalSteps'] != null) {
//             _currentSteps = _stepsData!['totalSteps'];
//           }
//         }
        
//         print('✅ Steps retrieved successfully');
//         _setLoading(false);
//         return true;
//       } else {
//         _setError(result['message']);
//         _setLoading(false);
//         return false;
//       }
//     } catch (e) {
//       _setError('Failed to get steps: $e');
//       _setLoading(false);
//       return false;
//     }
//   }

//   // Simulate adding steps (for testing)
//   Future<bool> simulateSteps(int steps) async {
//     return await addSteps(steps);
//   }

//   // Initialize data when screen loads
//   Future<void> initializeData() async {
//     // Setup midnight reset timer first
//     _setupMidnightResetTimer();
    
//     // Check if we need to reset for a new day
//     if (_isNewDay()) {
//       _performMidnightReset();
//     }
    
//     await getAllSteps();
//     // Auto-start motion tracking
//     await startMotionTracking();
//   }

//   // Refresh data
//   Future<void> refreshData() async {
//     await getAllSteps();
//   }

//   // Clean up resources
//   @override
//   void dispose() {
//     stopMotionTracking();
//     _midnightTimer?.cancel();
//     super.dispose();
//   }
// }











// import 'dart:async';
// import 'dart:convert';
// import 'dart:math' as math;
// import 'package:flutter/foundation.dart';
// import 'package:sensors_plus/sensors_plus.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class TrackerProvider extends ChangeNotifier {
//   bool _isLoading = false;
//   String _errorMessage = '';
//   Map<String, dynamic>? _stepsData;
//   int _currentSteps = 0;
//   int _totalCoins = 0; // Changed to 0 as coins are now earned
//   List<Map<String, dynamic>> _progressHistory = [];
  
//   // Motion detection variables
//   StreamSubscription<AccelerometerEvent>? _accelerometerSubscription;
//   bool _isTrackingMotion = false;
//   double _lastMagnitude = 0;
//   DateTime _lastStepTime = DateTime.now();
//   int _stepBuffer = 0;
//   List<double> _magnitudeHistory = [];
//   static const double _stepThreshold = 12.0;
//   static const int _minTimeBetweenSteps = 300;
//   static const int _bufferSize = 10;

//   // Date tracking variables
//   DateTime _lastResetDate = DateTime.now();
//   Timer? _midnightTimer;
  
//   // Daily milestone tracking
//   bool _dailyMilestoneAchieved = false;
//   static const int _dailyMilestone = 10000;
//   static const int _milestoneBonus = 100;

//   // Getters
//   bool get isLoading => _isLoading;
//   String get errorMessage => _errorMessage;
//   Map<String, dynamic>? get stepsData => _stepsData;
//   int get currentSteps => _currentSteps;
//   int get totalCoins => _totalCoins;
//   List<Map<String, dynamic>> get progressHistory => _progressHistory;
//   bool get isTrackingMotion => _isTrackingMotion;
//   bool get dailyMilestoneAchieved => _dailyMilestoneAchieved;

//   // Calculate progress percentage (assuming goal is 10000 steps)
//   double get progressPercentage {
//     return _currentSteps / _dailyMilestone;
//   }

//   // Set loading state
//   void _setLoading(bool loading) {
//     _isLoading = loading;
//     notifyListeners();
//   }

//   // Set error message
//   void _setError(String error) {
//     _errorMessage = error;
//     notifyListeners();
//   }

//   // Clear error message
//   void clearError() {
//     _errorMessage = '';
//     notifyListeners();
//   }

//   // Load data from SharedPreferences
//   Future<void> _loadFromPreferences() async {
//     try {
//       final prefs = await SharedPreferences.getInstance();
      
//       // Load current steps
//       _currentSteps = prefs.getInt('current_steps') ?? 0;
      
//       // Load total coins
//       _totalCoins = prefs.getInt('total_coins') ?? 0;
      
//       // Load last reset date
//       final lastResetString = prefs.getString('last_reset_date');
//       if (lastResetString != null) {
//         _lastResetDate = DateTime.parse(lastResetString);
//       }
      
//       // Load daily milestone status
//       _dailyMilestoneAchieved = prefs.getBool('daily_milestone_achieved') ?? false;
      
//       // Load progress history
//       final historyString = prefs.getString('progress_history');
//       if (historyString != null) {
//         final List<dynamic> historyData = jsonDecode(historyString);
//         _progressHistory = historyData.cast<Map<String, dynamic>>();
//       }
      
//       print('📱 Data loaded from SharedPreferences');
//       print('   Steps: $_currentSteps');
//       print('   Coins: $_totalCoins');
//       print('   Last reset: $_lastResetDate');
//       print('   Milestone achieved: $_dailyMilestoneAchieved');
      
//     } catch (e) {
//       print('❌ Error loading from SharedPreferences: $e');
//     }
//   }

//   // Save data to SharedPreferences
//   Future<void> _saveToPreferences() async {
//     try {
//       final prefs = await SharedPreferences.getInstance();
      
//       await prefs.setInt('current_steps', _currentSteps);
//       await prefs.setInt('total_coins', _totalCoins);
//       await prefs.setString('last_reset_date', _lastResetDate.toIso8601String());
//       await prefs.setBool('daily_milestone_achieved', _dailyMilestoneAchieved);
      
//       // Save progress history
//       final historyString = jsonEncode(_progressHistory);
//       await prefs.setString('progress_history', historyString);
      
//     } catch (e) {
//       print('❌ Error saving to SharedPreferences: $e');
//     }
//   }

//   // Setup midnight reset timer
//   void _setupMidnightResetTimer() {
//     _midnightTimer?.cancel();
    
//     final now = DateTime.now();
//     final tomorrow = DateTime(now.year, now.month, now.day + 1);
//     final timeUntilMidnight = tomorrow.difference(now);
    
//     print('⏰ Setting up midnight reset timer. Time until midnight: ${timeUntilMidnight.inMinutes} minutes');
    
//     _midnightTimer = Timer(timeUntilMidnight, () {
//       _performMidnightReset();
//       // Setup the timer again for the next day
//       _setupMidnightResetTimer();
//     });
//   }

//   // Perform midnight reset
//   void _performMidnightReset() {
//     print('🌙 Performing midnight reset...');
    
//     // Save current day's progress to history before reset
//     _saveCurrentDayProgress();
    
//     // Reset current steps and milestone status
//     _currentSteps = 0;
//     _dailyMilestoneAchieved = false;
    
//     // Update last reset date
//     _lastResetDate = DateTime.now();
    
//     // Save to SharedPreferences
//     _saveToPreferences();
    
//     // Notify listeners
//     notifyListeners();
    
//     print('✅ Midnight reset completed. Steps reset to 0, milestone reset');
//   }

//   // Save current day's progress to history
//   void _saveCurrentDayProgress() {
//     if (_currentSteps > 0) {
//       final yesterday = DateTime.now().subtract(const Duration(days: 1));
//       final coinsEarned = _calculateCoinsForSteps(_currentSteps);
      
//       final progressEntry = {
//         'date': _formatDate(yesterday),
//         'steps': _currentSteps,
//         'coins': coinsEarned,
//         'timestamp': yesterday.toIso8601String(),
//       };
      
//       _progressHistory.add(progressEntry);
      
//       // Keep only last 7 days of history
//       if (_progressHistory.length > 7) {
//         _progressHistory.removeAt(0);
//       }
      
//       print('📊 Saved progress for ${_formatDate(yesterday)}: $_currentSteps steps, $coinsEarned coins');
//     }
//   }

//   // Calculate coins for given steps
//   int _calculateCoinsForSteps(int steps) {
//     if (steps >= _dailyMilestone) {
//       // 100 coins for milestone + 1 coin per 10 steps for remaining steps
//       int remainingSteps = steps - _dailyMilestone;
//       return _milestoneBonus + (remainingSteps / 10).floor();
//     } else {
//       // 1 coin per 10 steps
//       return (steps / 10).floor();
//     }
//   }

//   // Format date for display
//   String _formatDate(DateTime date) {
//     final weekdays = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
//     final months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
    
//     return '${weekdays[date.weekday % 7]} ${months[date.month - 1]} ${date.day}';
//   }

//   // Check if a new day has started
//   bool _isNewDay() {
//     final now = DateTime.now();
//     final lastReset = DateTime(_lastResetDate.year, _lastResetDate.month, _lastResetDate.day);
//     final today = DateTime(now.year, now.month, now.day);
    
//     return today.isAfter(lastReset);
//   }

//   // Start motion tracking
//   Future<void> startMotionTracking() async {
//     try {
//       if (_isTrackingMotion) return;

//       // Check if we need to reset for a new day
//       if (_isNewDay()) {
//         _performMidnightReset();
//       }

//       print('🚶 Starting motion tracking...');
//       _isTrackingMotion = true;
//       _stepBuffer = 0;
//       _magnitudeHistory.clear();
      
//       // Setup midnight reset timer
//       _setupMidnightResetTimer();
      
//       // Listen to accelerometer events
//       _accelerometerSubscription = accelerometerEvents.listen(
//         (AccelerometerEvent event) {
//           _processAccelerometerData(event);
//         },
//         onError: (error) {
//           print('❌ Accelerometer error: $error');
//           _setError('Motion sensor error: $error');
//         },
//       );
      
//       notifyListeners();
//       print('✅ Motion tracking started successfully');
//     } catch (e) {
//       print('❌ Failed to start motion tracking: $e');
//       _setError('Failed to start motion tracking: $e');
//     }
//   }

//   // Stop motion tracking
//   void stopMotionTracking() {
//     if (!_isTrackingMotion) return;

//     print('🛑 Stopping motion tracking...');
//     _accelerometerSubscription?.cancel();
//     _accelerometerSubscription = null;
//     _isTrackingMotion = false;
//     _magnitudeHistory.clear();
    
//     // Cancel midnight timer
//     _midnightTimer?.cancel();
//     _midnightTimer = null;
    
//     notifyListeners();
//     print('✅ Motion tracking stopped');
//   }

//   // Process accelerometer data to detect steps
//   void _processAccelerometerData(AccelerometerEvent event) {
//     // Check if we need to reset for a new day
//     if (_isNewDay()) {
//       _performMidnightReset();
//     }

//     // Calculate magnitude of acceleration vector
//     double magnitude = math.sqrt(
//       event.x * event.x + event.y * event.y + event.z * event.z
//     );
    
//     // Add to history buffer
//     _magnitudeHistory.add(magnitude);
//     if (_magnitudeHistory.length > _bufferSize) {
//       _magnitudeHistory.removeAt(0);
//     }
    
//     // Only process if we have enough data points
//     if (_magnitudeHistory.length < 3) return;
    
//     // Apply simple low-pass filter to smooth the data
//     double smoothedMagnitude = _magnitudeHistory.reduce((a, b) => a + b) / _magnitudeHistory.length;
    
//     // Detect step using peak detection algorithm
//     if (_isStep(smoothedMagnitude)) {
//       DateTime now = DateTime.now();
//       int timeDiff = now.difference(_lastStepTime).inMilliseconds;
      
//       // Check minimum time between steps to avoid false positives
//       if (timeDiff > _minTimeBetweenSteps) {
//         _stepBuffer++;
//         _lastStepTime = now;
        
//         print('👟 Step detected! Buffer: $_stepBuffer');
        
//         // Update steps every 5 detected steps to reduce API calls
//         if (_stepBuffer >= 5) {
//           _processStepBuffer();
//         }
//       }
//     }
    
//     _lastMagnitude = smoothedMagnitude;
//   }

//   // Determine if current reading indicates a step
//   bool _isStep(double currentMagnitude) {
//     if (_magnitudeHistory.length < 3) return false;
    
//     // Get previous readings
//     double prev1 = _magnitudeHistory[_magnitudeHistory.length - 2];
//     double prev2 = _magnitudeHistory[_magnitudeHistory.length - 3];
    
//     // Look for peak: previous < current > next pattern
//     // and magnitude above threshold
//     bool isPeak = prev2 < prev1 && prev1 > currentMagnitude && 
//                   prev1 > _stepThreshold;
    
//     return isPeak;
//   }

//   // Process accumulated steps in buffer
//   Future<void> _processStepBuffer() async {
//     if (_stepBuffer <= 0) return;
    
//     int stepsToAdd = _stepBuffer;
//     _stepBuffer = 0;
    
//     int previousSteps = _currentSteps;
    
//     // Update local count immediately for better UX
//     _currentSteps += stepsToAdd;
    
//     // Check for milestone achievement
//     if (previousSteps < _dailyMilestone && _currentSteps >= _dailyMilestone && !_dailyMilestoneAchieved) {
//       _dailyMilestoneAchieved = true;
//       _totalCoins += _milestoneBonus;
//       print('🎉 Daily milestone achieved! Bonus: $_milestoneBonus coins');
//     }
    
//     // Calculate coins for the new steps
//     int coinsEarned = 0;
//     if (_currentSteps >= _dailyMilestone) {
//       // After milestone, earn 1 coin per step
//       coinsEarned = stepsToAdd;
//     } else {
//       // Before milestone, earn 1 coin per 10 steps
//       int newCoinsFromSteps = (_currentSteps / 10).floor();
//       int previousCoinsFromSteps = (previousSteps / 10).floor();
//       coinsEarned = newCoinsFromSteps - previousCoinsFromSteps;
//     }
    
//     _totalCoins += coinsEarned;
    
//     // Save to SharedPreferences
//     await _saveToPreferences();
    
//     notifyListeners();
    
//     print('✅ Steps processed: $stepsToAdd, Coins earned: $coinsEarned');
    
//     // Send to API in background
//     try {
//       final staffId = await SharedPrefsHelper.getStaffIdWithFallback();
//       if (staffId.isNotEmpty) {
//         final result = await TrackerServices.addSteps(
//           staffId: staffId,
//           steps: stepsToAdd,
//         );
        
//         if (result['success']) {
//           print('✅ Steps synced to server: $stepsToAdd');
//         } else {
//           print('❌ Failed to sync steps: ${result['message']}');
//         }
//       }
//     } catch (e) {
//       print('❌ Error syncing steps: $e');
//     }
//   }

//   // Manual step addition (keeping original functionality)
//   Future<bool> addSteps(int steps) async {
//     try {
//       _setLoading(true);
//       clearError();

//       // Check if we need to reset for a new day
//       if (_isNewDay()) {
//         _performMidnightReset();
//       }

//       final staffId = await SharedPrefsHelper.getStaffIdWithFallback();
//       if (staffId.isEmpty) {
//         _setError('Staff ID not found. Please login again.');
//         _setLoading(false);
//         return false;
//       }

//       final result = await TrackerServices.addSteps(
//         staffId: staffId,
//         steps: steps,
//       );

//       if (result['success']) {
//         _stepsData = result['data'];
        
//         int previousSteps = _currentSteps;
//         _currentSteps += steps;
        
//         // Check for milestone achievement
//         if (previousSteps < _dailyMilestone && _currentSteps >= _dailyMilestone && !_dailyMilestoneAchieved) {
//           _dailyMilestoneAchieved = true;
//           _totalCoins += _milestoneBonus;
//           print('🎉 Daily milestone achieved! Bonus: $_milestoneBonus coins');
//         }
        
//         // Calculate coins for the new steps
//         int coinsEarned = 0;
//         if (_currentSteps >= _dailyMilestone) {
//           // After milestone, earn 1 coin per step
//           coinsEarned = steps;
//         } else {
//           // Before milestone, earn 1 coin per 10 steps
//           int newCoinsFromSteps = (_currentSteps / 10).floor();
//           int previousCoinsFromSteps = (previousSteps / 10).floor();
//           coinsEarned = newCoinsFromSteps - previousCoinsFromSteps;
//         }
        
//         _totalCoins += coinsEarned;
        
//         // Save to SharedPreferences
//         await _saveToPreferences();
        
//         print('✅ Steps added successfully: $steps');
//         print('🪙 Coins earned: $coinsEarned');
        
//         _setLoading(false);
//         return true;
//       } else {
//         _setError(result['message']);
//         _setLoading(false);
//         return false;
//       }
//     } catch (e) {
//       _setError('Failed to add steps: $e');
//       _setLoading(false);
//       return false;
//     }
//   }

//   // Redeem coins to wallet
//   Future<bool> redeemCoins() async {
//     try {
//       if (_totalCoins <= 0) {
//         _setError('No coins to redeem');
//         return false;
//       }

//       _setLoading(true);
//       clearError();

//       final staffId = await SharedPrefsHelper.getStaffIdWithFallback();
//       if (staffId.isEmpty) {
//         _setError('Staff ID not found. Please login again.');
//         _setLoading(false);
//         return false;
//       }

//       // Call the add coins API
//       final result = await TrackerServices.addCoinsToWallet(
//         staffId: staffId,
//         coins: _totalCoins,
//       );

//       if (result['success']) {
//         int redeemedCoins = _totalCoins;
//         _totalCoins = 0; // Reset coins to 0 after redemption
        
//         // Save to SharedPreferences
//         await _saveToPreferences();
        
//         print('✅ Coins redeemed successfully: $redeemedCoins');
        
//         _setLoading(false);
//         return true;
//       } else {
//         _setError(result['message']);
//         _setLoading(false);
//         return false;
//       }
//     } catch (e) {
//       _setError('Failed to redeem coins: $e');
//       _setLoading(false);
//       return false;
//     }
//   }

//   // Get all steps
//   Future<bool> getAllSteps() async {
//     try {
//       _setLoading(true);
//       clearError();

//       // Check if we need to reset for a new day
//       if (_isNewDay()) {
//         _performMidnightReset();
//       }

//       final staffId = await SharedPrefsHelper.getStaffIdWithFallback();
//       if (staffId.isEmpty) {
//         _setError('Staff ID not found. Please login again.');
//         _setLoading(false);
//         return false;
//       }

//       final result = await TrackerServices.getAllSteps(staffId: staffId);

//       if (result['success']) {
//         _stepsData = result['data'];
        
//         if (_stepsData != null) {
//           // Use server data for today's steps but keep local coin calculation
//           if (_stepsData!['todayTotalSteps'] != null) {
//             _currentSteps = _stepsData!['todayTotalSteps'];
            
//             // Recalculate coins based on current steps and milestone status
//             if (_currentSteps >= _dailyMilestone && !_dailyMilestoneAchieved) {
//               _dailyMilestoneAchieved = true;
//               await _saveToPreferences();
//             }
//           }
          
//           // Update progress history from server data
//           if (_stepsData!['stepsSummary'] != null && _stepsData!['stepsSummary'] is List) {
//             List serverHistory = _stepsData!['stepsSummary'];
//             _progressHistory = serverHistory.map((item) => {
//               'date': item['date'],
//               'steps': item['stepsCount'],
//               'coins': item['coinsEarned'],
//               'timestamp': DateTime.now().toIso8601String(),
//             }).toList();
//           }
//         }
        
//         print('✅ Steps retrieved successfully');
//         _setLoading(false);
//         return true;
//       } else {
//         _setError(result['message']);
//         _setLoading(false);
//         return false;
//       }
//     } catch (e) {
//       _setError('Failed to get steps: $e');
//       _setLoading(false);
//       return false;
//     }
//   }

//   // Simulate adding steps (for testing)
//   Future<bool> simulateSteps(int steps) async {
//     return await addSteps(steps);
//   }

//   // Initialize data when screen loads
//   Future<void> initializeData() async {
//     // Load from SharedPreferences first
//     await _loadFromPreferences();
    
//     // Setup midnight reset timer
//     _setupMidnightResetTimer();
    
//     // Check if we need to reset for a new day
//     if (_isNewDay()) {
//       _performMidnightReset();
//     }
    
//     // Get server data
//     await getAllSteps();
    
//     // Auto-start motion tracking
//     await startMotionTracking();
//   }

//   // Refresh data
//   Future<void> refreshData() async {
//     await getAllSteps();
//   }

//   // Clean up resources
//   @override
//   void dispose() {
//     stopMotionTracking();
//     _midnightTimer?.cancel();
//     super.dispose();
//   }
// }





import 'dart:async';
import 'dart:convert';
import 'dart:math' as math;
import 'package:flutter/foundation.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TrackerProvider extends ChangeNotifier {
  bool _isLoading = false;
  String _errorMessage = '';
  Map<String, dynamic>? _stepsData;
  int _currentSteps = 0;
  int _totalCoins = 0;
  List<Map<String, dynamic>> _progressHistory = [];
  
  // Motion detection variables
  StreamSubscription<AccelerometerEvent>? _accelerometerSubscription;
  bool _isTrackingMotion = false;
  double _lastMagnitude = 0;
  DateTime _lastStepTime = DateTime.now();
  int _stepBuffer = 0;
  List<double> _magnitudeHistory = [];
  static const double _stepThreshold = 12.0;
  static const int _minTimeBetweenSteps = 300;
  static const int _bufferSize = 10;

  // Date tracking variables
  DateTime _lastResetDate = DateTime.now();
  Timer? _midnightTimer;
  
  // Milestone tracking
  bool _milestoneAchieved = false;
  static const int _milestoneTarget = 100;
  static const int _milestoneBonus = 10;
  static const int _coinsPerTenSteps = 1;
  static const int _coinsPerStepAfterMilestone = 4;

  // Getters
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;
  Map<String, dynamic>? get stepsData => _stepsData;
  int get currentSteps => _currentSteps;
  int get totalCoins => _totalCoins;
  List<Map<String, dynamic>> get progressHistory => _progressHistory;
  bool get isTrackingMotion => _isTrackingMotion;
  bool get milestoneAchieved => _milestoneAchieved;

  // Calculate progress percentage (assuming goal is 10000 steps)
  double get progressPercentage {
    return _currentSteps / 10000.0;
  }

  // Set loading state
  void _setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  // Set error message
  void _setError(String error) {
    _errorMessage = error;
    notifyListeners();
  }

  // Clear error message
  void clearError() {
    _errorMessage = '';
    notifyListeners();
  }

  // Load data from SharedPreferences
  Future<void> _loadFromPreferences() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      
      // Load total coins (local coins not synced to server)
      _totalCoins = prefs.getInt('local_total_coins') ?? 0;
      
      // Load last reset date
      final lastResetString = prefs.getString('last_reset_date');
      if (lastResetString != null) {
        _lastResetDate = DateTime.parse(lastResetString);
      }
      
      // Load milestone status for today
      final today = DateTime.now();
      final todayKey = 'milestone_${today.year}_${today.month}_${today.day}';
      _milestoneAchieved = prefs.getBool(todayKey) ?? false;
      
      print('📱 Data loaded from SharedPreferences');
      print('   Local Coins: $_totalCoins');
      print('   Last reset: $_lastResetDate');
      print('   Milestone achieved: $_milestoneAchieved');
      
    } catch (e) {
      print('❌ Error loading from SharedPreferences: $e');
    }
  }

  // Save data to SharedPreferences
  Future<void> _saveToPreferences() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      
      await prefs.setInt('local_total_coins', _totalCoins);
      await prefs.setString('last_reset_date', _lastResetDate.toIso8601String());
      
      // Save milestone status for today
      final today = DateTime.now();
      final todayKey = 'milestone_${today.year}_${today.month}_${today.day}';
      await prefs.setBool(todayKey, _milestoneAchieved);
      
    } catch (e) {
      print('❌ Error saving to SharedPreferences: $e');
    }
  }

  // Setup midnight reset timer
  void _setupMidnightResetTimer() {
    _midnightTimer?.cancel();
    
    final now = DateTime.now();
    final tomorrow = DateTime(now.year, now.month, now.day + 1);
    final timeUntilMidnight = tomorrow.difference(now);
    
    print('⏰ Setting up midnight reset timer. Time until midnight: ${timeUntilMidnight.inMinutes} minutes');
    
    _midnightTimer = Timer(timeUntilMidnight, () {
      _performMidnightReset();
      // Setup the timer again for the next day
      _setupMidnightResetTimer();
    });
  }

  // Perform midnight reset
  void _performMidnightReset() {
    print('🌙 Performing midnight reset...');
    
    // Reset milestone status for new day
    _milestoneAchieved = false;
    
    // Update last reset date
    _lastResetDate = DateTime.now();
    
    // Save to SharedPreferences
    _saveToPreferences();
    
    // Refresh data from server (this will reset current steps)
    getAllSteps();
    
    print('✅ Midnight reset completed. Milestone reset for new day');
  }

  // Check if a new day has started
  bool _isNewDay() {
    final now = DateTime.now();
    final lastReset = DateTime(_lastResetDate.year, _lastResetDate.month, _lastResetDate.day);
    final today = DateTime(now.year, now.month, now.day);
    
    return today.isAfter(lastReset);
  }

  // Calculate coins for steps with the new logic
  int _calculateCoinsForSteps(int previousSteps, int newSteps) {
    int coinsEarned = 0;
    
    // Check if milestone was just achieved
    if (previousSteps < _milestoneTarget && newSteps >= _milestoneTarget && !_milestoneAchieved) {
      _milestoneAchieved = true;
      coinsEarned += _milestoneBonus;
      print('🎉 100 steps milestone achieved! Bonus: $_milestoneBonus coins');
    }
    
    // Calculate coins for steps before milestone (1 coin per 10 steps)
    int stepsToProcessBefore = math.min(newSteps, _milestoneTarget);
    int previousStepsBefore = math.min(previousSteps, _milestoneTarget);
    
    int coinsBefore = (stepsToProcessBefore / 10).floor() - (previousStepsBefore / 10).floor();
    coinsEarned += coinsBefore;
    
    // Calculate coins for steps after milestone (4 coins per step)
    if (newSteps > _milestoneTarget) {
      int stepsAfterMilestone = newSteps - _milestoneTarget;
      int previousStepsAfterMilestone = math.max(0, previousSteps - _milestoneTarget);
      
      int newStepsAfterMilestone = stepsAfterMilestone - previousStepsAfterMilestone;
      int coinsAfter = newStepsAfterMilestone * _coinsPerStepAfterMilestone;
      coinsEarned += coinsAfter;
    }
    
    return coinsEarned;
  }

  // Start motion tracking
  Future<void> startMotionTracking() async {
    try {
      if (_isTrackingMotion) return;

      // Check if we need to reset for a new day
      if (_isNewDay()) {
        _performMidnightReset();
      }

      print('🚶 Starting motion tracking...');
      _isTrackingMotion = true;
      _stepBuffer = 0;
      _magnitudeHistory.clear();
      
      // Setup midnight reset timer
      _setupMidnightResetTimer();
      
      // Listen to accelerometer events
      _accelerometerSubscription = accelerometerEvents.listen(
        (AccelerometerEvent event) {
          _processAccelerometerData(event);
        },
        onError: (error) {
          print('❌ Accelerometer error: $error');
          _setError('Motion sensor error: $error');
        },
      );
      
      notifyListeners();
      print('✅ Motion tracking started successfully');
    } catch (e) {
      print('❌ Failed to start motion tracking: $e');
      _setError('Failed to start motion tracking: $e');
    }
  }

  // Stop motion tracking
  void stopMotionTracking() {
    if (!_isTrackingMotion) return;

    print('🛑 Stopping motion tracking...');
    _accelerometerSubscription?.cancel();
    _accelerometerSubscription = null;
    _isTrackingMotion = false;
    _magnitudeHistory.clear();
    
    // Cancel midnight timer
    _midnightTimer?.cancel();
    _midnightTimer = null;
    
    notifyListeners();
    print('✅ Motion tracking stopped');
  }

  // Process accelerometer data to detect steps
  void _processAccelerometerData(AccelerometerEvent event) {
    // Check if we need to reset for a new day
    if (_isNewDay()) {
      _performMidnightReset();
    }

    // Calculate magnitude of acceleration vector
    double magnitude = math.sqrt(
      event.x * event.x + event.y * event.y + event.z * event.z
    );
    
    // Add to history buffer
    _magnitudeHistory.add(magnitude);
    if (_magnitudeHistory.length > _bufferSize) {
      _magnitudeHistory.removeAt(0);
    }
    
    // Only process if we have enough data points
    if (_magnitudeHistory.length < 3) return;
    
    // Apply simple low-pass filter to smooth the data
    double smoothedMagnitude = _magnitudeHistory.reduce((a, b) => a + b) / _magnitudeHistory.length;
    
    // Detect step using peak detection algorithm
    if (_isStep(smoothedMagnitude)) {
      DateTime now = DateTime.now();
      int timeDiff = now.difference(_lastStepTime).inMilliseconds;
      
      // Check minimum time between steps to avoid false positives
      if (timeDiff > _minTimeBetweenSteps) {
        _stepBuffer++;
        _lastStepTime = now;
        
        print('👟 Step detected! Buffer: $_stepBuffer');
        
        // Update steps every 5 detected steps to reduce API calls
        if (_stepBuffer >= 5) {
          _processStepBuffer();
        }
      }
    }
    
    _lastMagnitude = smoothedMagnitude;
  }

  // Determine if current reading indicates a step
  bool _isStep(double currentMagnitude) {
    if (_magnitudeHistory.length < 3) return false;
    
    // Get previous readings
    double prev1 = _magnitudeHistory[_magnitudeHistory.length - 2];
    double prev2 = _magnitudeHistory[_magnitudeHistory.length - 3];
    
    // Look for peak: previous < current > next pattern
    // and magnitude above threshold
    bool isPeak = prev2 < prev1 && prev1 > currentMagnitude && 
                  prev1 > _stepThreshold;
    
    return isPeak;
  }

  // Process accumulated steps in buffer
  Future<void> _processStepBuffer() async {
    if (_stepBuffer <= 0) return;
    
    int stepsToAdd = _stepBuffer;
    _stepBuffer = 0;
    
    // Send to API first
    try {
      final staffId = await _getStaffId();
      if (staffId.isNotEmpty) {
        final result = await TrackerServices.addSteps(
          staffId: staffId,
          steps: stepsToAdd,
        );
        
        if (result['success']) {
          print('✅ Steps synced to server: $stepsToAdd');
          
          // Update local data from server response
          if (result['data'] != null) {
            Map<String, dynamic> data = result['data'];
            
            // Update current steps from server response
            int previousSteps = _currentSteps;
            if (data['steps'] != null && data['steps'].isNotEmpty) {
              _currentSteps = data['steps'][0]['stepsCount'] ?? _currentSteps;
            }
            
            // Calculate coins for the new steps
            int coinsEarned = _calculateCoinsForSteps(previousSteps, _currentSteps);
            _totalCoins += coinsEarned;
            
            // Save to SharedPreferences
            await _saveToPreferences();
            
            notifyListeners();
            
            print('✅ Steps updated: $_currentSteps, Local coins earned: $coinsEarned, Total local coins: $_totalCoins');
          }
        } else {
          print('❌ Failed to sync steps: ${result['message']}');
          // Even if API fails, we can still update local steps and coins
          _updateLocalStepsAndCoins(stepsToAdd);
        }
      } else {
        // If no staff ID, still update local data
        _updateLocalStepsAndCoins(stepsToAdd);
      }
    } catch (e) {
      print('❌ Error syncing steps: $e');
      // If API fails, still update local data
      _updateLocalStepsAndCoins(stepsToAdd);
    }
  }

  // Update local steps and coins when API is not available
  void _updateLocalStepsAndCoins(int stepsToAdd) {
    int previousSteps = _currentSteps;
    _currentSteps += stepsToAdd;
    
    // Calculate coins for the new steps
    int coinsEarned = _calculateCoinsForSteps(previousSteps, _currentSteps);
    _totalCoins += coinsEarned;
    
    // Save to SharedPreferences
    _saveToPreferences();
    
    notifyListeners();
    
    print('✅ Local steps updated: $_currentSteps, Coins earned: $coinsEarned');
  }

  // Get staff ID helper
  Future<String> _getStaffId() async {
    // Replace this with your actual method to get staff ID
    // For now, returning a placeholder
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getString('staff_id') ?? '';
    } catch (e) {
      print('❌ Error getting staff ID: $e');
      return '';
    }
  }

  // Get all steps from server
  Future<bool> getAllSteps() async {
    try {
      _setLoading(true);
      clearError();

      final staffId = await _getStaffId();
      if (staffId.isEmpty) {
        _setError('Staff ID not found. Please login again.');
        _setLoading(false);
        return false;
      }

      final result = await TrackerServices.getAllSteps(staffId: staffId);

      if (result['success']) {
        _stepsData = result['data'];
        
        if (_stepsData != null) {
          // Update current steps from server
          _currentSteps = _stepsData!['todayTotalSteps'] ?? 0;
          
          // Update progress history from server data
          if (_stepsData!['stepsSummary'] != null && _stepsData!['stepsSummary'] is List) {
            List serverHistory = _stepsData!['stepsSummary'];
            _progressHistory = serverHistory.map((item) => {
              'date': item['date'] ?? 'Unknown',
              'steps': item['stepsCount'] ?? 0,
              'coins': item['coinsEarned'] ?? 0,
              'day': item['day'] ?? '',
            }).toList();
          }
          
          print('✅ Server data loaded - Steps: $_currentSteps, History: ${_progressHistory.length} entries');
        }
        
        _setLoading(false);
        return true;
      } else {
        _setError(result['message']);
        _setLoading(false);
        return false;
      }
    } catch (e) {
      _setError('Failed to get steps: $e');
      _setLoading(false);
      return false;
    }
  }

  // Redeem coins to wallet
  Future<bool> redeemCoins() async {
    try {
      if (_totalCoins <= 0) {
        _setError('No coins to redeem');
        return false;
      }

      _setLoading(true);
      clearError();

      final staffId = await _getStaffId();
      if (staffId.isEmpty) {
        _setError('Staff ID not found. Please login again.');
        _setLoading(false);
        return false;
      }

      // Call the redeem coins API
      final result = await TrackerServices.redeemCoins(
        staffId: staffId,
        coins: _totalCoins,
      );

      if (result['success']) {
        int redeemedCoins = _totalCoins;
        _totalCoins = 0; // Reset local coins to 0 after redemption
        
        // Save to SharedPreferences
        await _saveToPreferences();
        
        print('✅ Coins redeemed successfully: $redeemedCoins');
        
        _setLoading(false);
        return true;
      } else {
        _setError(result['message']);
        _setLoading(false);
        return false;
      }
    } catch (e) {
      _setError('Failed to redeem coins: $e');
      _setLoading(false);
      return false;
    }
  }

  // Manual step addition (for testing)
  Future<bool> addSteps(int steps) async {
    try {
      _setLoading(true);
      clearError();

      final staffId = await _getStaffId();
      if (staffId.isEmpty) {
        _setError('Staff ID not found. Please login again.');
        _setLoading(false);
        return false;
      }

      final result = await TrackerServices.addSteps(
        staffId: staffId,
        steps: steps,
      );

      if (result['success']) {
        // Update from server response
        if (result['data'] != null) {
          Map<String, dynamic> data = result['data'];
          
          int previousSteps = _currentSteps;
          if (data['steps'] != null && data['steps'].isNotEmpty) {
            _currentSteps = data['steps'][0]['stepsCount'] ?? _currentSteps;
          }
          
          // Calculate coins for the new steps
          int coinsEarned = _calculateCoinsForSteps(previousSteps, _currentSteps);
          _totalCoins += coinsEarned;
          
          // Save to SharedPreferences
          await _saveToPreferences();
          
          print('✅ Steps added successfully: $steps, Coins earned: $coinsEarned');
        }
        
        _setLoading(false);
        return true;
      } else {
        _setError(result['message']);
        _setLoading(false);
        return false;
      }
    } catch (e) {
      _setError('Failed to add steps: $e');
      _setLoading(false);
      return false;
    }
  }

  // Simulate adding steps (for testing)
  Future<bool> simulateSteps(int steps) async {
    return await addSteps(steps);
  }

  // Initialize data when screen loads
  Future<void> initializeData() async {
    // Load local data from SharedPreferences first
    await _loadFromPreferences();
    
    // Check if we need to reset for a new day
    if (_isNewDay()) {
      _performMidnightReset();
    } else {
      // Setup midnight reset timer
      _setupMidnightResetTimer();
      
      // Get server data
      await getAllSteps();
      
      // Auto-start motion tracking
      await startMotionTracking();
    }
  }

  // Refresh data
  Future<void> refreshData() async {
    await getAllSteps();
  }

  // Clean up resources
  @override
  void dispose() {
    stopMotionTracking();
    _midnightTimer?.cancel();
    super.dispose();
  }
}