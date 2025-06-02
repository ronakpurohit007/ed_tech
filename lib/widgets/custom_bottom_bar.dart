import 'package:ed_tech/config/app_colors.dart';
import 'package:ed_tech/config/theme/theme_provider.dart';
import 'package:ed_tech/core/utils/sizeconfig.dart';
import 'package:ed_tech/widgets/custom_header.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Container(
      decoration: BoxDecoration(
        color: themeProvider.isDarkMode
            ? AppColors.buttonbottombardark
            : AppColors.white, // Dark background
        border: Border(
          top: BorderSide(
            color: Color(0xFF333333),
            width: 0.5,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black12.withOpacity(0.3),
            blurRadius: 20,
            spreadRadius: 7,
          ),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: SizeConfig.height(8),
            padding:
                SizeConfig.getPaddingSymmetric(horizontal: 20, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavItem(
                  icon: Icons.dashboard,
                  label: 'Dashboard',
                  index: 0,
                  isActive: currentIndex == 0,
                ),
                _buildNavItem(
                  icon: Icons.menu_book,
                  label: 'Courses',
                  index: 1,
                  isActive: currentIndex == 1,
                ),
                _buildNavItem(
                  icon: Icons.person_outline,
                  label: 'Profile',
                  index: 2,
                  isActive: currentIndex == 2,
                ),
                _buildNavItem(
                  icon: Icons.help_outline_outlined,
                  label: 'Help',
                  index: 3,
                  isActive: currentIndex == 3,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required String label,
    required int index,
    required bool isActive,
  }) {
    return GestureDetector(
      onTap: () => onTap(index),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isActive ? const Color(0xFF00BFFF) : Colors.grey,
              size: 24,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: isActive ? const Color(0xFF00BFFF) : Colors.grey,
                fontSize: 10,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Main wrapper widget for navigation routes
class HomeWrapper extends StatefulWidget {
  final int initialIndex;

  const HomeWrapper({Key? key, this.initialIndex = 0}) : super(key: key);

  @override
  _HomeWrapperState createState() => _HomeWrapperState();
}

class _HomeWrapperState extends State<HomeWrapper> {
  late int _currentIndex;

  final List<Widget> _screens = [
    DashboardScreen(),
    CoursesScreen(),
    ProfileScreen(),
    HelpScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A1A),
      body: _screens[_currentIndex],
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

class DashboardScreen extends StatefulWidget {
  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  // Add the missing theme state variable
  bool _isDarkMode = true;

  // Add the missing theme toggle method
  void _toggleTheme() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Set background color based on theme
      backgroundColor: _isDarkMode ? const Color(0xFF0F172A) : Colors.grey[50],
      body: Column(
        children: [
          // Your MTXOHeader
          MTXOHeader(
            title: "Dashboard",
            isDarkMode: _isDarkMode,
            onThemeToggle: _toggleTheme,
            // showBackButton: true,
          ),

          // Add your dashboard content here
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Welcome section
                  Text(
                    'Welcome to Dashboard',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: _isDarkMode ? Colors.white : Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Here\'s your overview',
                    style: TextStyle(
                      fontSize: 16,
                      color: _isDarkMode ? Colors.white60 : Colors.black54,
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Dashboard content cards
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      children: [
                        _buildDashboardCard(
                          'Courses',
                          '12',
                          Icons.school,
                          const Color(0xFF3B82F6),
                        ),
                        _buildDashboardCard(
                          'Progress',
                          '75%',
                          Icons.trending_up,
                          const Color(0xFF10B981),
                        ),
                        _buildDashboardCard(
                          'Certificates',
                          '8',
                          Icons.workspace_premium,
                          const Color(0xFFF59E0B),
                        ),
                        _buildDashboardCard(
                          'Hours Studied',
                          '142',
                          Icons.access_time,
                          const Color(0xFFEF4444),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to build dashboard cards
  Widget _buildDashboardCard(
      String title, String value, IconData icon, Color color) {
    return Container(
      decoration: BoxDecoration(
        color: _isDarkMode ? const Color(0xFF1E293B) : Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: color,
              size: 24,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            value,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: _isDarkMode ? Colors.white : Colors.black87,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              color: _isDarkMode ? Colors.white60 : Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}

class CoursesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Courses Screen',
        style: TextStyle(color: Colors.white, fontSize: 24),
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Profile Screen',
        style: TextStyle(color: Colors.white, fontSize: 24),
      ),
    );
  }
}

class HelpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Help Screen',
        style: TextStyle(color: Colors.white, fontSize: 24),
      ),
    );
  }
}
