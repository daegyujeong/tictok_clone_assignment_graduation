import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:tictok_clone_assignment_graduation/constants/sizes.dart';
import 'package:tictok_clone_assignment_graduation/features/authentication/view/sign_in_screen.dart';
import 'package:tictok_clone_assignment_graduation/features/authentication/view/sign_up_screen.dart';
import 'package:tictok_clone_assignment_graduation/features/home/home_screen.dart';
import 'package:tictok_clone_assignment_graduation/firebase_options.dart';
import 'package:tictok_clone_assignment_graduation/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
      // options: DefaultFirebaseOptions.currentPlatform,
      );

  // await SystemChrome.setPreferredOrientations(
  //   [
  //     DeviceOrientation.portraitUp,
  //   ],
  // );

  // final preferences = await SharedPreferences.getInstance();
  // final preferences2 = await SharedPreferences.getInstance();
  // final settingRepository = SettingRepository(preferences2);
  // final repository = PlaybackConfigRepository(preferences);

  // runApp(ProviderScope(
  //   overrides: [
  //     // sharedPreferencesProvider.overrideWithValue(preferences),
  //     settingConfigProvider
  //         .overrideWith(() => SettingViewModel(settingRepository)),
  //     // playbackConfigRepositoryProvider.overrideWithValue(repository),
  //   ],
  //   child: const MoodApp(),
  // ));
  runApp(
    const ProviderScope(
      child: MoodApp(),
    ),
  );
}

class MoodApp extends ConsumerWidget {
  const MoodApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final darkmode = ref.watch(settingConfigProvider).darkmode;
    // ThemeMode themeMode;

    // switch (darkmode) {
    //   case DarkMode.light:
    //     themeMode = ThemeMode.light;
    //     break;
    //   case DarkMode.dark:
    //     themeMode = ThemeMode.dark;
    //     break;
    //   case DarkMode.system:
    //   default:
    //     themeMode = ThemeMode.system;
    //     break;
    // }
    // final router = GoRouter(
    //   routes: [
    //     GoRoute(
    //       path: SignInScreen.routeURL,
    //       builder: (context, state) => const SignInScreen(),
    //     ),
    //     GoRoute(
    //       path: SignUpScreen.routeURL,
    //       builder: (context, state) => const SignUpScreen(),
    //     ),
    //     GoRoute(
    //       path: HomeScreen.routeURL,
    //       builder: (context, state) => const HomeScreen(),
    //     ),
    //   ],
    // );
    return MaterialApp.router(
      routerConfig: ref.watch(routerProvider),
      title: 'TikTok Clone',
      // themeMode: themeMode,
      theme: ThemeData(
        useMaterial3: false,
        scaffoldBackgroundColor: Colors.white,
        primaryColor: const Color(0xFF4A98E9),
        appBarTheme: const AppBarTheme(
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          elevation: 0,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: Sizes.size16,
            // fontSize: Sizes.size16 + Sizes.size2,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
        bottomAppBarTheme: BottomAppBarTheme(
          color: Colors.grey.shade900,
        ),
        primaryColor: const Color(0xFFE9435A),
      ),
      // home:
      //     const SignInScreen(), //SignInScreen(), //MainNavigationScreen() VerificationScreen(),
    );
  }
}
