import 'dart:io';
import 'package:consultation_app/auth/views/provider/chat_provider.dart';
import 'package:consultation_app/auth/views/provider/profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:gal/gal.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:consultation_app/auth/views/api/chat_services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path/path.dart' as path;
import 'package:permission_handler/permission_handler.dart';
import 'package:http/http.dart' as http;

class ChatScreen extends StatefulWidget {
  final Doctor? selectedDoctor;

  const ChatScreen({
    super.key,
    this.selectedDoctor,
  });

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> with WidgetsBindingObserver {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    if (widget.selectedDoctor != null) {
      print("=== DOCTOR DEBUG INFO ===");
      print("Doctor Name: ${widget.selectedDoctor!.name}");
      print("Doctor Email: ${widget.selectedDoctor!.email}");
      print("Specialization: '${widget.selectedDoctor!.specialization}'");
      print("Consultation Type: '${widget.selectedDoctor!.consultationType}'");
      print("Qualification: '${widget.selectedDoctor!.qualification}'");
      print("Category: '${widget.selectedDoctor!.category}'");
      print("=========================");

      // Also print the raw JSON to see what data you're getting
      print("Doctor JSON: ${widget.selectedDoctor!.toJson()}");
    }

    super.initState();

    print("DoctorId: ${widget.selectedDoctor?.id}");
    WidgetsBinding.instance.addObserver(this);

    // Initialize provider and set selected doctor if provided
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final chatProvider = Provider.of<ChatProvider>(context, listen: false);
      if (widget.selectedDoctor != null) {
        chatProvider.setSelectedDoctor(widget.selectedDoctor!);
      }
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final chatProvider = Provider.of<ChatProvider>(context, listen: false);

    switch (state) {
      case AppLifecycleState.resumed:
        // App came to foreground - reconnect if needed
        if (!chatProvider.isSocketConnected) {
          chatProvider.reconnectSocket();
        }
        break;
      case AppLifecycleState.paused:
      case AppLifecycleState.detached:
        // App went to background
        break;
      default:
        break;
    }
  }

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      });
    }
  }

  Future<void> _launchVideoCall() async {
    const String meetingLink = "https://meet.jit.si/4a0ei6sama";

    try {
      final Uri uri = Uri.parse(meetingLink);

      if (await canLaunchUrl(uri)) {
        await launchUrl(
          uri,
          mode: LaunchMode.externalApplication,
        );
      } else {
        throw Exception('Could not launch video call');
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to launch video call: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  void _sendMessage() async {
    final message = _messageController.text.trim();
    if (message.isEmpty) return;

    final chatProvider = Provider.of<ChatProvider>(context, listen: false);

    // Clear the input field immediately
    _messageController.clear();

    // Stop typing indicator
    chatProvider.sendTyping(false);

    // Send message
    final success = await chatProvider.sendMessage(message);

    if (success) {
      // Scroll to bottom after sending
      _scrollToBottom();
    } else {
      // Show error snackbar
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(chatProvider.error.isNotEmpty
                ? chatProvider.error
                : 'Failed to send message'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  Future<void> _sendFileMessage(File file) async {
    final chatProvider = Provider.of<ChatProvider>(context, listen: false);

    // Show loading indicator
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Row(
            children: [
              SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
              SizedBox(width: 16),
              Text('Sending file...'),
            ],
          ),
          duration: Duration(seconds: 3),
        ),
      );
    }

    try {
      final success = await chatProvider.sendFileMessage(file);

      if (success) {
        _scrollToBottom();
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('File sent successfully!'),
              backgroundColor: Colors.green,
              duration: Duration(seconds: 2),
            ),
          );
        }
      } else {
        throw Exception('Failed to send file');
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to send file: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  Future _downloadFile(String fileUrl, String fileName) async {
    // Determine file type
    final extension = fileName.toLowerCase();
    final isImage = extension.endsWith('.jpg') ||
        extension.endsWith('.jpeg') ||
        extension.endsWith('.png') ||
        extension.endsWith('.gif') ||
        extension.endsWith('.webp');
    final isVideo = extension.endsWith('.mp4') ||
        extension.endsWith('.mov') ||
        extension.endsWith('.avi') ||
        extension.endsWith('.mkv') ||
        extension.endsWith('.webm');
    final isPdf = extension.endsWith('.pdf');

    // Request appropriate permissions
    PermissionStatus status;
    if (isImage || isVideo) {
      status = await Permission.photos.status;
      if (!status.isGranted) {
        status = await Permission.photos.request();
      }
    } else if (isPdf) {
      if (Platform.isAndroid) {
        status = await Permission.manageExternalStorage.status;
        if (!status.isGranted) {
          status = await Permission.manageExternalStorage.request();
        }
      } else {
        status = await Permission.storage.status;
        if (!status.isGranted) {
          status = await Permission.storage.request();
        }
      }
    } else {
      status = await Permission.storage.status;
      if (!status.isGranted) {
        status = await Permission.storage.request();
      }
    }

    if (!status.isGranted) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(isPdf
                ? 'Storage permission is required to save PDFs'
                : 'Photos permission is required to save files to gallery'),
            backgroundColor: Colors.red,
          ),
        );
      }
      return;
    }

    // Show loading indicator
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Row(
            children: [
              SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
              SizedBox(width: 16),
              Text('Downloading file...'),
            ],
          ),
          duration: Duration(seconds: 5),
        ),
      );
    }

    try {
      // Download file
      final response = await http.get(Uri.parse(fileUrl));
      if (response.statusCode == 200) {
        final bytes = response.bodyBytes;

        if (isImage || isVideo) {
          // Save media files to gallery using gal
          final tempDir = await getTemporaryDirectory();
          final filePath = '${tempDir.path}/$fileName';
          final file = File(filePath);
          await file.writeAsBytes(bytes);

          if (isVideo) {
            await Gal.putVideo(file.path);
          } else {
            await Gal.putImage(file.path);
          }
        } else {
          // Save PDFs and other files to Downloads folder
          Directory? downloadsDir;
          if (Platform.isAndroid) {
            downloadsDir = Directory('/storage/emulated/0/Download');
          } else if (Platform.isIOS) {
            downloadsDir = await getApplicationDocumentsDirectory();
          }

          if (downloadsDir != null) {
            final filePath = '${downloadsDir.path}/$fileName';
            final file = File(filePath);
            await file.writeAsBytes(bytes);
          }
        }

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(isImage || isVideo
                  ? 'File saved to gallery'
                  : 'File saved to Downloads'),
              backgroundColor: Colors.green,
            ),
          );
        }
      } else {
        throw Exception('Failed to download: ${response.statusCode}');
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to download file: ${e.toString()}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  Widget _buildConnectionStatus(bool isConnected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: isConnected ? Colors.green.shade100 : Colors.red.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: isConnected ? Colors.green : Colors.red,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 6),
          Text(
            isConnected ? 'Connected' : 'Connecting...',
            style: TextStyle(
              fontSize: 12,
              color: isConnected ? Colors.green.shade700 : Colors.red.shade700,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFileAttachment(ChatMessage message) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(top: 4),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                _getFileIcon(message.actualFileName),
                size: 24,
                color: Colors.blue,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      message.actualFileName.isNotEmpty
                          ? message.actualFileName
                          : 'Unknown file',
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (message.formattedFileSize.isNotEmpty)
                      Text(
                        message.formattedFileSize,
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 12,
                        ),
                      ),
                  ],
                ),
              ),
              if (message.file != null && message.file!.isNotEmpty)
                GestureDetector(
                  onTap: () => _downloadFile(
                      message.actualFileUrl,
                      message.actualFileName.isNotEmpty
                          ? message.actualFileName
                          : 'downloaded_file'),
                  child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue),
                          borderRadius: BorderRadius.circular(30)),
                      child: const Icon(Icons.download, color: Colors.blue)),
                ),
            ],
          ),
          if (message.isImage &&
              message.file != null &&
              message.file!.isNotEmpty)
            Container(
              margin: const EdgeInsets.only(top: 8),
              constraints: const BoxConstraints(maxHeight: 200),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  message.actualFileUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 100,
                      color: Colors.grey.shade200,
                      child: const Center(
                        child: Icon(Icons.error, color: Colors.red),
                      ),
                    );
                  },
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Container(
                      height: 100,
                      color: Colors.grey.shade200,
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  },
                ),
              ),
            ),
        ],
      ),
    );
  }

  IconData _getFileIcon(String fileName) {
    final extension = path.extension(fileName).toLowerCase();

    switch (extension) {
      case '.pdf':
        return Icons.picture_as_pdf;
      case '.doc':
      case '.docx':
        return Icons.description;
      case '.xls':
      case '.xlsx':
        return Icons.table_chart;
      case '.ppt':
      case '.pptx':
        return Icons.slideshow;
      case '.jpg':
      case '.jpeg':
      case '.png':
      case '.gif':
      case '.bmp':
      case '.webp':
        return Icons.image;
      case '.mp4':
      case '.avi':
      case '.mov':
        return Icons.video_file;
      case '.mp3':
      case '.wav':
      case '.aac':
        return Icons.audio_file;
      case '.zip':
      case '.rar':
      case '.7z':
        return Icons.archive;
      case '.txt':
        return Icons.text_snippet;
      default:
        return Icons.attach_file;
    }
  }

  Widget _buildMessageBubble(ChatMessage message, bool isCurrentUser) {
        final profileProvider = Provider.of<ProfileUpdateProvider>(context);
    final profile = profileProvider.profile;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment:
            isCurrentUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (!isCurrentUser) ...[
            ClipOval(
              child: widget.selectedDoctor!.image.isNotEmpty
                  ? Image.network(
                      widget.selectedDoctor!.image.startsWith('http')
                          ? widget.selectedDoctor!.image
                          : 'http://31.97.206.144:4051${widget.selectedDoctor!.image}',
                      width: 40,
                      height: 40,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(
                          Icons.person,
                          size: 30,
                          color: Colors.grey,
                        );
                      },
                    )
                  : Image.asset(
                      "lib/assets/chatimage.png",
                      width: 40,
                      height: 40,
                      fit: BoxFit.cover,
                    ),
            ),
            const SizedBox(width: 8),
          ],
          Flexible(
            child: Column(
              crossAxisAlignment: isCurrentUser
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment.start,
              children: [
                if (!isCurrentUser)
                  Text(
                    Provider.of<ChatProvider>(context).selectedDoctor?.name ??
                        "Doctor",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                if (isCurrentUser)
                  const Text(
                    "You",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                const SizedBox(height: 4),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: isCurrentUser ? Colors.blue : Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Show text message if not empty
                      if (message.message.isNotEmpty)
                        Text(
                          message.message,
                          style: TextStyle(
                            color: isCurrentUser ? Colors.white : Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      // Show file attachment if it's a file message
                      if (message.isFile) _buildFileAttachment(message),
                    ],
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      Provider.of<ChatProvider>(context, listen: false)
                          .formatMessageTime(message.timestamp),
                      style: const TextStyle(
                        fontSize: 10,
                        color: Colors.grey,
                      ),
                    ),
                    if (message.id.startsWith('temp_')) ...[
                      const SizedBox(width: 4),
                      SizedBox(
                        width: 10,
                        height: 10,
                        child: CircularProgressIndicator(
                          strokeWidth: 1,
                          valueColor: AlwaysStoppedAnimation<Color>(
                              Colors.grey.shade400),
                        ),
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),
          if (isCurrentUser) ...[
            const SizedBox(width: 8),
            // CircleAvatar(
            //   backgroundImage: AssetImage("lib/assets/chatscreenimage.png"),
            //   radius: 16,
            // ),
            CircleAvatar(
              radius: 15,
              backgroundImage: profile?.profileImage != null
                  ? NetworkImage(_sanitizeImageUrl(profile!.profileImage))
                  : const AssetImage('lib/assets/chatscreenimage.png')
                      as ImageProvider,
            ),
          ],
        ],
      ),
    );
  }

    String _sanitizeImageUrl(String url) {
    // Fix double slashes in URL path
    print(
        "Urlllllllllllllllllllllllllllllllllllllllllllllllllllllllllll: $url");
    final sanitizedUrl = url.replaceAll(RegExp(r'(?<!:)//'), '/');
    return ("http://31.97.206.144:4051$sanitizedUrl");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Chat",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 1,
        actions: [
          // Connection status indicator
          Consumer<ChatProvider>(
            builder: (context, chatProvider, child) {
              return Padding(
                padding: const EdgeInsets.only(right: 8),
                child: _buildConnectionStatus(chatProvider.isSocketConnected),
              );
            },
          ),
          // IconButton(
          //   icon: const Icon(
          //     Icons.video_call,
          //     color: Colors.green,
          //   ),
          //   onPressed: () {
          //     _launchVideoCall();
          //   },
          // ),
        ],
      ),
      body: Consumer<ChatProvider>(
        builder: (context, chatProvider, child) {
          // Show loading if initializing
          if (chatProvider.isLoading && chatProvider.messages.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          // Show error if no doctor selected
          if (chatProvider.selectedDoctor == null) {
            return const Center(
              child: Text(
                'Please select a doctor to start chatting',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            );
          }

          // Auto-scroll to bottom when new messages arrive
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (chatProvider.messages.isNotEmpty) {
              _scrollToBottom();
            }
          });

          return Column(
            children: [
              // Doctor info header
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  border:
                      Border(bottom: BorderSide(color: Colors.grey.shade300)),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 20, // Adjust radius as needed
                      backgroundColor:
                          const Color.fromARGB(255, 184, 184, 184), // Optional background color
                      child: ClipOval(
                        child: widget.selectedDoctor!.image.isNotEmpty
                            ? Image.network(
                                widget.selectedDoctor!.image.startsWith('http')
                                    ? widget.selectedDoctor!.image
                                    : 'http://31.97.206.144:4051${widget.selectedDoctor!.image}',
                                width: 40,
                                height: 40,
                                fit: BoxFit.contain,
                                errorBuilder: (context, error, stackTrace) {
                                  return const Icon(
                                    Icons.person,
                                    size: 30,
                                    color: Colors.grey,
                                  );
                                },
                              )
                            : Image.asset(
                                "lib/assets/chatimage.png",
                                width: 40,
                                height: 40,
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),

                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            chatProvider.selectedDoctor!.name,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          // Text(
                          //   chatProvider
                          //           .selectedDoctor!.consultationType.isNotEmpty
                          //       ? chatProvider.selectedDoctor!.consultationType
                          //       : 'General Consultation',
                          //   style: const TextStyle(
                          //     color: Colors.grey,
                          //     fontSize: 14,
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                    // Show reconnect button if disconnected
                    if (!chatProvider.isSocketConnected)
                      IconButton(
                        icon: const Icon(Icons.refresh, color: Colors.orange),
                        onPressed: () {
                          chatProvider.reconnectSocket();
                        },
                        tooltip: 'Reconnect',
                      ),
                  ],
                ),
              ),

              // Messages list
              Expanded(
                child: chatProvider.messages.isEmpty
                    ? const Center(
                        child: Text(
                          'No messages yet. Start a conversation!',
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      )
                    : ListView.builder(
                        controller: _scrollController,
                        padding: const EdgeInsets.all(16),
                        itemCount: chatProvider.messages.length,
                        itemBuilder: (context, index) {
                          final message = chatProvider.messages[index];
                          final isCurrentUser =
                              chatProvider.isStaffMessage(message);

                          return _buildMessageBubble(message, isCurrentUser);
                        },
                      ),
              ),

              // Error message (if any)
              // if (chatProvider.error.isNotEmpty)
              //   Container(
              //     width: double.infinity,
              //     padding: const EdgeInsets.all(8),
              //     color: Colors.red.shade100,
              //     child: Row(
              //       children: [
              //         Icon(Icons.error_outline,
              //             color: Colors.red.shade700, size: 16),
              //         const SizedBox(width: 8),
              //         // Expanded(
              //         //   child: Text(
              //         //     chatProvider.error,
              //         //     style: TextStyle(
              //         //         color: Colors.red.shade700, fontSize: 12),
              //         //   ),
              //         // ),
              //         // TextButton(
              //         //   onPressed: () {
              //         //     chatProvider._clearError();
              //         //   },
              //         //   child: Text('Dismiss', style: TextStyle(color: Colors.red.shade700)),
              //         // ),
              //       ],
              //     ),
              //   ),

              // Typing indicator
              // if (chatProvider.isTyping)
              //   Container(
              //     padding:
              //         const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              //     child: Row(
              //       children: [
              //         Text(
              //           'Doctor is typing...',
              //           style: TextStyle(
              //             color: Colors.grey.shade600,
              //             fontStyle: FontStyle.italic,
              //             fontSize: 12,
              //           ),
              //         ),
              //         const SizedBox(width: 8),
              //         SizedBox(
              //           width: 12,
              //           height: 12,
              //           child: CircularProgressIndicator(
              //             strokeWidth: 1,
              //             valueColor: AlwaysStoppedAnimation<Color>(
              //                 Colors.grey.shade400),
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),

              // Message input
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  border: Border(top: BorderSide(color: Colors.grey.shade300)),
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    IconButton(
                      icon:
                          Icon(Icons.attach_file, color: Colors.grey.shade600),
                      onPressed: () {
                        _showAttachmentOptions(context);
                      },
                    ),
                    Expanded(
                      child: TextField(
                        controller: _messageController,
                        decoration: InputDecoration(
                          hintText: "Write your message",
                          filled: true,
                          fillColor: Colors.grey.shade100,
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 10),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        onSubmitted: (_) => _sendMessage(),
                        onChanged: (text) {
                          // Send typing indicator
                          if (text.isNotEmpty) {
                            chatProvider.sendTyping(true);
                          } else {
                            chatProvider.sendTyping(false);
                          }
                        },
                        textInputAction: TextInputAction.send,
                      ),
                    ),
                    const SizedBox(width: 8),
                    CircleAvatar(
                      backgroundColor: chatProvider.isSocketConnected
                          ? Colors.blue
                          : Colors.blue.shade300,
                      child: IconButton(
                        icon: const Icon(Icons.send, color: Colors.white),
                        onPressed: _sendMessage,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  void _showAttachmentOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Select Attachment',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                ListTile(
                  leading: const Icon(Icons.photo_camera, color: Colors.blue),
                  title: const Text('Camera'),
                  subtitle: const Text('Take a photo'),
                  onTap: () {
                    Navigator.pop(context);
                    _pickImageFromCamera();
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.photo_library, color: Colors.green),
                  title: const Text('Gallery'),
                  subtitle: const Text('Choose from gallery'),
                  onTap: () {
                    Navigator.pop(context);
                    _pickImageFromGallery();
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.attach_file, color: Colors.orange),
                  title: const Text('Document'),
                  subtitle: const Text('Choose a file'),
                  onTap: () {
                    Navigator.pop(context);
                    _pickDocument();
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.cancel, color: Colors.red),
                  title: const Text('Cancel'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _pickImageFromCamera() async {
    try {
      final XFile? pickedFile = await _picker.pickImage(
        source: ImageSource.camera,
        maxWidth: 1800,
        maxHeight: 1800,
        imageQuality: 85,
      );

      if (pickedFile != null) {
        final File imageFile = File(pickedFile.path);
        await _sendFileMessage(imageFile);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error accessing camera: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  Future<void> _pickImageFromGallery() async {
    try {
      final XFile? pickedFile = await _picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 1800,
        maxHeight: 1800,
        imageQuality: 85,
      );

      if (pickedFile != null) {
        final File imageFile = File(pickedFile.path);
        await _sendFileMessage(imageFile);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error accessing gallery: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  Future<void> _pickDocument() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.any,
        allowMultiple: false,
      );

      if (result != null && result.files.single.path != null) {
        final File file = File(result.files.single.path!);

        // Check file size (limit to 10MB)
        final fileSizeInBytes = await file.length();
        final fileSizeInMB = fileSizeInBytes / (1024 * 1024);

        if (fileSizeInMB > 10) {
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('File size should not exceed 10MB'),
                backgroundColor: Colors.red,
              ),
            );
          }
          return;
        }

        await _sendFileMessage(file);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error picking file: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }
}
