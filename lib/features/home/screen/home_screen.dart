import 'package:ed_tech/config/app_colors.dart';
import 'package:ed_tech/config/app_typography.dart';
import 'package:ed_tech/config/theme/theme_provider.dart';
import 'package:ed_tech/core/utils/sizeconfig.dart';
import 'package:ed_tech/features/home/screen/all_view_list_bottom_sheet.dart';
import 'package:ed_tech/features/login/provider/login.dart';
import 'package:ed_tech/widgets/custom_button.dart';
import 'package:ed_tech/widgets/custom_header.dart';
import 'package:ed_tech/widgets/gradient_background.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HomeScreenNew extends StatelessWidget {
  final bool isDarkMode = false; // toggle logic can be added later

  // Dummy data for recommended courses
  final List<Map<String, dynamic>> _recommendedCourses = [
    {
      'title': 'Mastering Large Language Models',
      'subtitle': 'From Principles to Advanced Techniques',
      'instructor': 'Dr. Alex Chen',
      'type': 'Course',
      'rating': '4.8',
      'color': Colors.lightBlue,
    },
    {
      'title': 'Flutter Development Bootcamp',
      'subtitle': 'Build Amazing Mobile Apps',
      'instructor': 'Sarah Johnson',
      'type': 'Bootcamp',
      'rating': '4.9',
      'color': Colors.orange,
    },
    {
      'title': 'Python for Data Science',
      'subtitle': 'Complete Data Analysis Guide',
      'instructor': 'Dr. Michael Smith',
      'type': 'Course',
      'rating': '4.7',
      'color': Colors.green,
    },
    {
      'title': 'UI/UX Design Masterclass',
      'subtitle': 'Design Beautiful User Interfaces',
      'instructor': 'Emma Wilson',
      'type': 'Masterclass',
      'rating': '4.8',
      'color': Colors.purple,
    },
    {
      'title': 'Machine Learning Fundamentals',
      'subtitle': 'Introduction to AI and ML',
      'instructor': 'Prof. David Lee',
      'type': 'Course',
      'rating': '4.6',
      'color': Colors.red,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return GradientBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MTXOHeader(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: SizeConfig.getPaddingSymmetric(
                            horizontal: 20, vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Welcome back, Test',
                              style: AppTypography.h3(context).copyWith(
                                  color: themeProvider.isDarkMode
                                      ? AppColors.buttonColor
                                      : AppColors.blue,
                                  fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              DateFormat('EEEE, MMMM d').format(DateTime.now()),
                              style: AppTypography.h3(context).copyWith(
                                  color: themeProvider.isDarkMode
                                      ? AppColors.textSecondary
                                      : AppColors.textSecondary,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(height: 24),
                            Text(
                              'My Courses',
                              style: AppTypography.h2(context).copyWith(
                                  color: themeProvider.isDarkMode
                                      ? AppColors.white
                                      : AppColors.back,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(height: 12),
                            _buildEmptyCourseCard(),
                            const SizedBox(height: 24),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Recommended For You',
                                  style: AppTypography.heading(context)
                                      .copyWith(
                                          color: themeProvider.isDarkMode
                                              ? AppColors.white
                                              : AppColors.back),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    _showCoursesBottomSheet(
                                        context); // Add parentheses and context parameter
                                  },
                                  child: Text(
                                    'View All',
                                    style: AppTypography.heading(context)
                                        .copyWith(
                                            color: themeProvider.isDarkMode
                                                ? AppColors.buttonColor
                                                : AppColors.buttonColor,
                                            fontSize: 14),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),
                      _buildRecommendedCoursesListView(),
                    ]),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyCourseCard() {
    return Consumer<ThemeProvider>(builder: (context, themeProvider, _) {
      return Container(
        width: double.infinity,
        padding: SizeConfig.getPadding(20),
        decoration: BoxDecoration(
            color: themeProvider.isDarkMode
                ? AppColors.conPrimary
                : AppColors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                blurRadius: 3,
                color: AppColors.back.withOpacity(0.2),
                offset: Offset(0, 4),
              ),
            ]),
        child: Column(
          children: [
            Icon(Icons.school, size: 40, color: Colors.lightBlue),
            const SizedBox(height: 12),
            Text(
              "You're not enrolled in any courses yet",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              "Start your learning journey by enrolling in a course",
              style: TextStyle(fontSize: 14, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            CustomButton(
              buttonId: '',
              text: "Browse Courses",
              onPressed: () {},
              width: double.infinity,
              height: SizeConfig.height(5),
              borderRadius: 10,
              backgroundColor: AppColors.buttonColor,
              textColor: AppColors.white,
            )
          ],
        ),
      );
    });
  }

  Widget _buildRecommendedCoursesListView() {
    return SizedBox(
      height: SizeConfig.height(28), // Increased height for the horizontal list
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: SizeConfig.getPaddingOnly(bottom: 8, right: 10, left: 20),
        itemCount: _recommendedCourses.length,
        itemBuilder: (context, index) {
          return _buildRecommendedCard(_recommendedCourses[index], index);
        },
      ),
    );
  }

  Widget _buildRecommendedCard(Map<String, dynamic> courseData, int index) {
    return Consumer<ThemeProvider>(builder: (context, themeProvider, _) {
      return Container(
        width: 300,
        margin: EdgeInsets.only(
          right: index == _recommendedCourses.length - 1 ? 0 : 12,
        ),
        padding: SizeConfig.getPadding(16),
        decoration: BoxDecoration(
          color:
              themeProvider.isDarkMode ? AppColors.conPrimary : AppColors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              blurRadius: 3,
              color: AppColors.back.withOpacity(0.2),
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Recommended badge
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: courseData['color'].withOpacity(0.2),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.star, size: 16, color: courseData['color']),
                  const SizedBox(width: 4),
                  Text(
                    'Recommended',
                    style: AppTypography.heading(context).copyWith(
                      color: courseData['color'],
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),

            // Course title
            Text(
              courseData['title'],
              style: AppTypography.heading(context).copyWith(
                color:
                    themeProvider.isDarkMode ? AppColors.white : AppColors.back,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 4),

            // Course subtitle
            Text(
              courseData['subtitle'],
              style: AppTypography.toggleButtonText(context).copyWith(
                color: themeProvider.isDarkMode
                    ? AppColors.textLogin
                    : AppColors.textTertiary,
                fontSize: 13,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 12),

            // Spacer to push tags and button to bottom
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Tags section
                  Wrap(
                    spacing: 6,
                    runSpacing: 6,
                    children: [
                      _buildTag(Icons.person, courseData['instructor']),
                      _buildTag(Icons.schedule, courseData['type']),
                      _buildTag(Icons.star, courseData['rating']),
                    ],
                  ),

                  // Button at the bottom
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: CustomButton(
                      buttonId: 'buttonId',
                      text: "Browse",
                      onPressed: () {},
                      backgroundColor: AppColors.buttonColor,
                      textColor: AppColors.white,
                      height: SizeConfig.height(4),
                      width: double.infinity,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget _buildTag(IconData icon, String text) {
    return Consumer<ThemeProvider>(builder: (context, themeProvider, _) {
      return Container(
        padding: SizeConfig.getPaddingSymmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: themeProvider.isDarkMode
              ? Color(0xFF293043)
              : AppColors.textLogin.withOpacity(0.4),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon,
                size: 12,
                color: themeProvider.isDarkMode
                    ? AppColors.textLogin
                    : AppColors.textTertiary),
            const SizedBox(width: 4),
            Text(
              text,
              style: AppTypography.toggleButtonText(context).copyWith(
                  color: themeProvider.isDarkMode
                      ? AppColors.textLogin
                      : AppColors.textTertiary,
                  fontSize: 11),
            ),
          ],
        ),
      );
    });
  }
}

// import 'package:flutter/material.dart';

void _showCoursesBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) => const CoursesBottomSheet(),
  );
}
