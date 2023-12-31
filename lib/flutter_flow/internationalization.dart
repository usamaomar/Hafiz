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
    '9r1hjcbs': {
      'en': 'Center Name',
      'ar': 'اسم المركز',
    },
    'nnv2dv3a': {
      'en': 'Phone Number',
      'ar': 'رقم التليفون',
    },
    '2jluf0b5': {
      'en': 'Assign',
      'ar': 'تعيين',
    },
    '88ouvljg': {
      'en': '',
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
  // AddAdminsPage
  {
    'bouh0nkl': {
      'en': 'Search',
      'ar': 'بحث',
    },
    'ufus4mf0': {
      'en': '',
      'ar': '',
    },
    'y9lxu6r2': {
      'en': 'Name',
      'ar': 'الاسم',
    },
    '0a4cyotz': {
      'en': 'Phone Number',
      'ar': 'رقم التليفون',
    },
    'aivrqb6f': {
      'en': 'Type',
      'ar': 'النوع',
    },
    'ogrnc2u2': {
      'en': 'Show',
      'ar': 'يعرض',
    },
  },
  // AdminsPage
  {
    '2i8cmryd': {
      'en': 'Search',
      'ar': 'بحث',
    },
    '2ixnse8s': {
      'en': '',
      'ar': '',
    },
    'o80g1lva': {
      'en': 'Name',
      'ar': 'الاسم',
    },
    'esln3ehn': {
      'en': 'Phone Number',
      'ar': 'رقم التليفون',
    },
    '0couzkft': {
      'en': '   ',
      'ar': '   ',
    },
  },
  // AdminHomePage
  {
    'm2shazif': {
      'en': 'Search',
      'ar': 'بحث',
    },
    '9p19fr36': {
      'en': '',
      'ar': '',
    },
    'uz9v8zlm': {
      'en': 'Names of Centers',
      'ar': 'اسماء المراكز',
    },
    'zodwpwf5': {
      'en': '',
      'ar': '',
    },
  },
  // AddParentPage
  {
    'x29m9huv': {
      'en': 'Search',
      'ar': 'بحث',
    },
    'vwppl9fp': {
      'en': '',
      'ar': '',
    },
    'xn65tho4': {
      'en': 'Parent Name : ',
      'ar': 'اسم الوالدين :',
    },
    'dbouzltw': {
      'en': 'Phone Number : ',
      'ar': 'رقم التليفون :',
    },
    'lx60tis1': {
      'en': 'Fathers Name',
      'ar': 'اسم ولي الامر',
    },
  },
  // SettingsPage
  {
    '39z4eauf': {
      'en': 'Logout',
      'ar': 'تسجيل خروج',
    },
    'jviea4yo': {
      'en': 'Settings',
      'ar': 'إعدادات',
    },
    '79hjq5uh': {
      'en': 'Home',
      'ar': '',
    },
  },
  // AddSonePage
  {
    'bwttkwp4': {
      'en': 'Search',
      'ar': 'بحث',
    },
    'ncmepp6f': {
      'en': '',
      'ar': '',
    },
    '9i2zxeaw': {
      'en': 'Son Name : ',
      'ar': 'اسم الحافظ :',
    },
    'v4h6wpge': {
      'en': 'Age : ',
      'ar': 'عمر :',
    },
    '0tlf7pbf': {
      'en': 'Add saved',
      'ar': 'أضف المحفوظات',
    },
    'fvxw07fz': {
      'en': 'Haves Name',
      'ar': 'اسم الحافظ',
    },
  },
  // SurahsPage
  {
    '26s5gv0q': {
      'en': 'Search',
      'ar': 'بحث',
    },
    'erwccc5g': {
      'en': '',
      'ar': '',
    },
    'hqxgdks1': {
      'en': 'Qraan Surahs',
      'ar': 'سور القران',
    },
    '4qznjez8': {
      'en': 'Home',
      'ar': '',
    },
  },
  // UserHomePage
  {
    'p2yffv31': {
      'en': 'Search',
      'ar': 'بحث',
    },
    '1x0xqu1f': {
      'en': '',
      'ar': '',
    },
    'q1jwv86x': {
      'en': 'Son Name : ',
      'ar': 'اسم الحافظ :',
    },
    'x9wz3old': {
      'en': 'Age : ',
      'ar': 'عمر :',
    },
    '9ntzm21o': {
      'en': 'Add saved',
      'ar': 'أضف المحفوظات',
    },
    '6pybq6aw': {
      'en': 'Haves Name',
      'ar': 'اسم الحافظ',
    },
  },
  // ParentSurahsPage
  {
    'rbdjl12o': {
      'en': 'Search',
      'ar': 'بحث',
    },
    '9axld02j': {
      'en': '',
      'ar': '',
    },
    '0d9zi8nr': {
      'en': 'Qraan Surahs',
      'ar': 'سور القران',
    },
    'rojihuqq': {
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
  // AddUserDialog
  {
    'eocqudi3': {
      'en': 'User Name',
      'ar': 'اسم المستخدم',
    },
    'neyaxwn9': {
      'en': 'Phone Number',
      'ar': 'رقم الهاتف',
    },
    'v7bbtb0h': {
      'en': 'password',
      'ar': 'كلمة المرور',
    },
    '0kjr0ij7': {
      'en': 'Developer',
      'ar': 'مطور',
    },
    'yp1m6zfn': {
      'en': 'Teacher',
      'ar': 'استاذ',
    },
    'u1mju42u': {
      'en': 'Select User Type',
      'ar': 'حدد نوع المستخدم',
    },
    'eoq7zbgt': {
      'en': 'Search for an item...',
      'ar': '',
    },
    'q1t9aquy': {
      'en': 'Save',
      'ar': 'حفظ',
    },
  },
  // AsignTeatcherDialog
  {
    '20w1ittr': {
      'en': 'Centers you are registered in',
      'ar': 'المراكز التي قمت بالتسجيل فيها',
    },
  },
  // ShowTeatcherDialog
  {
    'ziwspbvu': {
      'en': 'Hello World',
      'ar': '',
    },
    '7a2txfbm': {
      'en': 'Add',
      'ar': 'يضيف',
    },
  },
  // ShowserDialog
  {
    '5kxze7rg': {
      'en': 'Hello World',
      'ar': '',
    },
    'o6lhidxe': {
      'en': 'Hello World',
      'ar': '',
    },
  },
  // AddParentDialog
  {
    'w3x3q61q': {
      'en': 'Father Name',
      'ar': 'اسم ولي الامر',
    },
    'x8hqddgh': {
      'en': 'Phone Number',
      'ar': 'رقم الهاتف',
    },
    'cy1m6rxg': {
      'en': 'password',
      'ar': 'كلمة المرور',
    },
    '2eij2cop': {
      'en': 'Save',
      'ar': 'حفظ',
    },
  },
  // AddSoneDialog
  {
    'd4idxgat': {
      'en': 'Sone Name',
      'ar': 'اسم الحافظ',
    },
    'xxsgb6la': {
      'en': '5',
      'ar': '',
    },
    '6qlp4gna': {
      'en': '6',
      'ar': '',
    },
    'vhxrhcs2': {
      'en': '7',
      'ar': '',
    },
    'v9i36wsg': {
      'en': '8',
      'ar': '',
    },
    '8fdmlitv': {
      'en': '9',
      'ar': '',
    },
    'psuan6ak': {
      'en': '10',
      'ar': '',
    },
    'ra0qtayd': {
      'en': '11',
      'ar': '',
    },
    '5yywswql': {
      'en': '12',
      'ar': '',
    },
    'wfsnel8q': {
      'en': '13',
      'ar': '',
    },
    'f0mdtmfk': {
      'en': '14',
      'ar': '',
    },
    'bfsn3dwx': {
      'en': '15',
      'ar': '',
    },
    'dcht3ugl': {
      'en': '16',
      'ar': '',
    },
    'xdlsxt3v': {
      'en': '17',
      'ar': '',
    },
    'zhwcu792': {
      'en': '18',
      'ar': '',
    },
    'mbkrk4kq': {
      'en': '19',
      'ar': '',
    },
    'vegszlmv': {
      'en': '20',
      'ar': '',
    },
    'qy2u5co4': {
      'en': 'Age',
      'ar': 'عمر',
    },
    'gzevnvv0': {
      'en': 'Search for an item...',
      'ar': '',
    },
    '0tunl9xu': {
      'en': 'Save',
      'ar': 'حفظ',
    },
  },
  // AddHifzComponentDialog
  {
    '99uxnvjy': {
      'en': 'Record  Save',
      'ar': 'سجل الحفظ',
    },
    'isuz2h0i': {
      'en': 'Saved Until Ayah',
      'ar': 'تم الحفظ حتى آية',
    },
    '8cl4qwyc': {
      'en': 'Save Next Time',
      'ar': 'حفظ في المرة القادمة',
    },
    'cli486je': {
      'en': 'Cancel',
      'ar': 'يلغي',
    },
    'lj4trl7s': {
      'en': 'Save',
      'ar': 'يحفظ',
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
