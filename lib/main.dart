import 'package:easy_meal/local_storage_management/hive_services.dart';
import 'package:easy_meal/models/meal_model.dart';
import 'package:easy_meal/screens/historical/history_page.dart';
import 'package:easy_meal/screens/home_screen.dart';
import 'package:easy_meal/screens/meal_page.dart';
import 'package:easy_meal/screens/sign_in.dart';
import 'package:easy_meal/screens/sign_up.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'firebase_options.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AuthStateNotifier extends ChangeNotifier {
  late final Stream<User?> _authStateChanges;
  User? _currentUser;

  AuthStateNotifier() {
    _authStateChanges = FirebaseAuth.instance.authStateChanges();
    _authStateChanges.listen((User? user) {
      _currentUser = user;
      notifyListeners();
    });
    // Initial check
    _currentUser = FirebaseAuth.instance.currentUser;
  }

  User? get currentUser => _currentUser;
  bool get isLoggedIn => _currentUser != null;
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Hive.initFlutter();
  await HiveServices.initHive();

  final authStateNotifier = AuthStateNotifier();

  runApp(MainApp(authStateNotifier: authStateNotifier));
}

class MainApp extends StatefulWidget {
  final AuthStateNotifier authStateNotifier;
  const MainApp({super.key, required this.authStateNotifier});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  late final GoRouter _router;

  @override
  void initState() {
    super.initState();

    _router = GoRouter(
      refreshListenable: widget.authStateNotifier,
      initialLocation: '/splash',
      debugLogDiagnostics: true,

      routes: <RouteBase>[
        GoRoute(
          path: '/splash',
          builder: (BuildContext context, GoRouterState state) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          },
        ),
        GoRoute(
          path: '/login',
          name: 'login',
          builder: (BuildContext context, GoRouterState state) {
            return SignInPage();
          },
        ),
        GoRoute(
          path: '/signup',
          name: 'signup',
          builder: (BuildContext context, GoRouterState state) {
            return SignUpPage();
          },
        ),
        GoRoute(
          path: '/',
          name: 'home',
          builder: (BuildContext context, GoRouterState state) {
            return const HomeScreen();
          },
          routes: <RouteBase>[
            GoRoute(
              path: 'history',
              name: 'history',
              builder: (BuildContext context, GoRouterState state) {
                return const HistoryPage();
              },
            ),
            GoRoute(
              path: 'meal',
              name: 'meal',
              builder: (BuildContext context, GoRouterState state) {
                final MealModel? meal = state.extra as MealModel?;
                return MealPage(
                  meal: meal ?? MealModel(name: 'No Name', image: Uint8List(0)),
                );
              },
            ),
          ],
        ),
      ],

      redirect: (BuildContext context, GoRouterState state) {
        final bool loggedIn = widget.authStateNotifier.isLoggedIn;
        final String location = state.uri.toString();

        if (location == '/splash') {
          if (FirebaseAuth.instance.currentUser == null && !loggedIn) {
            return '/login';
          }
          if (FirebaseAuth.instance.currentUser != null && loggedIn) return '/';
          return null;
        }

        final bool isAuthRoute = location == '/login' || location == '/signup';
        if (!loggedIn && !isAuthRoute) {
          return '/login';
        }

        if (loggedIn && isAuthRoute) {
          return '/';
        }
        return null;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (buildContext, orientation, screenType) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: _router,
        );
      },
    );
  }
}
