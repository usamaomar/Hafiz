import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'ar'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? arText = '',
  }) =>
      [enText, arText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // LoginPage
  {
    'yw07rmyo': {
      'en': 'Hafiz App',
      'ar': 'تطبيق حافظ',
    },
    'qfjkwl0b': {
      'en': 'Phone Number',
      'ar': 'رقم التليفون',
    },
    'xbdt7rxl': {
      'en': 'Password',
      'ar': 'كلمة المرور',
    },
    'g6it9cpv': {
      'en': 'Login',
      'ar': 'تسجيل دخول',
    },
    'c4oim3hl': {
      'en': 'Home',
      'ar': '',
    },
  },
  // AdminHomePage
  {
    'jih0hglw': {
      'en': 'Home',
      'ar': '',
    },
  },
  // DeveloperHomePage
  {
    'c159myw0': {
      'en': 'Search',
      'ar': 'بحث',
    },
    'b96a179c': {
      'en': '',
      'ar': '',
    },
    '88ouvljg': {
      'en': '',
      'ar': '',
    },
  },
  // UserHomePage
  {
    's1qy6gxp': {
      'en': 'Home',
      'ar': '',
    },
  },
  // SplashPage
  {
    '3i2hct3l': {
      'en': 'Hafiz App',
      'ar': 'تطبيق حافظ',
    },
    'exld0lzw': {
      'en': 'Home',
      'ar': '',
    },
  },
  // sideComponent
  {
    'jnfc9vnz': {
      'en': 'Haviz',
      'ar': 'حافظ',
    },
    'as827qzf': {
      'en': 'Add Center',
      'ar': 'اضافة مركز',
    },
    'dy8tk8pv': {
      'en': 'Add Admins',
      'ar': 'إضافة المسؤولين',
    },
  },
  // AddCenterDialog
  {
    'c0nxzsnh': {
      'en': 'Center Name',
      'ar': 'اسم المركز',
    },
    '2m9j8svb': {
      'en': 'Phone Number',
      'ar': 'رقم الهاتف',
    },
    'e7eqdp27': {
      'en': 'Save',
      'ar': 'حفظ',
    },
  },
  // MapComponent
  {
    '7e06yetq': {
      'en': 'Set location',
      'ar': 'حدد المكان',
    },
  },
  // Miscellaneous
  {
    'o5z0fi3d': {
      'en': '',
      'ar': '',
    },
    'mt83dqrx': {
      'en': '',
      'ar': '',
    },
    '7k0bqy3f': {
      'en': '',
      'ar': '',
    },
    '2jh3wkv1': {
      'en': '',
      'ar': '',
    },
    '2rispc4g': {
      'en': '',
      'ar': '',
    },
    '6syho20j': {
      'en': '',
      'ar': '',
    },
    'xvjidlsl': {
      'en': '',
      'ar': '',
    },
    'vf1ff0qr': {
      'en': '',
      'ar': '',
    },
    '4vpzxskz': {
      'en': '',
      'ar': '',
    },
    'mrteji55': {
      'en': '',
      'ar': '',
    },
    'lozlupj8': {
      'en': '',
      'ar': '',
    },
    'j045vhh7': {
      'en': '',
      'ar': '',
    },
    'qx1e8f5v': {
      'en': '',
      'ar': '',
    },
    'fupbyi0u': {
      'en': '',
      'ar': '',
    },
    '7ix8i89w': {
      'en': '',
      'ar': '',
    },
    '4oqabrne': {
      'en': '',
      'ar': '',
    },
    'dw7p9j8q': {
      'en': '',
      'ar': '',
    },
    'qu1ruhxa': {
      'en': '',
      'ar': '',
    },
    '6d1s1jj4': {
      'en': '',
      'ar': '',
    },
    '09snj3gx': {
      'en': '',
      'ar': '',
    },
    '3nbkkhb4': {
      'en': '',
      'ar': '',
    },
    'x14gympj': {
      'en': '',
      'ar': '',
    },
    '2wd6mc3u': {
      'en': '',
      'ar': '',
    },
  },
].reduce((a, b) => a..addAll(b));
