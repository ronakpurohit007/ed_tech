import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionUtils {
  /// Check for microphone permission.
  /// Returns true if granted, otherwise requests permission and shows appropriate dialogs.
  static Future<bool> checkMicrophonePermission(BuildContext context) async {
    PermissionStatus status = await Permission.microphone.status;
    debugPrint("Microphone permission status: $status");

    if (status.isGranted) {
      return true;
    } else if (status.isPermanentlyDenied) {
      _showOpenSettingsDialog(context);
      return false;
    } else if (status.isDenied || status.isLimited) {
      final result = await Permission.microphone.request();
      if (result.isGranted) {
        return true;
      } else {
        _showPermissionDeniedDialog(context);
        return false;
      }
    }

    return false;
  }

  static void _showPermissionDeniedDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Permission Denied"),
        content: const Text(
            "Microphone permission is required to record your voice. Please allow it."),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  static void _showOpenSettingsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Permission Required"),
        content: const Text(
            "Microphone permission is permanently denied. Please open settings and enable the permission."),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              openAppSettings();
            },
            child: const Text("Open Settings"),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text("Cancel"),
          ),
        ],
      ),
    );
  }
}
