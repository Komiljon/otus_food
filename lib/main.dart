import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'db/hive_service.dart';
import 'pages/add_new_recept.dart';
import 'pages/auth.dart';
import 'pages/favorites_list.dart';
import 'pages/food_detail.dart';
import 'pages/food_list.dart';
import 'pages/start.dart';
import 'providers/provider.dart';



main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveService.initHive(); // Инициализация БД
  runApp(MultiBlocProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => FavProdProvider()..getFavoriteProdcount()), // Избранные рецепты
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
   const MyApp({super.key});
  /*
   final GoRouter _router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
          path: '/',
          name: 'start',
          builder: (BuildContext context, GoRouterState state) {
            return const StartPage();
          },
          routes: <RouteBase>[
            GoRoute(
              path: '/home',
              name: 'home',
              builder: (BuildContext context, GoRouterState state) {
                return const FoodListScreen();
              },
            ),
            GoRoute(
              path: '/food',
              name: 'food',
              builder: (BuildContext context, GoRouterState state) {
                return const FoodDetail(id: 0);
              },
            ),
            GoRoute(
              path: '/favorites',
              name: 'favorites',
              builder: (BuildContext context, GoRouterState state) {
                return const FavoriteFoodeListScreen();
              },
            ),
            GoRoute(
              path: '/auth',
              name: 'auth',
              builder: (BuildContext context, GoRouterState state) {
                return const LoginRegister();
              },
            ),
            GoRoute(
              path: '/addnewrecept',
              name: 'addnewrecept',
              builder: (BuildContext context, GoRouterState state) {
                return const AddNewRecept();
              },
            ),
          ],
        ),
      
    ],
  );
  */
    

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Otus Food',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromRGBO(46, 204, 113, 1)),
            useMaterial3: true,
            fontFamily: 'Roboto'),
        //routerConfig: _router,
        initialRoute: '/start',
        routes: {
          '/start': (context) => const StartPage(),
          '/': (context) => const FoodListScreen(),
          '/food': (context) => const FoodDetail(id: 0),
          '/favorites': (context) => const FavoriteFoodeListScreen(),
          '/auth': (context) => const LoginRegister(),
          '/addnewrecept': (context) => const AddNewRecept(),
        }
    );
  }
}
