import 'package:flutter/material.dart';

class AppRoutes {
  static const String splash = '/';
  static const String login = '/login';
  // static const String chat = '/chat';
  static const String chat = '/chat';
  static const String bottombar = '/bottombar';
  static const String firstchat = '/firstchat';
  static const String chatting = '/chatting';
  static const String profile = '/profile';
  static const String setting = '/setting';
  static const String chatHistory = '/chatHistory';
  static const String agents = '/agents';
  static const String resetpassword = '/resetpassword';
  static const String generatepassword = '/generatepassword';

  static const String personalize = '/personalize';

  static const String voieSearch = '/voiceSearch';
  static const String manageLanguge = '/manageLanguage';
  static const String welcome = '/welcome';
  static const String welcomeOrg = '/welcomeOrg';
  static const String password = '/password';
  static const String language = '/language';
  static const String image = '/image';
  static const String video = '/video';
  static const String contactus = '/contactus';
  static const String security = '/security';
  static const String speaktospeak = '/speaktospeak';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case login:
      // return MaterialPageRoute(builder: (_) => const LoginScreen());
      case password:
      // return MaterialPageRoute(
      //   builder: (_) {
      //     final String email = settings.arguments as String? ??
      //         ''; // Get the email from arguments
      //     return PasswordScreen(email: email);
      //   },
      // );
      // case chat:
      //   return MaterialPageRoute(builder: (_) => const ChatScreen());
      // case chat:
      //   return MaterialPageRoute(builder: (_) => const ChatScreenNew());
      // case bottombar:
      //return MaterialPageRoute(builder: (_) => const BottomBarScreen());
      //   return SmoothSlideRightRoute<String>(page: const BottomBarScreen());
      // case firstchat:
      //   return SlideUpRoute<String>(page: const FirstTimeChatComponent());
      // case personalize:
      //   return FadeInOutRoute<String>(page: PersonalizeScreen());
      // case setting:
      //   return FadeInSlideOutRoute<String>(page: SettingsScreen());
      // case chatting:
      //   return MaterialPageRoute(
      //       builder: (_) => ChattingScreen(
      //             argument: settings.arguments,
      //           ));
      // case profile:
      //   return FadeInSlideOutRoute<String>(page: UpdateProfile());

      // case chatHistory:
      //   return SmoothSlideRightRoute(
      //     page: ChatHistory(
      //       argument: settings.arguments, // Pass the argument here
      //     ),
      //   );

      // case agents:
      //   return SlideUpRoute<String>(page: AgentsScreen());
      // case voieSearch:
      //   return MaterialPageRoute(builder: (_) => const VoiceSearchScreen());
      // case manageLanguge:
      //   return FadeInOutRoute<String>(page: ManageLanguageScreen());

      // case resetpassword:
      //   return MaterialPageRoute(
      //     builder: (_) => ResetPassword(),
      //   );

      // case generatepassword:
      //   return SlideUpRoute<String>(page: const GeneratePassword());
      // case welcome:
      //   return SlideUpRoute<String>(page: const WelcomeScreen());

      // case welcomeOrg:
      //   return SlideUpRoute<String>(page: const WelcomeOrg());
      // case language:
      //   return SlideUpRoute<String>(page: const LanguageSelectionScreen());

      // case image:
      //   return SmoothSlideRightRoute<String>(
      //       page: ImageGridScreen(
      //     argument: settings.arguments,
      //   ));
      // case video:
      //   return SmoothSlideRightRoute<String>(
      //       page: VideoGridScreen(
      //     argument: settings.arguments,
      //   ));

      // case contactus:
      //   return FadeInSlideOutRoute<String>(page: const ContactUsScreen());

      // case security:
      //   return FadeInOutRoute<String>(page: const SecurityScreen());
      // case speaktospeak:
      //   return FadeInOutRoute<String>(page: const SpeechChatScreen());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
