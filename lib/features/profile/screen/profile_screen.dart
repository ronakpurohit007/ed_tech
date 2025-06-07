import 'package:ed_tech/config/app_colors.dart';
import 'package:ed_tech/config/app_typography.dart';
import 'package:ed_tech/config/theme/theme_provider.dart';
import 'package:ed_tech/core/utils/sizeconfig.dart';
import 'package:ed_tech/widgets/custom_button.dart';
import 'package:ed_tech/widgets/custom_header.dart';
import 'package:ed_tech/widgets/gradient_background.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
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
    final themeProvider = Provider.of<ThemeProvider>(context);
    return GradientBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            // Header
            MTXOHeader(),

            // Profile Content
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Profile Section
                    _buildProfileSection(),

                    // Stats Section
                    _buildStatsSection(),

                    // Tabs
                    _buildTabs(),

                    // Content based on selected tab
                    _buildTabContent(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileSection() {
    return Consumer<ThemeProvider>(builder: (context, themeProvider, _) {
      return Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: themeProvider.isDarkMode
              ? AppColors.profileCardDark
              : AppColors.profileCardLight,
        ),
        padding: EdgeInsets.symmetric(vertical: 40),
        child: Column(
          children: [
            // Profile Avatar
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Test User',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'test@mtxolabs.com',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget _buildStatsSection() {
    return Consumer<ThemeProvider>(builder: (context, themeProvider, _) {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 30),
        decoration: BoxDecoration(
            color: themeProvider.isDarkMode
                ? AppColors.profileCardDark
                : AppColors.profileCardLight,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildStatCard(
              icon: Icons.menu_book,
              iconColor: Colors.blue,
              iconBgColor: Colors.blue[50]!,
              count: '0',
              label: 'Enrolled',
            ),
            _buildStatCard(
              icon: Icons.check_circle,
              iconColor: Colors.green,
              iconBgColor: Colors.green[50]!,
              count: '0',
              label: 'Completed',
            ),
            _buildStatCard(
              icon: Icons.workspace_premium,
              iconColor: Colors.orange,
              iconBgColor: Colors.orange[50]!,
              count: '0',
              label: 'Certificates',
            ),
          ],
        ),
      );
    });
  }

  Widget _buildStatCard({
    required IconData icon,
    required Color iconColor,
    required Color iconBgColor,
    required String count,
    required String label,
  }) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: iconBgColor,
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: iconColor,
            size: 30,
          ),
        ),
        SizedBox(height: 12),
        Text(
          count,
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: iconColor,
          ),
        ),
        SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[600],
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildTabs() {
    return Consumer<ThemeProvider>(builder: (context, themeProvider, _) {
      return Container(
        color: themeProvider.isDarkMode
            ? AppColors.headerDark
            : AppColors.headerLight,
        child: TabBar(
          controller: _tabController,
          labelColor: Colors.blue,
          unselectedLabelColor: Colors.grey,
          indicatorColor: Colors.blue,
          indicatorWeight: 3,
          labelStyle: TextStyle(fontWeight: FontWeight.w600),
          tabs: [
            Tab(text: 'My Courses'),
            Tab(text: 'Achievements'),
            Tab(text: 'Settings'),
          ],
        ),
      );
    });
  }

  Widget _buildTabContent() {
    return Consumer<ThemeProvider>(builder: (context, themeProvider, _) {
      return Container(
        height: 400,
        color: themeProvider.isDarkMode
            ? AppColors.headerDark
            : AppColors.headerLight,
        child: TabBarView(
          controller: _tabController,
          children: [
            // My Courses Tab
            _buildMyCoursesContent(),
            // Achievements Tab
            _buildAchievements(),
            // Settings Tab
            AccountSettingsScreen()
          ],
        ),
      );
    });
  }

  Widget _buildMyCoursesContent() {
    return Padding(
      padding: EdgeInsets.all(30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Graduation cap icon
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: Colors.blue[50],
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.school,
              size: 40,
              color: Colors.blue,
            ),
          ),
          SizedBox(height: 30),
          Text(
            'You haven\'t enrolled in any courses yet',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 15),
          Text(
            'Browse our catalog to find courses that interest you',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 40),
          CustomButton(
              buttonId: '',
              text: "Browse Courses",
              onPressed: () {},
              backgroundColor: AppColors.buttonColor,
              textColor: AppColors.primary),
        ],
      ),
    );
  }

  Widget _buildAchievements() {
    return Padding(
      padding: EdgeInsets.all(30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Graduation cap icon
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: Colors.blue[50],
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.emoji_events_outlined,
              size: 40,
              color: AppColors.yello,
            ),
          ),
          SizedBox(height: 30),
          Text(
            'No Achievements Yet',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 15),
          Text(
            'Browse our catalog to find courses that interest you',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 40),
          CustomButton(
              buttonId: '',
              text: "Browse Courses",
              onPressed: () {},
              backgroundColor: AppColors.buttonColor,
              textColor: AppColors.primary),
        ],
      ),
    );
  }

  Widget _buildSetting() {
    return Padding(
      padding: EdgeInsets.all(30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Graduation cap icon
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: Colors.blue[50],
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.emoji_events_outlined,
              size: 40,
              color: AppColors.yello,
            ),
          ),
          SizedBox(height: 30),
          Text(
            'No Achievements Yet',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 15),
          Text(
            'Browse our catalog to find courses that interest you',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 40),
          CustomButton(
              buttonId: '',
              text: "Browse Courses",
              onPressed: () {},
              backgroundColor: AppColors.buttonColor,
              textColor: AppColors.primary),
        ],
      ),
    );
  }
}

