import 'package:dio/dio.dart';
import 'package:ed_tech/core/utils/network_info.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'package:shared_preferences/shared_preferences.dart';

final GetIt getIt = GetIt.instance;

Future<void> setupDependencies() async {
  // Core
  getIt.registerLazySingleton(() => http.Client());
  getIt.registerLazySingleton(() => Dio());
  // getIt.registerLazySingleton(() => InternetConnectionChecker());
  getIt.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(getIt()));
  // getIt.registerLazySingleton(() => ApiClient(getIt(), getIt()));
  // getIt.registerLazySingleton(() => AIApiClient(getIt()));

  //sharedpref
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerSingleton<SharedPreferences>(sharedPreferences);

  //services
  // getIt.registerSingleton<AuthService>(AuthService(getIt<SharedPreferences>()));
  // getIt.registerSingleton<UserService>(
  //     UserService(getIt<Dio>(), getIt<NetworkInfo>()));

  // Repositories
  // getIt.registerLazySingleton(() => FeatureRepository(getIt()));
  // getIt.registerLazySingleton(() => LoginRepository());
  // getIt.registerLazySingleton(() => BottomBarRepository(getIt(), getIt()));
  // getIt.registerLazySingleton(() => ChatRepository(getIt(), getIt()));
  // getIt.registerLazySingleton(() => ProfileRepository(getIt()));
  // getIt.registerLazySingleton(() => ChatHistoryRepository(getIt()));
  // getIt.registerLazySingleton(() => AgentRepository(getIt(), getIt(), getIt()));
  // getIt.registerLazySingleton(() => PasswordRepository(getIt()));
  // getIt.registerLazySingleton(() => AreaRepository(getIt()));
  // getIt.registerLazySingleton(() => ResearchStyleRepository(getIt()));
  // getIt.registerLazySingleton(() => ManageLanguageRepository(getIt()));

  // // Providers - IMPORTANT: Register AuthProvider BEFORE LoginProvider
  // getIt.registerFactory<AuthProvider>(
  //     () => AuthProvider(getIt<AuthService>(), getIt<UserService>()));

  // //LoginProvider since AuthProvider is already registered
  // getIt.registerFactory<LoginProvider>(
  //     () => LoginProvider(getIt<AuthProvider>()));

  // getIt.registerFactory(() => ButtonStateProvider());
  // getIt.registerFactory(() => FeatureProvider(getIt()));
  // getIt.registerFactory(() => BottomBarProvider(getIt()));
  // getIt.registerFactory(() => LanguageProvider());
  // getIt.registerFactory(() => ChatProvider(getIt(), getIt(), getIt()));
  // getIt.registerFactory(() => ProfileProvider(getIt(), getIt()));
  // getIt.registerFactory(() => SideBarProvider());
  // getIt.registerFactory(() => ChatHistoryProvider(getIt()));

  // getIt.registerFactory<AgentProvider>(
  //     () => AgentProvider(getIt<AgentRepository>(), getIt<UserService>()));
  // getIt.registerFactory(() => VoiceSearchProvider());
  // getIt.registerFactory(() => PersonalizeProvider(getIt(), getIt()));
  // getIt.registerFactory(() => ChangePasswordProvider(getIt()));
  // getIt.registerFactory(() => TextToSpeechProvider());
  // getIt.registerFactory(() => AreaProvider(getIt(), getIt(), getIt()));
  // getIt.registerFactory(() => ResearchStyleProvider(getIt(), getIt()));
  // getIt.registerFactory(() => SpeaktoSpeakProvider(getIt()));
  // getIt.registerFactory(() => TTSProvider());
  // getIt.registerFactory(
  //     () => ManageLanagugeProvider(getIt(), getIt(), getIt()));
  // getIt.registerFactory(() => TutorialState());
  // You can add more dependencies here as your app grows
}
