import 'package:ed_tech/features/login/provider/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ButtonLoaderManager extends ChangeNotifier {
  final Map<String, bool> _loadingStates = {};

  // Get loading state for a specific button
  bool isLoading(String buttonId) {
    return _loadingStates[buttonId] ?? false;
  }

  // Set loading state for a specific button
  void setLoading(String buttonId, bool isLoading) {
    _loadingStates[buttonId] = isLoading;
    notifyListeners();
  }

  // Start loading for a button
  void startLoading(String buttonId) {
    setLoading(buttonId, true);
  }

  // Stop loading for a button
  void stopLoading(String buttonId) {
    setLoading(buttonId, false);
  }

  // Stop all loading states
  void stopAllLoading() {
    _loadingStates.clear();
    notifyListeners();
  }

  // Check if any button is loading
  bool get hasAnyLoading {
    return _loadingStates.values.any((isLoading) => isLoading);
  }

  // Get all currently loading button IDs
  List<String> get loadingButtonIds {
    return _loadingStates.entries
        .where((entry) => entry.value)
        .map((entry) => entry.key)
        .toList();
  }
}

// Enhanced Custom Button with loader integration
class LoaderAwareButton extends StatelessWidget {
  final String buttonId;
  final String text;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final double? width;
  final double? height;
  final double borderRadius;
  final double elevation;
  final String? loadingText;
  final Widget? loadingWidget;

  const LoaderAwareButton({
    Key? key,
    required this.buttonId,
    required this.text,
    this.onPressed,
    this.backgroundColor = Colors.blue,
    this.textColor = Colors.white,
    this.width,
    this.height = 50,
    this.borderRadius = 12,
    this.elevation = 2,
    this.loadingText,
    this.loadingWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ButtonLoaderManager>(
      builder: (context, loaderManager, child) {
        final isLoading = loaderManager.isLoading(buttonId);

        return Container(
          width: width,
          height: height,
          child: ElevatedButton(
            onPressed: isLoading ? null : onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: backgroundColor,
              foregroundColor: textColor,
              elevation: elevation,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius),
              ),
            ),
            child: isLoading
                ? _buildLoadingContent()
                : Text(
                    text,
                    style: TextStyle(
                      color: textColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
          ),
        );
      },
    );
  }

  Widget _buildLoadingContent() {
    if (loadingWidget != null) {
      return loadingWidget!;
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 16,
          height: 16,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            valueColor: AlwaysStoppedAnimation<Color>(
              textColor ?? Colors.white,
            ),
          ),
        ),
        if (loadingText != null) ...[
          SizedBox(width: 8),
          Text(
            loadingText!,
            style: TextStyle(
              color: textColor,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ],
    );
  }
}

// Example usage helper class
class ButtonActions {
  final ButtonLoaderManager _loaderManager;
  final BuildContext _context;

  ButtonActions(this._context)
      : _loaderManager =
            Provider.of<ButtonLoaderManager>(_context, listen: false);

  // Generic method to handle button actions with loading
  Future<void> executeWithLoader(
    String buttonId,
    Future<void> Function() action, {
    VoidCallback? onSuccess,
    void Function(String error)? onError,
  }) async {
    try {
      _loaderManager.startLoading(buttonId);
      await action();
      onSuccess?.call();
    } catch (e) {
      onError?.call(e.toString());
    } finally {
      _loaderManager.stopLoading(buttonId);
    }
  }

  // Specific login action
  Future<void> handleLogin(
    String buttonId,
    String username,
    String password, {
    VoidCallback? onSuccess,
    void Function(String error)? onError,
  }) async {
    final authProvider = Provider.of<AuthProvider>(_context, listen: false);

    await executeWithLoader(
      buttonId,
      () => authProvider.login(username, password),
      onSuccess: () {
        if (authProvider.isAuthenticated) {
          onSuccess?.call();
        } else {
          onError?.call(authProvider.errorMessage ?? 'Login failed');
        }
      },
      onError: onError,
    );
  }

  // Quick login action
  Future<void> handleQuickLogin(
    String buttonId, {
    VoidCallback? onSuccess,
    void Function(String error)? onError,
  }) async {
    final authProvider = Provider.of<AuthProvider>(_context, listen: false);

    await executeWithLoader(
      buttonId,
      () => authProvider.quickLogin(),
      onSuccess: () {
        if (authProvider.isAuthenticated) {
          onSuccess?.call();
        } else {
          onError?.call(authProvider.errorMessage ?? 'Quick login failed');
        }
      },
      onError: onError,
    );
  }

  // Skip login action
  Future<void> handleSkipLogin(
    String buttonId, {
    VoidCallback? onSuccess,
    void Function(String error)? onError,
  }) async {
    final authProvider = Provider.of<AuthProvider>(_context, listen: false);

    await executeWithLoader(
      buttonId,
      () => authProvider.skipLogin(),
      onSuccess: onSuccess,
      onError: onError,
    );
  }
}
