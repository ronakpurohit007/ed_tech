import 'dart:ui';

import 'package:ed_tech/widgets/custom_textfield.dart';
import 'package:ed_tech/widgets/filter_courses.dart';
import 'package:flutter/material.dart';

class CoursesBottomSheet extends StatefulWidget {
  const CoursesBottomSheet({super.key});

  @override
  State<CoursesBottomSheet> createState() => _CoursesBottomSheetState();
}

class _CoursesBottomSheetState extends State<CoursesBottomSheet>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.9,
      minChildSize: 0.5,
      maxChildSize: 0.95,
      builder: (context, scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: Color(0xFFE3F2FD),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            children: [
              // Handle bar
              Container(
                margin: const EdgeInsets.only(top: 8),
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              // Title
              HeaderWidget(),
              // const Padding(
              //   padding: EdgeInsets.symmetric(horizontal: 16),
              //   child: Align(
              //     alignment: Alignment.centerLeft,
              //     child: Text(
              //       'Explore Courses',
              //       style: TextStyle(
              //         fontSize: 24,
              //         fontWeight: FontWeight.bold,
              //         color: Colors.black,
              //       ),
              //     ),
              //   ),
              // ),
              const SizedBox(height: 16),
              // Tab bar
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: TabBar(
                  controller: _tabController,
                  indicatorColor: Colors.blue,
                  labelColor: Colors.blue,
                  unselectedLabelColor: Colors.grey,
                  indicatorWeight: 3,
                  tabs: const [
                    Tab(text: 'All'),
                    Tab(text: 'Popular'),
                    Tab(text: 'New'),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              // Course list
              Expanded(
                child: ListView(
                  controller: scrollController,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  children: [
                    _buildCourseCard(
                      title: 'AI Agents: Building Autonomous Systems',
                      instructor: 'Dr. Maya Patel',
                      rating: 4.7,
                      reviews: 213,
                      students: 1876,
                      tags: ['GenAI', 'Agents', 'Python', 'MLOps'],
                      duration: '18 hours',
                      lessons: 32,
                      level: 'Intermediate',
                      isFree: false,
                      imageUrl: "blockchain_image",
                    ),
                    const SizedBox(height: 16),
                    _buildCourseCard(
                      title: 'Computer Vision with Deep Learning',
                      instructor: 'Prof. James Wilson',
                      rating: 4.9,
                      reviews: 456,
                      students: 3241,
                      tags: ['Computer Vision', 'Python', 'MLOps'],
                      duration: '16 hours',
                      lessons: 28,
                      level: 'Advanced',
                      isFree: true,
                      imageUrl: 'blockchain_image',
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildCourseCard({
    required String title,
    required String instructor,
    required double rating,
    required int reviews,
    required int students,
    required List<String> tags,
    required String duration,
    required int lessons,
    required String level,
    required bool isFree,
    String? imageUrl,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image section (if available)
          if (imageUrl != null)
            Container(
              height: 200,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
                image: DecorationImage(
                  image: AssetImage('assets/images/newimag.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 12,
                    left: 12,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        level,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 12,
                    right: 12,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        isFree ? 'Free' : 'Premium',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          // Content section
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 12,
                      backgroundColor: Colors.grey[300],
                      child: const Icon(
                        Icons.person,
                        size: 16,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      instructor,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: Colors.orange,
                      size: 18,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '$rating',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      ' ($reviews)',
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.people,
                      color: Colors.grey,
                      size: 16,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '$students students',
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 8,
                  runSpacing: 4,
                  children: tags.map((tag) {
                    Color tagColor;
                    switch (tag) {
                      case 'GenAI':
                        tagColor = Colors.cyan;
                        break;
                      case 'Agents':
                        tagColor = Colors.blue;
                        break;
                      case 'Python':
                        tagColor = Colors.orange;
                        break;
                      case 'MLOps':
                        tagColor = Colors.green;
                        break;
                      case 'Computer Vision':
                        tagColor = Colors.purple;
                        break;
                      default:
                        tagColor = Colors.grey;
                    }
                    return Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: tagColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        tag,
                        style: TextStyle(
                          color: tagColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.access_time,
                            size: 14,
                            color: Colors.grey,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            duration,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.play_lesson,
                            size: 14,
                            color: Colors.grey,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '$lessons lessons',
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class HeaderWidget extends StatefulWidget {
  @override
  _HeaderWidgetState createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  bool isSearchMode = false;
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        children: [
          // Close button
          IconButton(
            onPressed: () {
              // Handle close action
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.close,
              color: Colors.black,
            ),
          ),
          SizedBox(width: 5),

          // Main content area
          Expanded(
            child: isSearchMode
                ? // Search mode: Show text field
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    child: CustomTextField(
                        hintText: "Search Courses...",
                        controller: searchController)
                    // TextField(
                    //   controller: searchController,
                    //   autofocus: true,
                    //   decoration: InputDecoration(
                    //     hintText: 'Search courses...',
                    //     border: OutlineInputBorder(
                    //       borderRadius: BorderRadius.circular(8),
                    //     ),
                    //     contentPadding:
                    //         EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    //   ),
                    // ),
                    )
                : // Normal mode: Show title
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Explore Courses',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
          ),
          // Search button
          IconButton(
            onPressed: () {
              setState(() {
                isSearchMode = !isSearchMode;
                if (!isSearchMode) {
                  searchController.clear();
                }
              });
            },
            icon: Icon(
              isSearchMode ? Icons.close : Icons.search,
              color: Colors.black,
            ),
          ),

          // Filter button
          IconButton(
            onPressed: () {
              // Handle filter action
              print('Filter clicked');
              _openFilterBottomSheet(context);
            },
            icon: Icon(
              Icons.filter_list,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  void _openFilterBottomSheet(BuildContext context) async {
    final result = await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      barrierColor: Colors.black.withOpacity(0.7),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => FilterBottomSheet(),
    );

    if (result != null) {
      print('Selected Skill Level: ${result['skillLevel']}');
      print('Selected Price: ${result['price']}');
    }
  }

  // void _openFilterBottomSheet(BuildContext context) async {
  //   final result = await showGeneralDialog(
  //     context: context,
  //     barrierDismissible: true,
  //     barrierLabel: '',
  //     barrierColor: Colors.transparent,
  //     transitionDuration: Duration(milliseconds: 500),
  //     pageBuilder: (context, animation, secondaryAnimation) {
  //       return Stack(
  //         children: [
  //           // Custom blur background
  //           BackdropFilter(
  //             filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
  //             child: Container(
  //               color: Colors.black.withOpacity(0.3),
  //             ),
  //           ),
  //           // Bottom sheet
  //           Align(
  //             alignment: Alignment.bottomCenter,
  //             child: Material(
  //               color: Colors.transparent,
  //               child: Container(
  //                 decoration: BoxDecoration(
  //                   color: Colors.white,
  //                   borderRadius:
  //                       BorderRadius.vertical(top: Radius.circular(20)),
  //                 ),
  //                 child: FilterBottomSheet(),
  //               ),
  //             ),
  //           ),
  //         ],
  //       );
  //     },
  //     transitionBuilder: (context, animation, secondaryAnimation, child) {
  //       return SlideTransition(
  //         position: Tween<Offset>(
  //           begin: const Offset(0, 1),
  //           end: Offset.zero,
  //         ).animate(animation),
  //         child: child,
  //       );
  //     },
  //   );

  //   if (result != null && result is Map<String, dynamic>) {
  //     print('Selected Skill Level: ${result['skillLevel']}');
  //     print('Selected Price: ${result['price']}');
  //   }
  // }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}
