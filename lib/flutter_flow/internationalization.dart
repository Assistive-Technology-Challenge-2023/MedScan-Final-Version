import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['fr', 'it', 'de'];

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
    String? frText = '',
    String? itText = '',
    String? deText = '',
  }) =>
      [frText, itText, deText][languageIndex] ?? '';

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
  // HomePage
  {
    'dc8te609': {
      'fr': 'Mes médicaments',
      'de': 'Meine Medikamente',
      'it': 'I miei farmaci',
    },
    'nibi4kvv': {
      'fr': 'Ajouter un médicament',
      'de': 'Medikamente hinzufügen',
      'it': 'Aggiungi farmaci',
    },
    'f40kfjxp': {
      'fr': 'Supprimer un médicament',
      'de': 'Löschen Sie ein Medikament',
      'it': 'Elimina un farmaco',
    },
    'wxggzlf8': {
      'fr': 'Ajouter une prescription',
      'de': 'Fügen Sie ein Rezept hinzu',
      'it': 'Aggiungi una ricetta',
    },
    'l7rmguoy': {
      'fr': 'Choisir la langue de l\'application',
      'de': 'Wählen Sie die App-Sprache',
      'it': 'Scegli la lingua dell\'app',
    },
    'ldsvvzlf': {
      'fr': 'Menu Principal',
      'de': 'Hauptmenü',
      'it': 'Menu principale',
    },
    '707yks56': {
      'fr': 'Home',
      'de': 'Heim',
      'it': 'Casa',
    },
  },
  // MesMedicamentsNv1
  {
    'dfizt58f': {
      'fr': 'Mes Médicaments ',
      'de': 'Meine Medikamente',
      'it': 'Le mie medicine',
    },
    'wc6j1qth': {
      'fr': 'Home',
      'de': 'Heim',
      'it': 'Casa',
    },
  },
  // MesMedicamentsNv2_fr
  {
    'ckl5f1yl': {
      'fr': 'Retour',
      'de': 'Rückmeldung',
      'it': 'Feedback',
    },
    'u59kc3l6': {
      'fr': '',
      'de': '',
      'it': '',
    },
    'dbb03k3m': {
      'fr': 'Home',
      'de': 'Heim',
      'it': 'Casa',
    },
  },
  // AjouterUnMedicamentNv1
  {
    'vxbvs6gm': {
      'fr':
      'Scan en cours, poser la caméra du téléphone sur la boîte du médicament et reculer droit lentement de 30 cm, essayer de scanner les petis côtés d\'abord.',
      'de':
      'Scannen Sie gerade, setzen Sie die Telefonkamera auf die Medikamentenschachtel und bewegen Sie sie langsam 30 cm gerade zurück. Versuchen Sie, zuerst die schmalen Seiten zu scannen.',
      'it':
      'Scansione in corso, metti la fotocamera del telefono sulla scatola dei medicinali e torna dritta lentamente di 30 cm, prova a scansionare prima i lati piccoli.',
    },
    'icpmqxuu': {
      'fr': 'Retour',
      'de': 'Zurück',
      'it': 'Indietro',
    },
    'ddmap0gj': {
      'fr': 'Home',
      'de': 'Heim',
      'it': 'Casa',
    },
    'dlg8sngo' : {
      'fr': 'Code detecté inconnu ',
      'de': 'Unbekannter code erkannt',
      'it': 'Codice sconosciuto rilevato',
    },
    'fh973hg8' : {
      'fr': 'fr',
      'de': 'de',
      'it': 'it',
    },
  },
  // SupprimerUnMedicamentNv1
  {
    'f6n9hmqo': {
      'fr': 'Supprimer un Médicament ',
      'de': 'Löschen Sie ein Medikament',
      'it': 'Elimina un farmaco',
    },
    '61cafc78': {
      'fr': 'Home',
      'de': 'Heim',
      'it': 'Casa',
    },
  },
  // AjouterUnePrescriptionNv1
  {
    '3fyomcom': {
      'fr': 'Ajouter une Prescription',
      'de': 'Fügen Sie ein Rezept hinzu',
      'it': 'Aggiungi una prescrizione',
    },
    'yz3jbf4u': {
      'fr': 'Home',
      'de': 'Heim',
      'it': 'Casa',
    },
  },
  // SupprimerUnMedicamentNv2
  {
    'ur1355r6': {
      'fr': 'Oui',
      'de': 'Ja',
      'it': 'SÌ',
    },
    'vgvg6itz': {
      'fr': 'Non',
      'de': 'NEIN',
      'it': 'NO',
    },
    'tmy0ym8j': {
      'fr': 'Home',
      'de': 'Heim',
      'it': 'Casa',
    },
  },
  // AjouterUnMedicamentNv2
  {
    'je3oy924': {
      'fr':
      'Ce médicament est déjà présent dans votre historique, souhaitez-vous l\'ajouter à nouveau ?',
      'de':
      'Dieses Medikament ist bereits in Ihrer Krankengeschichte vorhanden. Möchten Sie es erneut hinzufügen?',
      'it':
      'Questo farmaco è già presente nella tua storia, vuoi aggiungerlo di nuovo?',
    },
    '9uyhugpb': {
      'fr': 'Oui',
      'de': 'Ja',
      'it': 'SÌ',
    },
    '3p15haxq': {
      'fr': 'Non',
      'de': 'NEIN',
      'it': 'NO',
    },
    'sd7qmdw3': {
      'fr': 'Home',
      'de': 'Heim',
      'it': 'Casa',
    },
  },
  // AjouterUnePrescriptionNv2
  {
    'ufhpxpqw': {
      'fr': 'Home',
      'de': 'Heim',
      'it': 'Casa',
    },
  },
  // ChoisirLaLangue
  {
    'u7u1lmcu': {
      'fr': 'Français',
      'de': 'Französisch',
      'it': 'Francese',
    },
    'pul6oxlh': {
      'fr': 'Allemand',
      'de': 'Deutsch',
      'it': 'Tedesco',
    },
    '42c4fa1v': {
      'fr': 'Italien',
      'de': 'Italienisch',
      'it': 'Italiano',
    },
    '10dri3yl': {
      'fr': 'Choisir La Langue ',
      'de': 'Sprache wählen',
      'it': 'Scegli la lingua',
    },
    'ynonnazz': {
      'fr': 'Home',
      'de': 'Heim',
      'it': 'Casa',
    },
  },
  // noticeItem
  {
    '1pw57r3g': {
      'fr': 'Home',
      'de': 'Heim',
      'it': 'Casa',
    },
  },
  // uploadPrescription
  {
    'joroe1ug': {
      'fr': 'Ajouter une Prescription',
      'de': 'Fügen Sie ein Rezept hinzu',
      'it': 'Aggiungi una prescrizione',
    },
    'yyfbvbrt': {
      'fr': 'Option 1',
      'de': 'Option 1',
      'it': 'opzione 1',
    },
    'b29p5vlk': {
      'fr': 'Please select...',
      'de': 'Bitte auswählen...',
      'it': 'Seleziona...',
    },
    'r23c4645': {
      'fr': 'Search for an item...',
      'de': 'Nach einem Artikel suchen...',
      'it': 'Cerca un articolo...',
    },
    'dfgc3uf5': {
      'fr': 'ajouter fichier son',
      'de': 'Sounddatei hinzufügen',
      'it': 'aggiungi file audio',
    },
    'lfeovryp': {
      'fr': 'enregistrer video',
      'de': 'Ein Video aufnehmen',
      'it': 'registra video',
    },
    'vqh7mu6k': {
      'fr': 'Home',
      'de': 'Heim',
      'it': 'Casa',
    },
  },
  // MesMedicamentsNv2_it
  {
    'aow325xa': {
      'fr': '',
      'de': '',
      'it': '',
    },
    '74o7e6qb': {
      'fr': 'Home',
      'de': 'Heim',
      'it': 'Casa',
    },
  },
  // MesMedicamentsNv2_de
  {
    'lh7pgl18': {
      'fr': '',
      'de': '',
      'it': '',
    },
    'n27fe8nh': {
      'fr': 'Home',
      'de': 'Heim',
      'it': 'Casa',
    },
  },
  // Miscellaneous
  {
    '3oznm03n': {
      'fr': '',
      'de': '',
      'it': '',
    },
    'l6xycf3b': {
      'fr': '',
      'de': '',
      'it': '',
    },
    'qlnkqacb': {
      'fr': '',
      'de': '',
      'it': '',
    },
    'ysow507x': {
      'fr': '',
      'de': '',
      'it': '',
    },
    '1vhkhpgd': {
      'fr': '',
      'de': '',
      'it': '',
    },
    '4s4lq368': {
      'fr': '',
      'de': '',
      'it': '',
    },
    'pdt91dhg': {
      'fr': '',
      'de': '',
      'it': '',
    },
    '5q3hlieg': {
      'fr': '',
      'de': '',
      'it': '',
    },
    '9krbbsyo': {
      'fr': '',
      'de': '',
      'it': '',
    },
    'hyldx55q': {
      'fr': '',
      'de': '',
      'it': '',
    },
    'k9hmf6yl': {
      'fr': '',
      'de': '',
      'it': '',
    },
    't09sojgt': {
      'fr': '',
      'de': '',
      'it': '',
    },
    'p8t00qnm': {
      'fr': '',
      'de': '',
      'it': '',
    },
    '5ustg2eo': {
      'fr': '',
      'de': '',
      'it': '',
    },
    'rzpby43h': {
      'fr': '',
      'de': '',
      'it': '',
    },
    '2q4o2wxk': {
      'fr': '',
      'de': '',
      'it': '',
    },
    '6q6dwguw': {
      'fr': '',
      'de': '',
      'it': '',
    },
    'ii6j56nc': {
      'fr': '',
      'de': '',
      'it': '',
    },
    'uolyiorg': {
      'fr': '',
      'de': '',
      'it': '',
    },
    '490m46nw': {
      'fr': '',
      'de': '',
      'it': '',
    },
    'tzywr3zu': {
      'fr': '',
      'de': '',
      'it': '',
    },
    '43be6nnj': {
      'fr': '',
      'de': '',
      'it': '',
    },
    'b0aurjlt': {
      'fr': '',
      'de': '',
      'it': '',
    },
    'flz4efs2': {
      'fr': '',
      'de': '',
      'it': '',
    },
  },
].reduce((a, b) => a..addAll(b));

