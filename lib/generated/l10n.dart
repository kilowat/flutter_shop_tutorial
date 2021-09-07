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

  /// `пропустить`
  String get SKIP {
    return Intl.message(
      'пропустить',
      name: 'SKIP',
      desc: '',
      args: [],
    );
  }

  /// `Дальше`
  String get NEXT {
    return Intl.message(
      'Дальше',
      name: 'NEXT',
      desc: '',
      args: [],
    );
  }

  /// `Готов`
  String get DONE {
    return Intl.message(
      'Готов',
      name: 'DONE',
      desc: '',
      args: [],
    );
  }

  /// `Выберите товар онлайн`
  String get STEP_1_TITLE {
    return Intl.message(
      'Выберите товар онлайн',
      name: 'STEP_1_TITLE',
      desc: '',
      args: [],
    );
  }

  /// `Спланируйте поездку, выберите пункт назначения и выберите лучшее место для отдыха.`
  String get STEP_1_DESCRIPTION {
    return Intl.message(
      'Спланируйте поездку, выберите пункт назначения и выберите лучшее место для отдыха.',
      name: 'STEP_1_DESCRIPTION',
      desc: '',
      args: [],
    );
  }

  /// `Оплатите онлайн`
  String get STEP_2_TITLE {
    return Intl.message(
      'Оплатите онлайн',
      name: 'STEP_2_TITLE',
      desc: '',
      args: [],
    );
  }

  /// `Спланируйте поездку, выберите пункт назначения и выберите лучшее место для отдыха.`
  String get STEP_2_DESCRIPTION {
    return Intl.message(
      'Спланируйте поездку, выберите пункт назначения и выберите лучшее место для отдыха.',
      name: 'STEP_2_DESCRIPTION',
      desc: '',
      args: [],
    );
  }

  /// `Получите ваш загаз`
  String get STEP_3_TITLE {
    return Intl.message(
      'Получите ваш загаз',
      name: 'STEP_3_TITLE',
      desc: '',
      args: [],
    );
  }

  /// `Спланируйте поездку, выберите пункт назначения и выберите лучшее место для отдыха.`
  String get STEP_3_DESCRIPTION {
    return Intl.message(
      'Спланируйте поездку, выберите пункт назначения и выберите лучшее место для отдыха.',
      name: 'STEP_3_DESCRIPTION',
      desc: '',
      args: [],
    );
  }

  /// `Вход`
  String get LOGIN {
    return Intl.message(
      'Вход',
      name: 'LOGIN',
      desc: '',
      args: [],
    );
  }

  /// `Все категории`
  String get ALL_CATEGORIES {
    return Intl.message(
      'Все категории',
      name: 'ALL_CATEGORIES',
      desc: '',
      args: [],
    );
  }

  /// `Главная`
  String get HOME {
    return Intl.message(
      'Главная',
      name: 'HOME',
      desc: '',
      args: [],
    );
  }

  /// `Топ продаж`
  String get BEST_SELLER {
    return Intl.message(
      'Топ продаж',
      name: 'BEST_SELLER',
      desc: '',
      args: [],
    );
  }

  /// `Посмотреть все`
  String get VIEW_ALL {
    return Intl.message(
      'Посмотреть все',
      name: 'VIEW_ALL',
      desc: '',
      args: [],
    );
  }

  /// `Поиск`
  String get SEARCH {
    return Intl.message(
      'Поиск',
      name: 'SEARCH',
      desc: '',
      args: [],
    );
  }

  /// `Разделы`
  String get CATEGORIES {
    return Intl.message(
      'Разделы',
      name: 'CATEGORIES',
      desc: '',
      args: [],
    );
  }

  /// `Корзина`
  String get CART {
    return Intl.message(
      'Корзина',
      name: 'CART',
      desc: '',
      args: [],
    );
  }

  /// `Профиль`
  String get PROFILE {
    return Intl.message(
      'Профиль',
      name: 'PROFILE',
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
