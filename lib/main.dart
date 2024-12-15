import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'db/hive_service.dart';
import 'generated/l10n.dart';
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
  await HiveReciepService.initHive();
  runApp(MultiBlocProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => FavProdProvider()..getFavoriteProdcount()), // Избранные рецепты
      ChangeNotifierProvider(create: (_) => LocalesProvider()..getLocalState()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    String lcl = context.watch<LocalesProvider>().lc;
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
      },
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: Locale(lcl),
      supportedLocales: S.delegate.supportedLocales,
    );
  }
}
