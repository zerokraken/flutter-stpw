import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'es'];

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
    String? esText = '',
  }) =>
      [enText, esText][languageIndex] ?? '';

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
  // signIn
  {
    'bdnhg92s': {
      'en': 'Welcome',
      'es': 'Bienvenido',
    },
    'yztmrgwj': {
      'en': 'Use the form below to access your account.',
      'es': 'Utilice el siguiente formulario para acceder a su cuenta.',
    },
    'hw1dti08': {
      'en': 'Email Address',
      'es': 'Dirección de correo electrónico',
    },
    '45kvzc5n': {
      'en': 'Enter your email here...',
      'es': 'Introduzca su correo electrónico aquí...',
    },
    'y7bb7zha': {
      'en': 'Password',
      'es': 'Contraseña',
    },
    'eeid574l': {
      'en': 'Enter your email here...',
      'es': 'Introduzca su correo electrónico aquí...',
    },
    'bwd6xae0': {
      'en': 'Forgot Password?',
      'es': '¿Has olvidado tu contraseña?',
    },
    '069b8viw': {
      'en': 'Sign In',
      'es': 'Iniciar sesión',
    },
    '9l0919id': {
      'en': 'Use a social platform to continue',
      'es': 'Usa una plataforma social para continuar',
    },
    'bcqdo0bx': {
      'en': 'Don\'t have an account?',
      'es': '¿No tienes una cuenta?',
    },
    'gq09ftf5': {
      'en': 'Create Account',
      'es': 'Crear una cuenta',
    },
    'lx0llptv': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // signUp
  {
    'i3d9g8bd': {
      'en': 'Get Started',
      'es': 'Empezar',
    },
    'on03xl68': {
      'en': 'Create an account by using the form below.',
      'es': 'Cree una cuenta utilizando el siguiente formulario.',
    },
    '4r9x1pe7': {
      'en': 'Email Address',
      'es': 'Dirección de correo electrónico',
    },
    'boq5roay': {
      'en': 'Enter your email here...',
      'es': 'Introduzca su correo electrónico aquí...',
    },
    'r98cbv0t': {
      'en': 'Password',
      'es': 'Contraseña',
    },
    'kdcyyi3q': {
      'en': 'Enter your email here...',
      'es': 'Introduzca su correo electrónico aquí...',
    },
    'blx5wmea': {
      'en': 'Phone Number',
      'es': 'Contraseña',
    },
    '33cnxl45': {
      'en': 'Enter your phone number here...',
      'es': 'Introduzca su correo electrónico aquí...',
    },
    'uwclsndk': {
      'en': 'Sign Up',
      'es': 'Inscribirse',
    },
    '86hgicph': {
      'en': 'Use a social platform to continue',
      'es': 'Usa una plataforma social para continuar',
    },
    'pf9ud24l': {
      'en': 'Already have an account?',
      'es': '¿Ya tienes una cuenta?',
    },
    'j8q9koum': {
      'en': 'Login',
      'es': 'Acceso',
    },
    'gvkx46xi': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // createProfile
  {
    'zisu25qa': {
      'en': 'Create Profile',
      'es': 'Crear perfil',
    },
    '0v1rog9s': {
      'en': 'Badge ID',
      'es': 'Su nombre',
    },
    '89r0708n': {
      'en': 'Your Name',
      'es': 'Su nombre',
    },
    'd7gtbt79': {
      'en': 'Your City',
      'es': 'Tu ciudad',
    },
    'zmi2dngp': {
      'en': 'State',
      'es': 'Estado',
    },
    'g7o2gi3w': {
      'en': 'State',
      'es': 'Estado',
    },
    '3rpryy9h': {
      'en': 'Alabama',
      'es': 'Alabama',
    },
    '18th1p9h': {
      'en': 'Alaska',
      'es': 'Alaska',
    },
    'p388sq0h': {
      'en': 'Arizona',
      'es': 'Arizona',
    },
    'fqc0ymrs': {
      'en': 'Arkansas',
      'es': 'Arkansas',
    },
    'db7zotlp': {
      'en': 'California',
      'es': 'California',
    },
    'h2m9iwk3': {
      'en': 'Colorado',
      'es': 'Colorado',
    },
    'tb8wz98i': {
      'en': 'Connecticut',
      'es': 'Connecticut',
    },
    'ajsujlgm': {
      'en': 'Delaware',
      'es': 'Delaware',
    },
    'p3gn8iz2': {
      'en': 'Florida',
      'es': 'Florida',
    },
    'a7f9zmkx': {
      'en': 'Georgia',
      'es': 'Georgia',
    },
    'dvm7ztyv': {
      'en': 'Hawaii',
      'es': 'Hawai',
    },
    'wu9h62ub': {
      'en': 'Idaho',
      'es': 'Idaho',
    },
    'eouyvt1v': {
      'en': 'Illinoi',
      'es': 'Illinois',
    },
    'hlyj5n3p': {
      'en': 'Indiana',
      'es': 'Indiana',
    },
    'n1t3vfwk': {
      'en': 'Iowa',
      'es': 'Iowa',
    },
    'f1q1509x': {
      'en': 'Kansas',
      'es': 'Kansas',
    },
    'useh5ek8': {
      'en': 'Kentucky',
      'es': 'Kentucky',
    },
    '00zrldq0': {
      'en': 'Louisiana',
      'es': 'Luisiana',
    },
    '2u1pct30': {
      'en': 'Maine',
      'es': 'Maine',
    },
    'q7kkpxrt': {
      'en': 'Maryland',
      'es': 'Maryland',
    },
    '1qw2re4k': {
      'en': 'Massachusetts',
      'es': 'Massachusetts',
    },
    '209nstj5': {
      'en': 'Michigan',
      'es': 'Michigan',
    },
    '07xqf6pp': {
      'en': 'Minnesota',
      'es': 'Minnesota',
    },
    'mh163h21': {
      'en': 'Mississippi',
      'es': 'Misisipí',
    },
    '7ut85zd3': {
      'en': 'Missouri',
      'es': 'Misuri',
    },
    'nz4lt5iy': {
      'en': 'Monta',
      'es': 'Monta',
    },
    '1on7thhn': {
      'en': 'Nebraska',
      'es': 'Nebraska',
    },
    'rc4klke7': {
      'en': 'Nevada',
      'es': 'Nevada',
    },
    'fqgl4nyi': {
      'en': 'New Hampshire',
      'es': 'nuevo hampshire',
    },
    '15gyjt1b': {
      'en': 'New Jersey',
      'es': 'New Jersey',
    },
    'qhlirymf': {
      'en': 'New Mexico',
      'es': 'Nuevo Mexico',
    },
    'gemt7170': {
      'en': 'New York',
      'es': 'Nueva York',
    },
    'b82h0wuz': {
      'en': 'North Carolina',
      'es': 'Carolina del Norte',
    },
    'lzn3k0zc': {
      'en': 'North Dak',
      'es': 'Dak del norte',
    },
    '4li44ghs': {
      'en': 'Ohio',
      'es': 'Ohio',
    },
    'era7iun9': {
      'en': 'Oklahoma',
      'es': 'Oklahoma',
    },
    '43offinb': {
      'en': 'Oregon',
      'es': 'Oregón',
    },
    '80c6di5x': {
      'en': 'Pennsylvani',
      'es': 'Pensilvania',
    },
    'acjd3tng': {
      'en': 'Rhode Island',
      'es': 'Rhode Island',
    },
    'hfs6yd6r': {
      'en': 'South Caroli',
      'es': 'carolina del sur',
    },
    'm13c391s': {
      'en': 'South Dakota',
      'es': 'Dakota del Sur',
    },
    'hbo9gxwj': {
      'en': 'Tennessee',
      'es': 'Tennesse',
    },
    'i3w71slk': {
      'en': 'Texas',
      'es': 'Texas',
    },
    '0qf55u5e': {
      'en': 'Utah',
      'es': 'Utah',
    },
    'nx5rjwhf': {
      'en': 'Vermont',
      'es': 'Vermont',
    },
    'fkcme2yb': {
      'en': 'Virginia',
      'es': 'Virginia',
    },
    's74yqr1g': {
      'en': 'Washingto',
      'es': 'Lavar a',
    },
    'dop72cwb': {
      'en': 'West Virginia',
      'es': 'Virginia del Oeste',
    },
    't9033pkf': {
      'en': 'Wisconsin',
      'es': 'Wisconsin',
    },
    'yffpcshz': {
      'en': 'Wyoming',
      'es': 'Wyoming',
    },
    '5tuc6o8d': {
      'en': 'Select State',
      'es': 'Seleccione estado',
    },
    '6jaqhs2x': {
      'en': 'Phone Number',
      'es': 'Número de teléfono',
    },
    'nr420u9k': {
      'en': 'Your bio',
      'es': 'tu biografía',
    },
    '6bh0g5ud': {
      'en': 'Save Changes',
      'es': 'Guardar cambios',
    },
    'yl9m3gmp': {
      'en': 'Create Profile',
      'es': 'Crear perfil',
    },
  },
  // phoneSignIn
  {
    '3au9efni': {
      'en': 'Phone Sign In',
      'es': 'Iniciar sesión en el teléfono',
    },
    'r6202pqb': {
      'en': 'Phone Sign In',
      'es': 'Iniciar sesión en el teléfono',
    },
    'j7n47pv2': {
      'en': 'Type in your phone number below to register.',
      'es': 'Escriba su número de teléfono a continuación para registrarse.',
    },
    'h5xnqipe': {
      'en': 'Your Phone Number',
      'es': 'Su número de teléfono',
    },
    'ucjgvpk0': {
      'en': 'Please enter a valid number...',
      'es': 'Por favor ingrese un número valido...',
    },
    'a3gm20e5': {
      'en': 'Sign In with Phone',
      'es': 'Iniciar sesión con el teléfono',
    },
    '5ae8wt83': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // forgotPassword
  {
    'fs8ed1ox': {
      'en': 'Forgot Password',
      'es': 'Has olvidado tu contraseña',
    },
    '6jmrkdnk': {
      'en': 'Forgot Password',
      'es': 'Has olvidado tu contraseña',
    },
    'oqedvncq': {
      'en':
          'We will send you an email with a link to reset your password, please enter the email associated with your account below.',
      'es':
          'Le enviaremos un correo electrónico con un enlace para restablecer su contraseña, ingrese el correo electrónico asociado con su cuenta a continuación.',
    },
    'qx6rj9fh': {
      'en': 'Your email',
      'es': 'Tu correo electrónico',
    },
    'j5hv09hl': {
      'en': 'Enter your email to recieve a linke...',
      'es': 'Ingrese su correo electrónico para recibir un enlacee...',
    },
    '4ysd4qgq': {
      'en': 'Send Reset Link',
      'es': 'Enviar enlace de reinicio',
    },
    'vdoxrmkv': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // phoneVerify
  {
    '6g1kg82c': {
      'en': 'Confirm your Code',
      'es': 'Confirma tu Código',
    },
    'rd4wfa6n': {
      'en': 'Confirm your Code',
      'es': 'Confirma tu Código',
    },
    'cw1zqhzu': {
      'en': 'This code helps keep your account safe and secure.',
      'es': 'Este código ayuda a mantener su cuenta segura y protegida.',
    },
    '4spfwdb8': {
      'en': 'Confirm & Continue',
      'es': 'Confirmar y continuar',
    },
    '6ch5w8it': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // homePage
  {
    'jvxi8je5': {
      'en': 'Dashboard',
      'es': 'Panel',
    },
    'ehmtu9gb': {
      'en': 'Hello',
      'es': 'Hola',
    },
    'd9x4mpns': {
      'en': '[Name]',
      'es': '[Nombre]',
    },
    '48mzc7j6': {
      'en': 'Badge # [#######]',
      'es': 'Una visión general de sus cursos.',
    },
    'r4twvk9w': {
      'en': '23%',
      'es': '23%',
    },
    'ofqe2d8l': {
      'en': 'Progress',
      'es': 'Progreso del curso',
    },
    'tuatv6ff': {
      'en': '93%',
      'es': '93%',
    },
    's4u3ksm3': {
      'en': 'Truck condition ',
      'es': 'Grado del curso',
    },
    'j2cjvqfp': {
      'en': 'Active Users',
      'es': 'Usuarios activos',
    },
    'moxzayid': {
      'en': 'A small summary of your users base',
      'es': 'Un pequeño resumen de su base de usuarios',
    },
    'o7ay8jzi': {
      'en': 'Total User Count',
      'es': 'Recuento total de usuarios',
    },
    'zodsgmhs': {
      'en': 'An overview of all your users on your platform.',
      'es': 'Una visión general de todos sus usuarios en su plataforma.',
    },
    '0vka93v9': {
      'en': '56.4k',
      'es': '56.4k',
    },
    'inq6d8uc': {
      'en': 'truck files',
      'es': '',
    },
    '0jxmu6tu': {
      'en': 'Driver Files',
      'es': '',
    },
    'i5zepdjp': {
      'en': 'Appointment',
      'es': 'Cita',
    },
    'z2rpc0wi': {
      'en': 'Appointment #',
      'es': 'Nombre de miembro',
    },
    'v002ya7c': {
      'en': 'Email',
      'es': 'Correo electrónico',
    },
    'qrn9ct6f': {
      'en': 'Last Active',
      'es': 'Último Activo',
    },
    'g3tg9iqu': {
      'en': 'Date Created',
      'es': 'fecha de creacion',
    },
    'sfkpfsen': {
      'en': 'Status',
      'es': 'Estado',
    },
    'beqvaa2d': {
      'en': 'App Number',
      'es': 'Nombre personalizado',
    },
    'khk91mjd': {
      'en': 'user@domainname.com',
      'es': 'usuario@nombrededominio.com',
    },
    '34ate0mi': {
      'en': 'Active',
      'es': 'Activo',
    },
    '4k6v3ow1': {
      'en': 'App Number',
      'es': 'Nombre personalizado',
    },
    'yj9ehyvp': {
      'en': 'user@domainname.com',
      'es': 'usuario@nombrededominio.com',
    },
    'tcsthgx0': {
      'en': 'Hold',
      'es': 'Sostener',
    },
    'dkrr1cei': {
      'en': 'App Number',
      'es': 'Nombre personalizado',
    },
    'u0szzujx': {
      'en': 'user@domainname.com',
      'es': 'usuario@nombrededominio.com',
    },
    '8pzvst5p': {
      'en': 'In Progress',
      'es': 'En curso',
    },
    'xltafqoy': {
      'en': '•',
      'es': '•',
    },
  },
  // NewAppoitment
  {
    'pxvuwsdr': {
      'en': 'New Appointment',
      'es': 'Nueva cita',
    },
    'd550n1f7': {
      'en': 'Submit',
      'es': 'Entregar',
    },
    'skv52vxq': {
      'en': 'Option 1',
      'es': 'Opción 1',
    },
    '7lhatalu': {
      'en': 'Please select...',
      'es': 'Por favor selecciona...',
    },
    'fqmg1bl2': {
      'en': 'Search for an item...',
      'es': 'Buscar un artículo...',
    },
    '9wdbuuee': {
      'en': 'Containers #',
      'es': 'Contenedores #',
    },
    'nkya8rta': {
      'en': 'Bill of Lading #',
      'es': 'Guía de carga #',
    },
    'q7izlj7o': {
      'en': 'Add container(s) number(s)',
      'es': 'Agregar número(s) de contenedor(es)',
    },
    'w3wzap62': {
      'en': '[Some hint text...]',
      'es': '[Algún texto de pista...]',
    },
    'bu4oip7k': {
      'en': '•',
      'es': '•',
    },
  },
  // NewRequest
  {
    '01trb6am': {
      'en': 'Appointment ticket',
      'es': '',
    },
    '9wor39th': {
      'en': 'Hello World',
      'es': '',
    },
    '7idjyb7e': {
      'en': 'MTO:',
      'es': '',
    },
    'nt7rru3j': {
      'en': 'Appt Date:',
      'es': '',
    },
    'i4neizb9': {
      'en': 'Time:',
      'es': '',
    },
    '4d17e7yc': {
      'en': 'Driver ID:',
      'es': '',
    },
    '6ey6ydek': {
      'en': 'truck No.:',
      'es': '',
    },
    'nvllwnf2': {
      'en': 'Line:',
      'es': '',
    },
    'h1ge5fqf': {
      'en': 'Container #:',
      'es': '',
    },
    '97utjcmy': {
      'en': 'Booking #:',
      'es': '',
    },
    '0jyqquhj': {
      'en': 'Chassis #:',
      'es': '',
    },
    'gvnv8f35': {
      'en': 'Seal:',
      'es': '',
    },
    '3fh7d6u4': {
      'en': 'Type:',
      'es': '',
    },
    'iwcol2t4': {
      'en': 'Upload',
      'es': '',
    },
    'vlo9sjp0': {
      'en': 'Home',
      'es': '',
    },
  },
  // AppSettings
  {
    '3iotzq8s': {
      'en':
          'Choose what notifcations you want to recieve below and we will update the settings.',
      'es': '',
    },
    'l8z0hnvj': {
      'en': 'Push Notifications',
      'es': '',
    },
    'ztfo41bg': {
      'en':
          'Receive Push notifications from our application on a semi regular basis.',
      'es': '',
    },
    'yof7avp5': {
      'en': 'Email Notifications',
      'es': '',
    },
    'z7pzcvqq': {
      'en':
          'Receive email notifications from our marketing team about new features.',
      'es': '',
    },
    'kigcrzi6': {
      'en': 'Location Services',
      'es': '',
    },
    'klckvwjq': {
      'en':
          'Allow us to track your location, this helps keep track of spending and keeps you safe.',
      'es': '',
    },
    '539dir97': {
      'en': 'Save Changes',
      'es': '',
    },
    '9zbda2jc': {
      'en': 'Settings',
      'es': '',
    },
  },
  // Maps
  {
    '7aw1l4dm': {
      'en': 'Hello',
      'es': '',
    },
    'bxzlkylg': {
      'en': '[Name]',
      'es': '',
    },
    'zthwtcu5': {
      'en': 'Browse our listings below.',
      'es': '',
    },
  },
  // Profile2
  {
    '9cjngwdd': {
      'en': '[NAME]',
      'es': '',
    },
    'wdzespvo': {
      'en': '[mail@email.com]',
      'es': '',
    },
    '1q7m6h7l': {
      'en': 'Account',
      'es': '',
    },
    'v6xbgs4q': {
      'en': 'Country',
      'es': '',
    },
    '354861f5': {
      'en': 'Settings',
      'es': '',
    },
    '1ofcywsg': {
      'en': 'Edit Profile',
      'es': '',
    },
    't5twia3c': {
      'en': 'General',
      'es': '',
    },
    's3tbsatf': {
      'en': 'Support',
      'es': '',
    },
    'ahmgjb4t': {
      'en': 'Terms of Service',
      'es': '',
    },
    'pw1lfgqe': {
      'en': 'All rights reserved. Copyright © 2023 STPW INC.',
      'es': '',
    },
    'ivut7tgp': {
      'en': 'Profile',
      'es': '',
    },
    'klnowjf3': {
      'en': 'Home',
      'es': '',
    },
  },
  // sideBarNav
  {
    '1e6pj78t': {
      'en': 'Search...',
      'es': 'Buscar...',
    },
    'nx8bokua': {
      'en': 'Dashboard',
      'es': 'Panel',
    },
    'vgwskuxw': {
      'en': 'New Appointment',
      'es': 'Crear una cita',
    },
    'u98beeaf': {
      'en': 'Map',
      'es': 'En proceso',
    },
    'okmeu07j': {
      'en': 'Profile',
      'es': 'Perfil',
    },
    '9g27q3m2': {
      'en': 'Settings',
      'es': 'Perfil',
    },
    'u9qpylop': {
      'en': 'All rights reserved. Copyright © 2023 STPW INC.',
      'es': '',
    },
  },
  // Miscellaneous
  {
    'rq77c3yi': {
      'en': ' Allow access to your data',
      'es': '',
    },
    '6ciawg0k': {
      'en': ' Allow access to your data',
      'es': '',
    },
    '13se6oc0': {
      'en': 'Allow access to your data',
      'es': '',
    },
    'wslaghyw': {
      'en': ' Allow access to your data',
      'es': '',
    },
    'n53cnf7l': {
      'en': 'Comfirn your Identification',
      'es': '',
    },
    'ty48u09v': {
      'en': ' Allow access to your data',
      'es': '',
    },
    '8sybzum2': {
      'en': ' Allow access to your data',
      'es': '',
    },
    'azeqz6uj': {
      'en': ' Allow access to your data',
      'es': '',
    },
    'je95l2z8': {
      'en': ' Allow access to your data',
      'es': '',
    },
    '0eundyxy': {
      'en': ' Allow access to your data',
      'es': '',
    },
    'fbe0xio1': {
      'en': 'Allow access to your system',
      'es': '',
    },
    'jwfqbxl9': {
      'en': '',
      'es': '',
    },
    'be1217pz': {
      'en': '',
      'es': '',
    },
    'x2kxbjmd': {
      'en': '',
      'es': '',
    },
    '8ebcoa9u': {
      'en': '',
      'es': '',
    },
    'zl74qmqj': {
      'en': '',
      'es': '',
    },
    'c7wi7xy5': {
      'en': '',
      'es': '',
    },
    'fwpns8nq': {
      'en': '',
      'es': '',
    },
    'awgf7ks3': {
      'en': '',
      'es': '',
    },
    'mpmhy3fn': {
      'en': '',
      'es': '',
    },
    'p6fsdlyu': {
      'en': '',
      'es': '',
    },
    'mg3yv2j3': {
      'en': '',
      'es': '',
    },
    'jhrco3x5': {
      'en': '',
      'es': '',
    },
    'oryynm5s': {
      'en': '',
      'es': '',
    },
    '8m2n8pjg': {
      'en': '',
      'es': '',
    },
    'pfp0q60t': {
      'en': '',
      'es': '',
    },
    '0y4skvbw': {
      'en': '',
      'es': '',
    },
    'mfa1or8z': {
      'en': '',
      'es': '',
    },
    '5ixlfhh9': {
      'en': '',
      'es': '',
    },
    'aizoilae': {
      'en': '',
      'es': '',
    },
    'iwfw8j6o': {
      'en': '',
      'es': '',
    },
    'cf52t95l': {
      'en': '',
      'es': '',
    },
  },
].reduce((a, b) => a..addAll(b));
