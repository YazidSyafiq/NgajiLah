import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';

class AsbabunProvider extends ChangeNotifier {
  final TextEditingController _controller = TextEditingController();
  TextEditingController get controller => _controller;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  GlobalKey<FormState> get formKey => _formKey;

  bool _isLoadingGemini = false;
  bool get isLoadingGemini => _isLoadingGemini;

  String? _erroGemini;
  String? get errorGemini => _erroGemini;

  String? _result;
  String? get result => _result;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void getAsbabun({required String surah}) async {
    _isLoadingGemini = true;
    _result = null;
    _erroGemini = null;
    notifyListeners();
    try {
      final gemini = Gemini.instance;
      final prompt = 'Ceritakan tentang asbabun nuzul surah $surah';

      _result = await gemini.text(prompt).then((value) => value?.output);
      editResult();
      notifyListeners();
    } catch (e) {
      _erroGemini = e.toString();
      notifyListeners();
    } finally {
      _isLoadingGemini = false;
      notifyListeners();
    }
  }

  void editResult() {
    _result = _result!.replaceAll('*', '');
    notifyListeners();
  }

  final List<String> _namaSurah = [
    'Al-Fatihah',
    'Al-Baqarah',
    'Al-Imran',
    'An-Nisa',
    'Al-Ma\'idah',
    'Al-An\'am',
    'Al-A\'raf',
    'Al-Anfal',
    'At-Taubah',
    'Yunus',
    'Hud',
    'Yusuf',
    'Ar-Ra\'d',
    'Ibrahim',
    'Al-Hijr',
    'An-Nahl',
    'Al-Isra',
    'Al-Kahf',
    'Maryam',
    'Ta-Ha',
    'Al-Anbiya',
    'Al-Hajj',
    'Al-Mu\'minun',
    'An-Nur',
    'Al-Furqan',
    'Ash-Shu\'ara',
    'An-Naml',
    'Al-Qasas',
    'Al-Ankabut',
    'Ar-Rum',
    'Luqman',
    'As-Sajda',
    'Al-Ahzab',
    'Saba',
    'Fatir',
    'Ya-Sin',
    'As-Saffat',
    'Sad',
    'Az-Zumar',
    'Ghafir',
    'Fussilat',
    'Ash-Shura',
    'Az-Zukhruf',
    'Ad-Dukhan',
    'Al-Jathiya',
    'Al-Ahqaf',
    'Muhammad',
    'Al-Fath',
    'Al-Hujurat',
    'Qaf',
    'Adh-Dhariyat',
    'At-Tur',
    'An-Najm',
    'Al-Qamar',
    'Ar-Rahman',
    'Al-Waqi\'a',
    'Al-Hadid',
    'Al-Mujadila',
    'Al-Hashr',
    'Al-Mumtahina',
    'As-Saff',
    'Al-Jumu\'a',
    'Al-Munafiqun',
    'At-Taghabun',
    'At-Talaq',
    'At-Tahrim',
    'Al-Mulk',
    'Al-Qalam',
    'Al-Haqqa',
    'Al-Ma\'arij',
    'Nuh',
    'Al-Jinn',
    'Al-Muzzammil',
    'Al-Muddathir',
    'Al-Qiyama',
    'Al-Insan',
    'Al-Mursalat',
    'An-Naba',
    'An-Nazi\'at',
    'Abasa',
    'At-Takwir',
    'Al-Infitar',
    'Al-Mutaffifin',
    'Al-Inshiqaq',
    'Al-Buruj',
    'At-Tariq',
    'Al-A\'la',
    'Al-Ghashiya',
    'Al-Fajr',
    'Al-Balad',
    'Ash-Shams',
    'Al-Lail',
    'Ad-Duha',
    'Al-Inshirah',
    'At-Tin',
    'Al-Alaq',
    'Al-Qadr',
    'Al-Bayyina',
    'Az-Zalzala',
    'Al-Adiyat',
    'Al-Qari\'a',
    'At-Takathur',
    'Al-Asr',
    'Al-Humazah',
    'Al-Fil',
    'Quraysh',
    'Al-Ma\'un',
    'Al-Kawthar',
    'Al-Kafirun',
    'An-Nasr',
    'Al-Masad',
    'Al-Ikhlas',
    'Al-Falaq',
    'An-Nas',
  ];
  List<String> get namaSurah => _namaSurah;

  void deleteSurah() {
    _controller.clear();
    _result = null;
    notifyListeners();
  }

  void pilihSurah({required String surah}) {
    _controller.text = surah;
    notifyListeners();
  }
}
