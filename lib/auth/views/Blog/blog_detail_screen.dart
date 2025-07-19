// import 'package:consultation_app/auth/views/provider/get_all_blog_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class BlogDetailScreen extends StatefulWidget {
//   final String blogId;

//   const BlogDetailScreen({
//     super.key,
//     required this.blogId,
//   });

//   @override
//   State<BlogDetailScreen> createState() => _BlogDetailScreenState();
// }

// class _BlogDetailScreenState extends State<BlogDetailScreen> {
//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       context.read<GetAllBlogProvider>().fetchSingleBlog(widget.blogId);
//     });
//   }

//   @override
//   void dispose() {
//     context.read<GetAllBlogProvider>().clearSelectedBlog();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title:  Text('Blog Details',style: TextStyle(fontWeight: FontWeight.bold),),
//         centerTitle: true,
//         backgroundColor: Colors.white,
//         foregroundColor: Colors.black,
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () => Navigator.pop(context),
//         ),
//       ),
//       body: Consumer<GetAllBlogProvider>(
//         builder: (context, blogProvider, child) {
//           if (blogProvider.isSingleBlogLoading) {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           }

//           if (blogProvider.hasError) {
//             return Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Icon(
//                     Icons.error_outline,
//                     size: 64,
//                     color: Colors.red[300],
//                   ),
//                   const SizedBox(height: 16),
//                   Text(
//                     'Error loading blog',
//                     style: Theme.of(context).textTheme.headlineSmall,
//                   ),
//                   const SizedBox(height: 8),
//                   Text(
//                     blogProvider.errorMessage,
//                     textAlign: TextAlign.center,
//                     style: Theme.of(context).textTheme.bodyMedium?.copyWith(
//                       color: Colors.grey[600],
//                     ),
//                   ),
//                   const SizedBox(height: 24),
//                   ElevatedButton(
//                     onPressed: () {
//                       blogProvider.clearError();
//                       blogProvider.fetchSingleBlog(widget.blogId);
//                     },
//                     child: const Text('Retry'),
//                   ),
//                 ],
//               ),
//             );
//           }

//           if (blogProvider.selectedBlog == null) {
//             return const Center(
//               child: Text('Blog not found'),
//             );
//           }

//           final blog = blogProvider.selectedBlog!;

//           return SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // Blog Image
//                 if (blog.image.isNotEmpty)
//                   Container(
//                     width: double.infinity,
//                     height: 250,
//                     decoration: BoxDecoration(
//                       image: DecorationImage(
//                         image: NetworkImage(blog.image),
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                     child: Container(
//                       decoration: BoxDecoration(
//                         gradient: LinearGradient(
//                           begin: Alignment.topCenter,
//                           end: Alignment.bottomCenter,
//                           colors: [
//                             Colors.transparent,
//                             Colors.black.withOpacity(0.3),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),

//                 Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       // Blog Title
//                       Text(
//                         blog.title,
//                         style: Theme.of(context).textTheme.headlineSmall?.copyWith(
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),

//                       const SizedBox(height: 16),

//                       // Author Info
//                       Row(
//                         children: [
//                           CircleAvatar(
//                             radius: 20,
//                             backgroundImage: blog.doctor.image.isNotEmpty
//                                 ? NetworkImage(blog.doctor.image)
//                                 : null,
//                             child: blog.doctor.image.isEmpty
//                                 ? const Icon(Icons.person)
//                                 : null,
//                           ),
//                           const SizedBox(width: 12),
//                           Expanded(
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   blog.doctor.name,
//                                   style: Theme.of(context).textTheme.titleMedium?.copyWith(
//                                     fontWeight: FontWeight.w600,
//                                   ),
//                                 ),
//                                 Text(
//                                   blog.doctor.specialization,
//                                   style: Theme.of(context).textTheme.bodySmall?.copyWith(
//                                     color: Colors.grey[600],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),

//                       const SizedBox(height: 12),

//                       // Date
//                       Text(
//                         blogProvider.formatDate(blog.createdAt),
//                         style: Theme.of(context).textTheme.bodySmall?.copyWith(
//                           color: Colors.grey[600],
//                         ),
//                       ),

