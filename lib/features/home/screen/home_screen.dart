import 'package:ed_tech/config/app_colors.dart';
import 'package:ed_tech/config/app_typography.dart';
import 'package:ed_tech/config/theme/theme_provider.dart';
import 'package:ed_tech/core/utils/sizeconfig.dart';
import 'package:ed_tech/features/login/provider/login.dart';
import 'package:ed_tech/widgets/custom_button.dart';
import 'package:ed_tech/widgets/gradient_background.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final authProvider = Provider.of<AuthProvider>(context);
    SizeConfig().init(context);

    return GradientBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            'MIXO Labs',
            style: AppTypography.h3(context).copyWith(
              color: themeProvider.isDarkMode
                  ? AppColors.white
                  : AppColors.textPrimary,
            ),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(
                Icons.logout,
                color: themeProvider.isDarkMode
                    ? AppColors.white
                    : AppColors.textPrimary,
              ),
              onPressed: () => _showLogoutDialog(context),
            ),
          ],
        ),
        body: SafeArea(
          child: Padding(
            padding: SizeConfig.getPaddingSymmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(height: SizeConfig.height(3)),

                // Welcome Section
                Container(
                  width: double.infinity,
                  padding: SizeConfig.getPaddingSymmetric(
                      horizontal: 20, vertical: 25),
                  decoration: BoxDecoration(
                    color: themeProvider.isDarkMode
                        ? AppColors.conPrimary
                        : AppColors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black87.withOpacity(0.1),
                        blurRadius: 15,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      // Profile Avatar
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color(0xFF00BFFF), Color(0xFF0080FF)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.person,
                          size: 40,
                          color: Colors.white,
                        ),
                      ),

                      SizedBox(height: SizeConfig.height(2)),

                      Text(
                        'Welcome Back!',
                        style: AppTypography.h2(context).copyWith(
                          color: themeProvider.isDarkMode
                              ? AppColors.white
                              : AppColors.textPrimary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: SizeConfig.height(0.5)),

                      Text(
                        'Hello, ${authProvider.currentUser ?? 'User'}',
                        style: AppTypography.h5(context).copyWith(
                          color: Color(0xFF00BFFF),
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      SizedBox(height: SizeConfig.height(1)),

                      Text(
                        'Ready to start your learning journey?',
                        style:
                            AppTypography.inputPlaceholder16(context).copyWith(
                          color: themeProvider.isDarkMode
                              ? AppColors.textLogin
                              : AppColors.textSecondary,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),

                SizedBox(height: SizeConfig.height(4)),

                // Dashboard Cards
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    children: [
                      _buildDashboardCard(
                        context,
                        'My Courses',
                        Icons.book,
                        Color(0xFF4CAF50),
                        () => _navigateToScreen(context, 'courses'),
                      ),
                      _buildDashboardCard(
                        context,
                        'Assignments',
                        Icons.assignment,
                        Color(0xFFFF9800),
                        () => _navigateToScreen(context, 'assignments'),
                      ),
                      _buildDashboardCard(
                        context,
                        'Progress',
                        Icons.trending_up,
                        Color(0xFF2196F3),
                        () => _navigateToScreen(context, 'progress'),
                      ),
                      _buildDashboardCard(
                        context,
                        'Settings',
                        Icons.settings,
                        Color(0xFF9C27B0),
                        () => _navigateToScreen(context, 'settings'),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: SizeConfig.height(2)),

                // Quick Actions
                Container(
                  width: double.infinity,
                  padding: SizeConfig.getPaddingSymmetric(
                      horizontal: 20, vertical: 20),
                  decoration: BoxDecoration(
                    color: themeProvider.isDarkMode
                        ? AppColors.conPrimary
                        : AppColors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black87.withOpacity(0.1),
                        blurRadius: 10,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Quick Actions',
                        style: AppTypography.h5(context).copyWith(
                          color: themeProvider.isDarkMode
                              ? AppColors.white
                              : AppColors.textPrimary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: SizeConfig.height(1.5)),
                      Row(
                        children: [
                          Expanded(
                            child: CustomButton(
                              buttonId: 'start_learning_btn',
                              text: "Start Learning",
                              height: 45,
                              borderRadius: 10,
                              backgroundColor: Color(0xFF00BFFF),
                              textColor: Colors.white,
                              onPressed: () =>
                                  _navigateToScreen(context, 'learning'),
                            ),
                          ),
                          SizedBox(width: 15),
                          Expanded(
                            child: CustomButton(
                              buttonId: 'view_profile_btn',
                              text: "View Profile",
                              height: 45,
                              borderRadius: 10,
                              backgroundColor: themeProvider.isDarkMode
                                  ? AppColors.buttonbg
                                  : AppColors.buttonsecondry,
                              textColor: AppColors.buttonColor,
                              elevation: 0,
                              onPressed: () =>
                                  _navigateToScreen(context, 'profile'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                SizedBox(height: SizeConfig.height(2)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDashboardCard(
    BuildContext context,
    String title,
    IconData icon,
    Color color,
    VoidCallback onTap,
  ) {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color:
              themeProvider.isDarkMode ? AppColors.conPrimary : AppColors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black87.withOpacity(0.1),
              blurRadius: 10,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                size: 30,
                color: color,
              ),
            ),
            SizedBox(height: 15),
            Text(
              title,
              style: AppTypography.h5(context).copyWith(
                color: themeProvider.isDarkMode
                    ? AppColors.white
                    : AppColors.textPrimary,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToScreen(BuildContext context, String screenName) {
    // Show a snackbar for demo purposes
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Navigating to $screenName screen'),
        duration: Duration(seconds: 2),
        backgroundColor: Color(0xFF00BFFF),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Logout'),
          content: Text('Are you sure you want to logout?'),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: Text('Logout'),
              onPressed: () {
                Navigator.of(context).pop();
                final authProvider =
                    Provider.of<AuthProvider>(context, listen: false);
                authProvider.logout();
                Navigator.pushReplacementNamed(context, '/signin');
              },
            ),
          ],
        );
      },
    );
  }
}
