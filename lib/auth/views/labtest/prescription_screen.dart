
import 'package:consultation_app/Helper/auth_preference.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';
import 'package:permission_handler/permission_handler.dart';

class PrescriptionScreen extends StatefulWidget {
  const PrescriptionScreen({super.key});

  @override
  State<PrescriptionScreen> createState() => _PrescriptionScreenState();
}

class _PrescriptionScreenState extends State<PrescriptionScreen> {
  final ImagePicker _imagePicker = ImagePicker();
  bool _isUploading = false;
  String? _uploadedFileName;
  String? _uploadMessage;
  Color _messageColor = Colors.green;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        
        title: const Text('Upload Prescription',style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
        elevation: 1,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Header card
              Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.upload_file,
                          size: 32,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Upload Prescription',
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                            ),
                            SizedBox(height: 6),
                            Text(
                              'Upload an image or PDF. Supported: JPG, PNG, PDF. Max 10MB.',
                              style: TextStyle(fontSize: 13, color: Colors.black54),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Buttons
              Row(
                children: [
                  Expanded(
                    child: _actionButton(
                      label: 'Camera',
                      icon: Icons.camera_alt,
                      onTap: _pickImageFromCamera,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _actionButton(
                      label: 'Gallery',
                      icon: Icons.photo_library,
                      onTap: _pickImageFromGallery,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              _actionButton(
                label: 'Upload PDF',
                icon: Icons.picture_as_pdf,
                onTap: _pickPDF,
                fullWidth: true,
              ),

              const SizedBox(height: 20),

              // Status tile
              if (_uploadedFileName != null)
                ListTile(
                  tileColor: Colors.green.withOpacity(0.06),
                  leading: const Icon(Icons.check_circle, color: Colors.green),
                  title: Text(
                    _uploadedFileName!,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  subtitle: const Text('File selected'),
                ),

              if (_uploadMessage != null)
                Container(
                  margin: const EdgeInsets.only(top: 12),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: _messageColor.withOpacity(0.08),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: _messageColor.withOpacity(0.4)),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        _messageColor == Colors.green ? Icons.check_circle : Icons.error,
                        color: _messageColor,
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          _uploadMessage!,
                          style: TextStyle(color: _messageColor, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ),

              if (_isUploading)
                Column(
                  children: const [
                    SizedBox(height: 16),
                    LinearProgressIndicator(),
                    SizedBox(height: 8),
                    Text('Uploading... Please wait'),
                  ],
                ),

              const Spacer(),

              // Guidelines
              Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('Upload Guidelines', style: TextStyle(fontWeight: FontWeight.w700)),
                      SizedBox(height: 8),
                      Text('• Supported formats: JPG, PNG, PDF'),
                      Text('• Maximum file size: 10MB'),
                      Text('• Ensure prescription is clear and readable'),
                      Text('• Include all pages if multiple'),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 8),

              // Primary action (optional)
              // ElevatedButton(
              //   onPressed: _isUploading ? null : () {
              //     // optional: submit or navigate back
              //     if (_uploadedFileName == null) {
              //       _showError('Please select a file before submitting.');
              //     } else {
              //       // maybe show a confirmation or close
              //       Navigator.of(context).maybePop();
              //     }
              //   },
              //   style: ElevatedButton.styleFrom(
                  
              //     padding: const EdgeInsets.symmetric(vertical: 14),
              //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              //   ),
              //   child: const Text('Done'),
              // ),

              ElevatedButton(
  onPressed: _isUploading
      ? null
      : () {
          if (_uploadedFileName == null) {
            _showError('Please select a file before submitting.');
          } else {
            Navigator.of(context).maybePop();
          }
        },
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.white, // ✅ white background
    foregroundColor: Colors.black, // ✅ makes text/icon black
    padding: const EdgeInsets.symmetric(vertical: 14),
    shape: RoundedRectangleBorder(
      
      borderRadius: BorderRadius.circular(8),
      side: BorderSide(
        color:  Colors.white
      )
      
    ),
    elevation: 0, // optional: removes shadow
  ),
  child: const Text('Done'),
)

            ],
          ),
        ),
      ),
    );
  }

  // Widget _actionButton({
  //   required String label,
  //   required IconData icon,
  //   required VoidCallback onTap,
  //   bool fullWidth = false,
  // }) {
  //   return SizedBox(
  //     height: 54,
  //     child: ElevatedButton.icon(
  //       onPressed: _isUploading ? null : onTap,
        
  //       icon: Icon(icon),
  //       label: Text(label),
  //       style: ElevatedButton.styleFrom(
  //         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
  //         elevation: 0,
  //       ),
  //     ),
  //   );
  // }



  Widget _actionButton({
  required String label,
  required IconData icon,
  required VoidCallback onTap,
  bool fullWidth = false,
}) {
  return SizedBox(
    height: 54,
    child: ElevatedButton.icon(
      onPressed: _isUploading ? null : onTap,
      icon: Icon(icon, color: Colors.black), // make icon visible
      label: Text(
        label,
        style: const TextStyle(color: Colors.black), // make text visible
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white, // set button background to white
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        elevation: 0,
      ),
    ),
  );
}


  Future<void> _requestPermissions() async {
    await [
      Permission.camera,
      Permission.storage,
    ].request();
  }

  Future<void> _pickImageFromCamera() async {
    try {
      await _requestPermissions();

      final XFile? image = await _imagePicker.pickImage(
        source: ImageSource.camera,
        maxWidth: 1920,
        maxHeight: 1080,
        imageQuality: 85,
      );

      if (image != null) {
        await _uploadFile(File(image.path));
      }
    } catch (e) {
      _showError('Error taking photo: ${e.toString()}');
    }
  }

  Future<void> _pickImageFromGallery() async {
    try {
      await _requestPermissions();

      final XFile? image = await _imagePicker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 1920,
        maxHeight: 1080,
        imageQuality: 85,
      );

      if (image != null) {
        await _uploadFile(File(image.path));
      }
    } catch (e) {
      _showError('Error picking image: ${e.toString()}');
    }
  }

  Future<void> _pickPDF() async {
    try {
      await _requestPermissions();

      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
        allowMultiple: false,
      );

      if (result != null && result.files.single.path != null) {
        File file = File(result.files.single.path!);
        await _uploadFile(file);
      }
    } catch (e) {
      _showError('Error picking PDF: ${e.toString()}');
    }
  }

  Future<void> _uploadFile(File file) async {
    setState(() {
      _isUploading = true;
      _uploadMessage = null;
      _uploadedFileName = file.path.split('/').last;
    });

    try {
      // Get staff ID from SharedPreferences
      String staffId = await SharedPrefsHelper.getStaffIdWithFallback();

      if (staffId.isEmpty) {
        throw Exception('Staff ID not found. Please login again.');
      }

      // Get user token for authorization
      String? token = await SharedPrefsHelper.getUserToken();

      // Create multipart request
      var uri = Uri.parse('http://31.97.206.144:4051/api/staff/userupload/$staffId');
      var request = http.MultipartRequest('PUT', uri);

      // Add authorization header if token exists
      if (token != null && token.isNotEmpty) {
        request.headers['Authorization'] = 'Bearer $token';
      }
      request.headers['Content-Type'] = 'multipart/form-data';

      // Add file to request
      var multipartFile = await http.MultipartFile.fromPath(
        'file',
        file.path,
        filename: file.path.split('/').last,
      );
      request.files.add(multipartFile);

      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);


      print('responseeeeeeeeeeeeeeeeeeeeee ${response.body}');

  print('responseeeeeeeeeeeeeeeeeeeeee ${response.statusCode}');
      if (response.statusCode == 200 || response.statusCode == 201) {
        setState(() {
          _uploadMessage = 'File uploaded successfully!';
          _messageColor = Colors.green;
        });
        _showSuccessDialog();
      } else {
        var errorData = jsonDecode(response.body);
        throw Exception(errorData['message'] ?? 'Upload failed');
      }
    } catch (e) {
      _showError('Upload failed: ${e.toString()}');
    } finally {
      setState(() {
        _isUploading = false;
      });
    }
  }

  void _showError(String message) {
    setState(() {
      _uploadMessage = message;
      _messageColor = Colors.red;
      _uploadedFileName = null;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 4),
      ),
    );
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          title: Row(
            children: [
              Icon(Icons.check_circle, color: Colors.green.shade600),
              const SizedBox(width: 8),
              const Text('Success!'),
            ],
          ),
          content: const Text(
            'Your prescription has been uploaded successfully. It will be processed shortly.',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