//                       const Divider(height: 32),

//                       // Blog Content
//                       Text(
//                         blog.description,
//                         style: Theme.of(context).textTheme.bodyLarge?.copyWith(
//                           height: 1.6,
//                           fontSize: 16,
//                         ),
//                       ),

//                       const SizedBox(height: 32),

//                       // Doctor Info Card
//                       Card(
//                         elevation: 2,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                         child: Padding(
//                           padding: const EdgeInsets.all(16.0),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 'About the Author',
//                                 style: Theme.of(context).textTheme.titleMedium?.copyWith(
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                               const SizedBox(height: 12),
//                               Row(
//                                 children: [
//                                   CircleAvatar(
//                                     radius: 30,
//                                     backgroundImage: blog.doctor.image.isNotEmpty
//                                         ? NetworkImage(blog.doctor.image)
//                                         : null,
//                                     child: blog.doctor.image.isEmpty
//                                         ? const Icon(Icons.person, size: 30)
//                                         : null,
//                                   ),
//                                   const SizedBox(width: 16),
//                                   Expanded(
//                                     child: Column(
//                                       crossAxisAlignment: CrossAxisAlignment.start,
//                                       children: [
//                                         Text(
//                                           blog.doctor.name,
//                                           style: Theme.of(context).textTheme.titleMedium?.copyWith(
//                                             fontWeight: FontWeight.w600,
//                                           ),
//                                         ),
//                                         Text(
//                                           blog.doctor.specialization,
//                                           style: Theme.of(context).textTheme.bodyMedium?.copyWith(
//                                             color: Colors.blue[600],
//                                           ),
//                                         ),
//                                         if (blog.doctor.qualification.isNotEmpty)
//                                           Text(
//                                             blog.doctor.qualification,
//                                             style: Theme.of(context).textTheme.bodySmall?.copyWith(
//                                               color: Colors.grey[600],
//                                             ),
//                                           ),
//                                       ],
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               if (blog.doctor.description.isNotEmpty) ...[
//                                 const SizedBox(height: 12),
//                                 Text(
//                                   blog.doctor.description,
//                                   style: Theme.of(context).textTheme.bodyMedium?.copyWith(
//                                     height: 1.4,
//                                   ),
//                                 ),
//                               ],
//                               if (blog.doctor.consultationFee > 0) ...[
//                                 const SizedBox(height: 8),
//                                 Text(
//                                   'Consultation Fee: ₹${blog.doctor.consultationFee}',
//                                   style: Theme.of(context).textTheme.bodyMedium?.copyWith(
//                                     color: Colors.green[600],
//                                     fontWeight: FontWeight.w500,
//                                   ),
//                                 ),
//                               ],
//                             ],
//                           ),
//                         ),
//                       ),

//                       const SizedBox(height: 32),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

import 'package:consultation_app/auth/views/provider/get_all_blog_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class BlogDetailScreen extends StatefulWidget {
  final String blogId;
  final String? date;

  const BlogDetailScreen({super.key, required this.blogId, this.date});

  @override
  State<BlogDetailScreen> createState() => _BlogDetailScreenState();
}

