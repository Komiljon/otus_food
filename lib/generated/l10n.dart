// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Recipe`
  String get recipe {
    return Intl.message(
      'Recipe',
      name: 'recipe',
      desc: '',
      args: [],
    );
  }

  /// `Refrigerator`
  String get holodilnik {
    return Intl.message(
      'Refrigerator',
      name: 'holodilnik',
      desc: '',
      args: [],
    );
  }

  /// `Favorite`
  String get favorite {
    return Intl.message(
      'Favorite',
      name: 'favorite',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `leave a comment`
  String get addcomment {
    return Intl.message(
      'leave a comment',
      name: 'addcomment',
      desc: '',
      args: [],
    );
  }

  /// `New recipe`
  String get addreciepttitle {
    return Intl.message(
      'New recipe',
      name: 'addreciepttitle',
      desc: '',
      args: [],
    );
  }

  /// `Recipe name`
  String get recipename {
    return Intl.message(
      'Recipe name',
      name: 'recipename',
      desc: '',
      args: [],
    );
  }

  /// `Fill in this field`
  String get fillfeald {
    return Intl.message(
      'Fill in this field',
      name: 'fillfeald',
      desc: '',
      args: [],
    );
  }

  /// `Add recipe photo`
  String get addphotor {
    return Intl.message(
      'Add recipe photo',
      name: 'addphotor',
      desc: '',
      args: [],
    );
  }

  /// `Ingredients`
  String get ingredients {
    return Intl.message(
      'Ingredients',
      name: 'ingredients',
      desc: '',
      args: [],
    );
  }

  /// `Add ingredient`
  String get addingredient {
    return Intl.message(
      'Add ingredient',
      name: 'addingredient',
      desc: '',
      args: [],
    );
  }

  /// `Cooking steps`
  String get cookingsteps {
    return Intl.message(
      'Cooking steps',
      name: 'cookingsteps',
      desc: '',
      args: [],
    );
  }

  /// `Add a step`
  String get addstep {
    return Intl.message(
      'Add a step',
      name: 'addstep',
      desc: '',
      args: [],
    );
  }

  /// `Save recipe`
  String get saverecipe {
    return Intl.message(
      'Save recipe',
      name: 'saverecipe',
      desc: '',
      args: [],
    );
  }

  /// `Timer`
  String get timer {
    return Intl.message(
      'Timer',
      name: 'timer',
      desc: '',
      args: [],
    );
  }

  /// `Finish cooking`
  String get endcooking {
    return Intl.message(
      'Finish cooking',
      name: 'endcooking',
      desc: '',
      args: [],
    );
  }

  /// `Start cooking`
  String get startcooking {
    return Intl.message(
      'Start cooking',
      name: 'startcooking',
      desc: '',
      args: [],
    );
  }

  /// `Ingredient`
  String get ingredient {
    return Intl.message(
      'Ingredient',
      name: 'ingredient',
      desc: '',
      args: [],
    );
  }

  /// `Ingredient name`
  String get ingredientname {
    return Intl.message(
      'Ingredient name',
      name: 'ingredientname',
      desc: '',
      args: [],
    );
  }

  /// `Quantity`
  String get quantity {
    return Intl.message(
      'Quantity',
      name: 'quantity',
      desc: '',
      args: [],
    );
  }

  /// `Add`
  String get add {
    return Intl.message(
      'Add',
      name: 'add',
      desc: '',
      args: [],
    );
  }

  /// `Recipe step`
  String get recipestep {
    return Intl.message(
      'Recipe step',
      name: 'recipestep',
      desc: '',
      args: [],
    );
  }

  /// `Step Description`
  String get stepdesc {
    return Intl.message(
      'Step Description',
      name: 'stepdesc',
      desc: '',
      args: [],
    );
  }

  /// `Step duration`
  String get stepduration {
    return Intl.message(
      'Step duration',
      name: 'stepduration',
      desc: '',
      args: [],
    );
  }

  /// `Minutes`
  String get minutes {
    return Intl.message(
      'Minutes',
      name: 'minutes',
      desc: '',
      args: [],
    );
  }

  /// `Seconds`
  String get secunds {
    return Intl.message(
      'Seconds',
      name: 'secunds',
      desc: '',
      args: [],
    );
  }

  /// `no ingredients`
  String get noingredients {
    return Intl.message(
      'no ingredients',
      name: 'noingredients',
      desc: '',
      args: [],
    );
  }

  /// `no cooking steps`
  String get nocookingsteps {
    return Intl.message(
      'no cooking steps',
      name: 'nocookingsteps',
      desc: '',
      args: [],
    );
  }

  /// `No data`
  String get nodata {
    return Intl.message(
      'No data',
      name: 'nodata',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ru'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
