// import 'package:flutter/material.dart';

// class ChatScreen extends StatelessWidget {
//   const ChatScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final doctorAvatar =
//         "lib/assets/chatimage.png"; // Replace with actual
//     final userAvatar =
//         "lib/assets/chatscreenimage.png"; // Replace with actual

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         // leading: IconButton(
//         //   icon: const Icon(Icons.arrow_back),
//         //   onPressed: () => Navigator.pop(context),
//         // ),
//         title: const Text("Chat",style: TextStyle(fontWeight: FontWeight.bold),),
//         centerTitle: true,
//         elevation: 1,
//       ),
//       body: Column(
//         children: [
//           Container(
//             padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//             decoration: BoxDecoration(
//               border: Border(bottom: BorderSide(color: Colors.grey.shade300)),
//             ),
//             child: Row(
//               children: [
//                 CircleAvatar(
//                   backgroundImage: AssetImage(doctorAvatar),
//                 ),
//                 const SizedBox(width: 12),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: const [
//                     Text(
//                       "Dr. Kumar",
//                       style:
//                           TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//                     ),
//                     Text(
//                       "Online",
//                       style: TextStyle(color: Color.fromARGB(255, 65, 65, 65), fontSize: 12),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           Expanded(
//             child: ListView(
//               padding: const EdgeInsets.all(16),
//               children: [
//                 Row(
//                   crossAxisAlignment: CrossAxisAlignment.end,
//                   children: [
//                     CircleAvatar(backgroundImage: AssetImage(doctorAvatar)),
//                     const SizedBox(width: 8),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         SizedBox(height: 190,),
//                         const Text("Dr. Kumar",style: TextStyle(fontWeight: FontWeight.bold),),
//                         const SizedBox(height: 4),
//                         Container(
//                           padding: const EdgeInsets.symmetric(
//                               horizontal: 12, vertical: 8),
//                           decoration: BoxDecoration(
//                             color: Colors.grey.shade200,
//                             borderRadius: BorderRadius.circular(12),
//                           ),
//                           child: const Text("Are you okay now?",style: TextStyle(fontWeight: FontWeight.bold),),
//                         ),
//                         const SizedBox(height: 4),
//                         const Text(
//                           "09:25 AM",
//                           style:
//                               TextStyle(fontSize: 10, color: Colors.grey),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 20),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   crossAxisAlignment: CrossAxisAlignment.end,
//                   children: [
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.end,
//                       children: [
//                         const Text("You"),
//                         const SizedBox(height: 4),
//                         Container(
//                           padding: const EdgeInsets.symmetric(
//                               horizontal: 12, vertical: 8),
//                           decoration: BoxDecoration(
//                             color: Colors.blue,
//                             borderRadius: BorderRadius.circular(12),
//                           ),
//                           child: const Text(
//                             "I'm okay now Sir!",
//                             style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
//                           ),
//                         ),
//                         const SizedBox(height: 4),
//                         const Text(
//                           "09:25 AM",
//                           style:
//                               TextStyle(fontSize: 10, color: Colors.grey),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(width: 8),
//                     CircleAvatar(backgroundImage: AssetImage(userAvatar)),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           Container(
//             padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//             decoration: BoxDecoration(
//               border: Border(top: BorderSide(color: Colors.grey.shade300)),
//               color: Colors.white,
//             ),
//             child: Row(
//               children: [
//                 IconButton(
//                   icon: Icon(Icons.image, color: Colors.grey.shade600),
//                   onPressed: () {
//                     // Handle image selection
//                     _showImageOptions(context);
//                   },
//                 ),
//                 Expanded(
//                   child: TextField(
//                     decoration: InputDecoration(
//                       hintText: "Write your message",
//                       filled: true,
//                       fillColor: Colors.grey.shade100,
//                       contentPadding: const EdgeInsets.symmetric(
//                           horizontal: 12, vertical: 10),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(30),
//                         borderSide: BorderSide.none,
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(width: 8),
//                 CircleAvatar(
//                   backgroundColor: Colors.blue,
//                   child: IconButton(
//                     icon: const Icon(Icons.send, color: Colors.white),
//                     onPressed: () {
//                       // Send message action
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   void _showImageOptions(BuildContext context) {
//     showModalBottomSheet(
//       context: context,
//       builder: (BuildContext context) {
//         return SafeArea(
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 ListTile(
//                   leading: const Icon(Icons.photo_camera, color: Colors.blue),
//                   title: const Text('Camera'),
//                   onTap: () {
//                     Navigator.pop(context);
//                     // Handle camera selection
//                     _pickImageFromCamera();
//                   },
//                 ),
//                 ListTile(
//                   leading: const Icon(Icons.photo_library, color: Colors.green),
//                   title: const Text('Gallery'),
//                   onTap: () {
//                     Navigator.pop(context);
//                     // Handle gallery selection
//                     _pickImageFromGallery();
//                   },
//                 ),
//                 ListTile(
//                   leading: const Icon(Icons.cancel, color: Colors.red),
//                   title: const Text('Cancel'),
//                   onTap: () {
//                     Navigator.pop(context);
//                   },
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }

//   void _pickImageFromCamera() {
//     // TODO: Implement camera image picker
//     // You'll need to add image_picker package to pubspec.yaml
//     print("Pick image from camera");
//   }

//   void _pickImageFromGallery() {
//     // TODO: Implement gallery image picker
//     // You'll need to add image_picker package to pubspec.yaml
//     print("Pick image from gallery");
//   }
// }

// import 'package:consultation_app/auth/views/provider/chat_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:consultation_app/auth/views/api/chat_services.dart';
// // Import your ChatProvider

// class ChatScreen extends StatefulWidget {
//   final Doctor? selectedDoctor;

//   const ChatScreen({
//     super.key,
//     this.selectedDoctor,
//   });

//   @override
//   State<ChatScreen> createState() => _ChatScreenState();
// }

// class _ChatScreenState extends State<ChatScreen> {
//   final TextEditingController _messageController = TextEditingController();
//   final ScrollController _scrollController = ScrollController();

//   @override
//   void initState() {
//     super.initState();
//     // Initialize provider and set selected doctor if provided
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       final chatProvider = Provider.of<ChatProvider>(context, listen: false);
//       if (widget.selectedDoctor != null) {
//         chatProvider.setSelectedDoctor(widget.selectedDoctor!);
//       }
//     });
//   }

//   @override
//   void dispose() {
//     _messageController.dispose();
//     _scrollController.dispose();
//     super.dispose();
//   }

//   void _scrollToBottom() {
//     if (_scrollController.hasClients) {
//       _scrollController.animateTo(
//         _scrollController.position.maxScrollExtent,
//         duration: const Duration(milliseconds: 300),
//         curve: Curves.easeOut,
//       );
//     }
//   }

//   void _sendMessage() async {
//     final message = _messageController.text.trim();
//     if (message.isEmpty) return;

//     final chatProvider = Provider.of<ChatProvider>(context, listen: false);

//     // Clear the input field immediately
//     _messageController.clear();

//     // Send message
//     final success = await chatProvider.sendMessage(message);

//     if (success) {
//       // Scroll to bottom after sending
//       WidgetsBinding.instance.addPostFrameCallback((_) {
//         _scrollToBottom();
//       });
//     } else {
//       // Show error snackbar
//       if (mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text(chatProvider.error.isNotEmpty
//                 ? chatProvider.error
//                 : 'Failed to send message'),
//             backgroundColor: Colors.red,
//           ),
//         );
//       }
//     }
//   }

//   Widget _buildMessageBubble(ChatMessage message, bool isCurrentUser) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 4),
//       child: Row(
//         mainAxisAlignment: isCurrentUser
//             ? MainAxisAlignment.end
//             : MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.end,
//         children: [
//           if (!isCurrentUser) ...[
//             CircleAvatar(
//               backgroundImage: AssetImage("lib/assets/chatimage.png"),
//               radius: 16,
//             ),
//             const SizedBox(width: 8),
//           ],
//           Flexible(
//             child: Column(
//               crossAxisAlignment: isCurrentUser
//                   ? CrossAxisAlignment.end
//                   : CrossAxisAlignment.start,
//               children: [
//                 if (!isCurrentUser)
//                   Text(
//                     Provider.of<ChatProvider>(context).selectedDoctor?.name ?? "Doctor",
//                     style: const TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 12,
//                     ),
//                   ),
//                 if (isCurrentUser)
//                   const Text(
//                     "You",
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 12,
//                     ),
//                   ),
//                 const SizedBox(height: 4),
//                 Container(
//                   padding: const EdgeInsets.symmetric(
//                       horizontal: 12, vertical: 8),
//                   decoration: BoxDecoration(
//                     color: isCurrentUser
//                         ? Colors.blue
//                         : Colors.grey.shade200,
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   child: Text(
//                     message.message,
//                     style: TextStyle(
//                       color: isCurrentUser ? Colors.white : Colors.black,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 4),
//                 Text(
//                   Provider.of<ChatProvider>(context, listen: false)
//                       .formatMessageTime(message.timestamp),
//                   style: const TextStyle(
//                     fontSize: 10,
//                     color: Colors.grey,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           if (isCurrentUser) ...[
//             const SizedBox(width: 8),
//             CircleAvatar(
//               backgroundImage: AssetImage("lib/assets/chatscreenimage.png"),
//               radius: 16,
//             ),
//           ],
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         title: const Text(
//           "Chat",
//           style: TextStyle(fontWeight: FontWeight.bold),
//         ),
//         centerTitle: true,
//         elevation: 1,
//         // actions: [
//         //   IconButton(
//         //     icon: const Icon(Icons.refresh),
//         //     onPressed: () {
//         //       Provider.of<ChatProvider>(context, listen: false)
//         //           .refreshMessages();
//         //     },
//         //   ),
//         // ],
//       ),
//       body: Consumer<ChatProvider>(
//         builder: (context, chatProvider, child) {
//           // Show loading if initializing
//           if (chatProvider.isLoading && chatProvider.messages.isEmpty) {
//             return const Center(child: CircularProgressIndicator());
//           }

//           // Show error if no doctor selected
//           if (chatProvider.selectedDoctor == null) {
//             return const Center(
//               child: Text(
//                 'Please select a doctor to start chatting',
//                 style: TextStyle(fontSize: 16, color: Colors.grey),
//               ),
//             );
//           }

//           return Column(
//             children: [
//               // Doctor info header
//               Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//                 decoration: BoxDecoration(
//                   border: Border(bottom: BorderSide(color: Colors.grey.shade300)),
//                 ),
//                 child: Row(
//                   children: [
//                     CircleAvatar(
//                       backgroundImage: chatProvider.selectedDoctor!.image.isNotEmpty
//                           ? NetworkImage(chatProvider.selectedDoctor!.image)
//                           : const AssetImage("lib/assets/chatimage.png") as ImageProvider,
//                     ),
//                     const SizedBox(width: 12),
//                     Expanded(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             chatProvider.selectedDoctor!.name,
//                             style: const TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: 16,
//                             ),
//                           ),
//                           Text(
//                             chatProvider.selectedDoctor!.specialization,
//                             style: const TextStyle(
//                               color: Color.fromARGB(255, 65, 65, 65),
//                               fontSize: 12,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),

//               // Messages list
//               Expanded(
//                 child: chatProvider.messages.isEmpty
//                     ? const Center(
//                         child: Text(
//                           'No messages yet. Start a conversation!',
//                           style: TextStyle(fontSize: 16, color: Colors.grey),
//                         ),
//                       )
//                     : ListView.builder(
//                         controller: _scrollController,
//                         padding: const EdgeInsets.all(16),
//                         itemCount: chatProvider.messages.length,
//                         itemBuilder: (context, index) {
//                           final message = chatProvider.messages[index];
//                           final isCurrentUser = chatProvider.isStaffMessage(message);

//                           return _buildMessageBubble(message, isCurrentUser);
//                         },
//                       ),
//               ),

//               // Error message
//               if (chatProvider.error.isNotEmpty)
//                 Container(
//                   width: double.infinity,
//                   padding: const EdgeInsets.all(8),
//                   color: Colors.red.shade100,
//                   child: Text(
//                     chatProvider.error,
//                     style: const TextStyle(color: Colors.red),
//                     textAlign: TextAlign.center,
//                   ),
//                 ),

//               // Message input
//               Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//                 decoration: BoxDecoration(
//                   border: Border(top: BorderSide(color: Colors.grey.shade300)),
//                   color: Colors.white,
//                 ),
//                 child: Row(
//                   children: [
//                     IconButton(
//                       icon: Icon(Icons.image, color: Colors.grey.shade600),
//                       onPressed: () {
//                         _showImageOptions(context);
//                       },
//                     ),
//                     Expanded(
//                       child: TextField(
//                         controller: _messageController,
//                         decoration: InputDecoration(
//                           hintText: "Write your message",
//                           filled: true,
//                           fillColor: Colors.grey.shade100,
//                           contentPadding: const EdgeInsets.symmetric(
//                               horizontal: 12, vertical: 10),
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(30),
//                             borderSide: BorderSide.none,
//                           ),
//                         ),
//                         onSubmitted: (_) => _sendMessage(),
//                         textInputAction: TextInputAction.send,
//                       ),
//                     ),
//                     const SizedBox(width: 8),
//                     CircleAvatar(
//                       backgroundColor: Colors.blue,
//                       child: IconButton(
//                         icon: const Icon(Icons.send, color: Colors.white),
//                         onPressed: _sendMessage,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }

//   void _showImageOptions(BuildContext context) {
//     showModalBottomSheet(
//       context: context,
//       builder: (BuildContext context) {
//         return SafeArea(
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 ListTile(
//                   leading: const Icon(Icons.photo_camera, color: Colors.blue),
//                   title: const Text('Camera'),
//                   onTap: () {
//                     Navigator.pop(context);
//                     _pickImageFromCamera();
//                   },
//                 ),
//                 ListTile(
//                   leading: const Icon(Icons.photo_library, color: Colors.green),
//                   title: const Text('Gallery'),
//                   onTap: () {
//                     Navigator.pop(context);
//                     _pickImageFromGallery();
//                   },
//                 ),
//                 ListTile(
//                   leading: const Icon(Icons.cancel, color: Colors.red),
//                   title: const Text('Cancel'),
//                   onTap: () {
//                     Navigator.pop(context);
//                   },
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }

//   void _pickImageFromCamera() {
//     // TODO: Implement camera image picker
//     // You'll need to add image_picker package to pubspec.yaml
//     print("Pick image from camera");
//   }

//   void _pickImageFromGallery() {
//     // TODO: Implement gallery image picker
//     // You'll need to add image_picker package to pubspec.yaml
//     print("Pick image from gallery");
//   }
// }

import 'package:consultation_app/auth/views/provider/chat_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:consultation_app/auth/views/api/chat_services.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:url_launcher/url_launcher.dart';
// Import your ChatProvider

class ChatScreen extends StatefulWidget {
  final Doctor? selectedDoctor;

  const ChatScreen({
    super.key,
    this.selectedDoctor,
  });

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
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
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
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

    // Send message
    final success = await chatProvider.sendMessage(message);

    if (success) {
      // Scroll to bottom after sending
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _scrollToBottom();
      });
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

  Future<void> _sendImageMessage(File imageFile) async {
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
              Text('Sending image...'),
            ],
          ),
          duration: Duration(seconds: 2),
        ),
      );
    }

    // You'll need to implement sendImageMessage in your ChatProvider
    // This is a placeholder for the actual implementation
    try {
      // Assuming you have a method to send image in your ChatProvider
      // final success = await chatProvider.sendImageMessage(imageFile);

      // For now, let's create a text message indicating an image was sent
      final success = await chatProvider.sendMessage("📷 Image sent");

      if (success) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _scrollToBottom();
        });
      } else {
        throw Exception('Failed to send image');
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to send image: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  Widget _buildMessageBubble(ChatMessage message, bool isCurrentUser) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment:
            isCurrentUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (!isCurrentUser) ...[
            CircleAvatar(
              backgroundImage: AssetImage("lib/assets/chatimage.png"),
              radius: 16,
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
                  child: Text(
                    message.message,
                    style: TextStyle(
                      color: isCurrentUser ? Colors.white : Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  Provider.of<ChatProvider>(context, listen: false)
                      .formatMessageTime(message.timestamp),
                  style: const TextStyle(
                    fontSize: 10,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          if (isCurrentUser) ...[
            const SizedBox(width: 8),
            CircleAvatar(
              backgroundImage: AssetImage("lib/assets/chatscreenimage.png"),
              radius: 16,
            ),
          ],
        ],
      ),
    );
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
          IconButton(
            icon: const Icon(
              Icons.video_call,
              color: Colors.green,
            ),
            onPressed: () {
              _launchVideoCall();
            },
          ),
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
                    // CircleAvatar(
                    //   backgroundImage: chatProvider.selectedDoctor!.image.isNotEmpty
                    //       ? NetworkImage(chatProvider.selectedDoctor!.image)
                    //       : const AssetImage("lib/assets/chatimage.png") as ImageProvider,
                    // ),
                    CircleAvatar(
                      backgroundImage: AssetImage('lib/assets/chatimage.png'),
                      //  ("lib/assets/chatimage.png") as ImageProvider,
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
                          Text(
                            chatProvider
                                    .selectedDoctor!.consultationType.isNotEmpty
                                ? chatProvider.selectedDoctor!.consultationType
                                : 'General Consultation', 
                            style: const TextStyle(
                              color: Colors.grey, // Make it a bit lighter
                              fontSize: 14, // Slightly smaller than the name
                            ),
                          ),

                          //  Text(
                          //   chatProvider.selectedDoctor!.consultationType,
                          //   style: const TextStyle(
                          //     fontWeight: FontWeight.bold,
                          //     fontSize: 16,
                          //   ),
                          // ),
                          // Text(
                          //   chatProvider.selectedDoctor!.specialization,
                          //   style: const TextStyle(
                          //     color: Color.fromARGB(255, 65, 65, 65),
                          //     fontSize: 12,
                          //   ),
                          // ),
                        ],
                      ),
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

              // Error message
              // if (chatProvider.error.isNotEmpty)
              //   Container(
              //     width: double.infinity,
              //     padding: const EdgeInsets.all(8),
              //     color: Colors.red.shade100,
              //     child: Text(
              //       chatProvider.error,
              //       style: const TextStyle(color: Colors.red),
              //       textAlign: TextAlign.center,
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
                      icon: Icon(Icons.image, color: Colors.grey.shade600),
                      onPressed: () {
                        _showImageOptions(context);
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
                        textInputAction: TextInputAction.send,
                      ),
                    ),
                    const SizedBox(width: 8),
                    CircleAvatar(
                      backgroundColor: Colors.blue,
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

  void _showImageOptions(BuildContext context) {
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
                  'Select Image Source',
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
        await _sendImageMessage(imageFile);
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
        await _sendImageMessage(imageFile);
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
}
