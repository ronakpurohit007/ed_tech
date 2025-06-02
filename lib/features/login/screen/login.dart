import 'package:ed_tech/config/app_colors.dart';
import 'package:ed_tech/config/app_typography.dart';
import 'package:ed_tech/config/theme/theme_provider.dart';
import 'package:ed_tech/core/utils/sizeconfig.dart';
import 'package:ed_tech/features/login/provider/login.dart';
import 'package:ed_tech/widgets/CustomLoader.dart';
import 'package:ed_tech/widgets/custom_textfield.dart';
import 'package:ed_tech/widgets/gradient_background.dart';
import 'package:ed_tech/widgets/custom_button.dart'; // Your CustomButton
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  // Button IDs for loader management
  static const String SIGNIN_BUTTON_ID = "signin_btn";
  static const String QUICK_LOGIN_BUTTON_ID = "quick_login_btn";
  static const String SKIP_LOGIN_BUTTON_ID = "skip_login_btn";
  static const String FORGOT_PASSWORD_BUTTON_ID = "forgot_password_btn";

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final authProvider = Provider.of<AuthProvider>(context);
    SizeConfig().init(context);

    return GradientBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: SizeConfig.getPaddingSymmetric(horizontal: 20),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(height: SizeConfig.height(1)),

                    // Logo and title section
                    Container(
                      width: SizeConfig.width(20),
                      height: SizeConfig.height(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFF00BFFF).withOpacity(0.3),
                            blurRadius: 30,
                            spreadRadius: 10,
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.school,
                        size: SizeConfig.height(5),
                        color: Color(0xFF00BFFF),
                      ),
                    ),

                    SizedBox(height: SizeConfig.height(2)),

                    Text(
                      'MIXO Labs',
                      style: AppTypography.h1(context).copyWith(
                        fontSize: 28,
                        color: themeProvider.isDarkMode
                            ? AppColors.white
                            : AppColors.textPrimary,
                      ),
                    ),

                    Text(
                      'Next-Gen Learning Platform',
                      style: AppTypography.h5(context).copyWith(
                        color: themeProvider.isDarkMode
                            ? AppColors.white
                            : AppColors.textPrimary,
                      ),
                    ),

                    SizedBox(height: SizeConfig.height(3)),

                    // Sign In Form
                    Container(
                      padding: SizeConfig.getPaddingSymmetric(
                          horizontal: 20, vertical: 20),
                      decoration: BoxDecoration(
                        color: themeProvider.isDarkMode
                            ? AppColors.conPrimary
                            : AppColors.white,
                        borderRadius: BorderRadius.circular(24),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black87.withOpacity(0.2),
                            blurRadius: 20,
                            offset: Offset(0, 10),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Sign In',
                            style: AppTypography.h3(context).copyWith(
                              fontWeight: FontWeight.w600,
                              color: themeProvider.isDarkMode
                                  ? AppColors.white
                                  : AppColors.textPrimary,
                            ),
                          ),

                          // Show error message if exists
                          if (authProvider.errorMessage != null) ...[
                            SizedBox(height: SizeConfig.height(1)),
                            Container(
                              padding: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.red.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                    color: Colors.red.withOpacity(0.3)),
                              ),
                              child: Row(
                                children: [
                                  Icon(Icons.error_outline,
                                      color: Colors.red, size: 20),
                                  SizedBox(width: 8),
                                  Expanded(
                                    child: Text(
                                      authProvider.errorMessage!,
                                      style: TextStyle(
                                          color: Colors.red, fontSize: 14),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],

                          SizedBox(height: SizeConfig.height(2)),

                          // Username Field
                          Text(
                            'Username',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: themeProvider.isDarkMode
                                  ? AppColors.textLogin
                                  : AppColors.textSecondary,
                            ),
                          ),
                          SizedBox(height: SizeConfig.height(0.2)),
                          CustomTextField(
                            controller: _usernameController,
                            prefixIcon: Icon(Icons.person),
                            hintText: "Enter your username",
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter username';
                              }
                              return null;
                            },
                          ),

                          SizedBox(height: SizeConfig.height(1)),

                          // Password Field
                          Text(
                            'Password',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: themeProvider.isDarkMode
                                  ? AppColors.textLogin
                                  : AppColors.textSecondary,
                            ),
                          ),
                          SizedBox(height: SizeConfig.height(0.2)),
                          PasswordTextField(
                            controller: _passwordController,
                            prefixIcon: Icon(Icons.lock),
                            hintText: "Enter your password",
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter password';
                              }
                              if (value.length < 6) {
                                return 'Password must be at least 6 characters';
                              }
                              return null;
                            },
                          ),

                          SizedBox(height: SizeConfig.height(1)),

                          // Forgot Password Button
                          Align(
                            alignment: Alignment.centerRight,
                            child: Consumer<ButtonLoaderManager>(
                              builder: (context, loaderManager, child) {
                                return TextButton(
                                  onPressed: loaderManager
                                          .isLoading(FORGOT_PASSWORD_BUTTON_ID)
                                      ? null
                                      : () => _handleForgotPassword(),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      if (loaderManager.isLoading(
                                          FORGOT_PASSWORD_BUTTON_ID)) ...[
                                        SizedBox(
                                          child: CircularProgressIndicator(
                                            strokeWidth: 2,
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                                    Color(0xFF00BFFF)),
                                          ),
                                        ),
                                        SizedBox(width: SizeConfig.width(8)),
                                      ],
                                      Text(
                                        'Forgot Password?',
                                        style: TextStyle(
                                          color: Color(0xFF00BFFF),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),

                          SizedBox(height: SizeConfig.height(2.5)),

                          // Sign In Button - Using CustomButton
                          CustomButton(
                            buttonId: SIGNIN_BUTTON_ID,
                            text: "Sign In",
                            loadingText: "Signing In...",
                            backgroundColor: AppColors.buttonColor,
                            textColor: Colors.white,
                            width: SizeConfig.width(35),
                            height: SizeConfig.height(6),
                            borderRadius: 15,
                            onPressed: _handleSignIn,
                            fullWidth: true,
                          ),

                          SizedBox(height: 24),

                          Center(
                            child: Text(
                              'Test Account',
                              style: TextStyle(
                                color: Color(0xFF999999),
                                fontSize: 14,
                              ),
                            ),
                          ),

                          SizedBox(height: SizeConfig.height(1.5)),

                          // Quick Action Buttons
                          Row(
                            children: [
                              Expanded(
                                child: CustomButton(
                                  buttonId: QUICK_LOGIN_BUTTON_ID,
                                  text: "Quick Login",
                                  // loadingText: "Logging.",
                                  height: SizeConfig.height(5),
                                  borderRadius: 10,
                                  backgroundColor: themeProvider.isDarkMode
                                      ? AppColors.buttonbg
                                      : AppColors.buttonsecondry,
                                  textColor: AppColors.buttonColor,
                                  elevation: 0,
                                  onPressed: _handleQuickLogin,
                                ),
                              ),
                              SizedBox(width: SizeConfig.width(1)),
                              Expanded(
                                child: CustomButton(
                                  buttonId: SKIP_LOGIN_BUTTON_ID,
                                  text: "Skip Login",
                                  // loadingText: "Skipping.",
                                  height: SizeConfig.height(5),
                                  borderRadius: 10,
                                  backgroundColor: themeProvider.isDarkMode
                                      ? AppColors.buttonnew
                                      : AppColors.yellooff,
                                  textColor: AppColors.yello,
                                  elevation: 0,
                                  onPressed: _handleSkipLogin,
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
        ),
      ),
    );
  }

  // Handle sign in with button loader
  Future<void> _handleSignIn() async {
    if (!_formKey.currentState!.validate()) return;

    final buttonActions = ButtonActions(context);

    await buttonActions.handleLogin(
      SIGNIN_BUTTON_ID,
      _usernameController.text.trim(),
      _passwordController.text,
      onSuccess: () {
        Navigator.pushReplacementNamed(context, '/home');
      },
      onError: (error) {
        _showErrorDialog(error);
      },
    );
  }

  // Handle quick login with button loader
  Future<void> _handleQuickLogin() async {
    final buttonActions = ButtonActions(context);

    await buttonActions.handleQuickLogin(
      QUICK_LOGIN_BUTTON_ID,
      onSuccess: () {
        Navigator.pushReplacementNamed(context, '/home');
      },
      onError: (error) {
        _showErrorDialog(error);
      },
    );
  }

  // Handle skip login with button loader
  Future<void> _handleSkipLogin() async {
    final buttonActions = ButtonActions(context);

    await buttonActions.handleSkipLogin(
      SKIP_LOGIN_BUTTON_ID,
      onSuccess: () {
        Navigator.pushReplacementNamed(context, '/home');
      },
      onError: (error) {
        _showErrorDialog(error);
      },
    );
  }

  // Handle forgot password with button loader
  Future<void> _handleForgotPassword() async {
    if (_usernameController.text.isEmpty) {
      _showErrorDialog("Please enter username first");
      return;
    }

    final loaderManager =
        Provider.of<ButtonLoaderManager>(context, listen: false);
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    try {
      loaderManager.startLoading(FORGOT_PASSWORD_BUTTON_ID);

      final success =
          await authProvider.resetPassword(_usernameController.text);

      if (success) {
        _showSuccessDialog("Password reset instructions sent!");
      } else {
        _showErrorDialog(authProvider.errorMessage ?? "Password reset failed");
      }
    } finally {
      loaderManager.stopLoading(FORGOT_PASSWORD_BUTTON_ID);
    }
  }

  // Show error dialog
  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Row(
          children: [
            Icon(Icons.error_outline, color: Colors.red),
            SizedBox(width: 8),
            Text('Error'),
          ],
        ),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  // Show success dialog
  void _showSuccessDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Row(
          children: [
            Icon(Icons.check_circle_outline, color: Colors.green),
            SizedBox(width: 8),
            Text('Success'),
          ],
        ),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }
}
