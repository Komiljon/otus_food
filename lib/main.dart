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
        initialRoute: '/start',
        routes: {
          '/start': (context) => const StartPage(),
          '/': (context) => const FoodListScreen(),
          '/food': (context) => const FoodDetail(id: 0),
          '/favorites': (context) => const FavoriteFoodeListScreen(),
          '/auth': (context) => const LoginRegister(),
          '/addnewrecept': (context) => const AddNewRecept(),
        });
  }
}