class _BlogDetailScreenState extends State<BlogDetailScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<GetAllBlogProvider>().fetchSingleBlog(widget.blogId);
    });
  }

  String _formatDate(String dateStr) {
    try {
      final date = DateTime.parse(dateStr);
      return DateFormat('dd MMMM yyyy').format(date); // Example: 05 July 2025
    } catch (e) {
      return dateStr; // fallback in case of parse error
    }
  }

  @override
  void dispose() {
    context.read<GetAllBlogProvider>().clearSelectedBlog();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Blog Details',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Consumer<GetAllBlogProvider>(
        builder: (context, blogProvider, child) {
          if (blogProvider.isSingleBlogLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (blogProvider.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.error_outline,
                    size: 64,
                    color: Colors.red[300],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Error loading blog',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    blogProvider.errorMessage,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.grey[600],
                        ),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {
                      blogProvider.clearError();
                      blogProvider.fetchSingleBlog(widget.blogId);
                    },
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          }

          if (blogProvider.selectedBlog == null) {
            return const Center(
              child: Text('Blog not found'),
            );
          }

          final blog = blogProvider.selectedBlog!;

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Blog Image
                if (blog.image.isNotEmpty)
                  Container(
                    width: double.infinity,
                    height: 250,
                    child: Stack(
                      children: [
                        Image.network(
                          blog.image,
                          width: double.infinity,
                          height: 250,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              width: double.infinity,
                              height: 250,
                              color: Colors.grey[300],
                              child: const Icon(
                                Icons.image_not_supported,
                                size: 50,
                                color: Colors.grey,
                              ),
                            );
                          },
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Container(
                              width: double.infinity,
                              height: 250,
                              color: Colors.grey[300],
                              child: const Center(
                                child: CircularProgressIndicator(),
                              ),
                            );
                          },
                        ),
                        Container(
                          width: double.infinity,
                          height: 250,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                Colors.black.withOpacity(0.3),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Blog Title
                      Text(
                        blog.title,
                        style:
                            Theme.of(context).textTheme.headlineSmall?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                      ),

                      const SizedBox(height: 16),

                      // Author Info
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.grey[300],
                            child: blog.doctor.image.isNotEmpty
                                ? ClipOval(
                                    child: Image.network(
                                      blog.doctor.image,
                                      width: 40,
                                      height: 40,
                                      fit: BoxFit.cover,
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                        return const Icon(Icons.person);
                                      },
                                    ),
                                  )
                                : const Icon(Icons.person),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  blog.doctor.name,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                                Text(
                                  blog.doctor.specialization,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                        color: Colors.grey[600],
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 12),
                      if (widget.date != null)
                        Text(
                          _formatDate(widget.date!),
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: Colors.grey[600],
                                  ),
                        ),

                      // Date session
                      // const SizedBox(height: 12),
                      // Text(
                      //   widget.date.toString(),
                      //   style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      //         color: Colors.grey[600],
                      //       ),
                      // ),

                      // Date
                      // Text(
                      //   blogProvider.formatDate(blog.createdAt),
                      //   style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      //     color: Colors.grey[600],
                      //   ),
                      // ),

                      const Divider(height: 32),

                      // Blog Content
                      Text(
                        blog.description,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              height: 1.6,
                              fontSize: 16,
                            ),
                      ),

                      const SizedBox(height: 32),

                      // Doctor Info Card
                      Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'About the Author',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              const SizedBox(height: 12),
                              Row(
                                children: [
                                  CircleAvatar(
                                    radius: 30,
                                    backgroundColor: Colors.grey[300],
                                    child: blog.doctor.image.isNotEmpty
                                        ? ClipOval(
                                            child: Image.network(
                                              blog.doctor.image,
                                              width: 60,
                                              height: 60,
                                              fit: BoxFit.cover,
                                              errorBuilder:
                                                  (context, error, stackTrace) {
                                                return const Icon(Icons.person,
                                                    size: 30);
                                              },
                                            ),
                                          )
                                        : const Icon(Icons.person, size: 30),
                                  ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          blog.doctor.name,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium
                                              ?.copyWith(
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                        Text(
                                          blog.doctor.specialization,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium
                                              ?.copyWith(
                                                color: Colors.blue[600],
                                              ),
                                        ),
                                        if (blog
                                            .doctor.qualification.isNotEmpty)
                                          Text(
                                            blog.doctor.qualification,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall
                                                ?.copyWith(
                                                  color: Colors.grey[600],
                                                ),
                                          ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              if (blog.doctor.description.isNotEmpty) ...[
                                const SizedBox(height: 12),
                                Text(
                                  blog.doctor.description,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                        height: 1.4,
                                      ),
                                ),
                              ],
                              if (blog.doctor.consultationFee > 0) ...[
                                const SizedBox(height: 8),
                                Text(
                                  'Consultation Fee: ₹${blog.doctor.consultationFee}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                        color: Colors.green[600],
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ],
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 32),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
