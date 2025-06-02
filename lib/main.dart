// import 'package:ed_tech/config/theme/theme_provider.dart';
// import 'package:ed_tech/features/login/screen/login.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         ChangeNotifierProvider(create: (context) => ThemeProvider(context)),
//         // Add other providers here as needed
//         // ChangeNotifierProvider(create: (_) => AuthProvider()),
//         // ChangeNotifierProvider(create: (_) => UserProvider()),
//       ],
//       child: Consumer<ThemeProvider>(
//         builder: (context, themeProvider, child) {
//           return MaterialApp(
//             title: 'Flutter Demo',
//             theme: ThemeData(
//               colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//               useMaterial3: true,
//               brightness: Brightness.light,
//             ),
//             darkTheme: ThemeData(
//               colorScheme: ColorScheme.fromSeed(
//                 seedColor: Colors.deepPurple,
//                 brightness: Brightness.dark,
//               ),
//               useMaterial3: true,
//               brightness: Brightness.dark,
//             ),
//             themeMode:
//                 themeProvider.isDarkMode ? ThemeMode.dark : ThemeMode.light,
//             home: SignInScreen(),
//             debugShowCheckedModeBanner: false,
//           );
//         },
//       ),
//     );
//   }
// }

import 'package:ed_tech/config/theme/theme_provider.dart';
import 'package:ed_tech/features/home/screen/home_screen.dart';
import 'package:ed_tech/features/login/provider/login.dart';
import 'package:ed_tech/features/login/screen/login.dart';
import 'package:ed_tech/widgets/CustomLoader.dart';
import 'package:ed_tech/widgets/custom_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider(context)),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => ButtonLoaderManager()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            title: 'MIXO Labs - Ed Tech',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
              brightness:
                  themeProvider.isDarkMode ? Brightness.dark : Brightness.light,
              fontFamily: 'Poppins', // Add your preferred font family
            ),
            initialRoute: '/',
            routes: {
              '/': (context) => AuthWrapper(),
              '/signin': (context) => SignInScreen(),
              '/home': (context) =>
                  HomeWrapper(initialIndex: 0), // or MainScreen()
            },
          );
        },
      ),
    );
  }
}

// AuthWrapper to handle initial routing based on authentication state
class AuthWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, authProvider, child) {
        // Check if user is already authenticated
        if (authProvider.isAuthenticated) {
          return HomeScreen();
        } else {
          return SignInScreen();
        }
      },
    );
  }
}

// Optional: Splash Screen for better UX
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkAuthStatus();
  }

  Future<void> _checkAuthStatus() async {
    // Simulate checking stored auth token or user session
    await Future.delayed(Duration(seconds: 2));

    // Navigate based on authentication status
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    if (authProvider.isAuthenticated) {
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      Navigator.pushReplacementNamed(context, '/signin');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // App Logo
            Container(
              width: 100,
              height: 100,
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
                size: 50,
                color: Color(0xFF00BFFF),
              ),
            ),

            SizedBox(height: 30),

            Text(
              'MIXO Labs',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Color(0xFF00BFFF),
              ),
            ),

            SizedBox(height: 10),

            Text(
              'Next-Gen Learning Platform',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),

            SizedBox(height: 50),

            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF00BFFF)),
            ),
          ],
        ),
      ),
    );
  }
}