class AccountSettingsScreen extends StatelessWidget {
  final ValueNotifier<bool> _emailNotification = ValueNotifier(true);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      backgroundColor:
          themeProvider.isDarkMode ? AppColors.headerDark : AppColors.primary,
      body: SingleChildScrollView(
        child: Padding(
          padding: SizeConfig.getPadding(15),
          child: Container(
            decoration: BoxDecoration(
                color: themeProvider.isDarkMode
                    ? AppColors.buttonbg
                    : AppColors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                      color: AppColors.back.withOpacity(0.5),
                      blurRadius: 10,
                      offset: Offset(0, 4))
                ]),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: SizeConfig.getPaddingSymmetric(
                      horizontal: 10, vertical: 15),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Account Setting",
                      style: AppTypography.h1(context).copyWith(
                        fontSize: 22,
                        color: themeProvider.isDarkMode
                            ? AppColors.white
                            : AppColors.textPrimary,
                      ),
                    ),
                  ),
                ),
                _buildDivider(),
                _buildSettingTile(
                  icon: Icons.lock_outline,
                  title: 'Change Password',
                  trailing: Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {},
                ),
                _buildDivider(),
                _buildToggleTile(
                  icon: Icons.mail_outline,
                  title: 'Email Notifications',
                  valueNotifier: _emailNotification,
                ),
                _buildDivider(),
                _buildSettingTile(
                  icon: Icons.language,
                  title: 'Language',
                  subtitle: 'English',
                  trailing: Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSettingTile({
    required IconData icon,
    required String title,
    String? subtitle,
    Widget? trailing,
    VoidCallback? onTap,
  }) {
    return Consumer<ThemeProvider>(builder: (context, themeProvider, _) {
      return ListTile(
        leading: Icon(
          icon,
          color: themeProvider.isDarkMode
              ? AppColors.white
              : AppColors.textPrimary,
        ),
        title: Text(
          title,
          style: AppTypography.inputText(context).copyWith(
            color: themeProvider.isDarkMode
                ? AppColors.white
                : AppColors.textPrimary,
          ),
        ),
        subtitle: subtitle != null ? Text(subtitle) : null,
        trailing: trailing,
        onTap: onTap,
      );
    });
  }

  Widget _buildToggleTile({
    required IconData icon,
    required String title,
    required ValueNotifier<bool> valueNotifier,
  }) {
    return Consumer<ThemeProvider>(builder: (context, themeProvider, _) {
      return ValueListenableBuilder<bool>(
        valueListenable: valueNotifier,
        builder: (context, value, _) => ListTile(
          leading: Icon(
            icon,
            color: themeProvider.isDarkMode
                ? AppColors.white
                : AppColors.textPrimary,
          ),
          title: Text(
            title,
            style: AppTypography.inputText(context).copyWith(
              color: themeProvider.isDarkMode
                  ? AppColors.white
                  : AppColors.textPrimary,
            ),
          ),
          trailing: Switch(
            value: value,
            onChanged: (newValue) => valueNotifier.value = newValue,
            activeColor: AppColors.blue,
            activeTrackColor: AppColors.buttonColor.withOpacity(0.3),
          ),
        ),
      );
    });
  }

  Widget _buildDivider() {
    return Divider(
      height: 0.5,
      thickness: 1,
      color: AppColors.back,
    );
  }
}
