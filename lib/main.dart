import 'package:flutter/material.dart';

void main() {
  runApp(const ShuaibApp());
}

class ShuaibApp extends StatelessWidget {
  const ShuaibApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'شعیب اسلامی ایپ',
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: 'Urdu',
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final _pages = [
    const QuranPage(),
    const HadithPage(),
    const FatawaPage(),
    const SearchPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('شعیب اسلامی ایپ'),
        centerTitle: true,
        backgroundColor: Colors.green[700],
        elevation: 0,
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.green[700],
        unselectedItemColor: Colors.grey[600],
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'قرآن'),
          BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: 'حدیث'),
          BottomNavigationBarItem(icon: Icon(Icons.question_answer), label: 'فتاوی'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'تلاش'),
        ],
      ),
    );
  }
}

class QuranPage extends StatelessWidget {
  const QuranPage({super.key});

  final List<Map<String, dynamic>> surahs = const [
    {'name': 'الفاتحہ', 'ayahs': 7, 'type': 'مکی'},
    {'name': 'البقرہ', 'ayahs': 286, 'type': 'مدنی'},
    {'name': 'آل عمران', 'ayahs': 200, 'type': 'مدنی'},
    {'name': 'النساء', 'ayahs': 176, 'type': 'مدنی'},
    {'name': 'المائدہ', 'ayahs': 120, 'type': 'مدنی'},
    {'name': 'الانعام', 'ayahs': 165, 'type': 'مکی'},
    {'name': 'الاعراف', 'ayahs': 206, 'type': 'مکی'},
    {'name': 'الانفال', 'ayahs': 75, 'type': 'مدنی'},
    {'name': 'التوبہ', 'ayahs': 129, 'type': 'مدنی'},
    {'name': 'یونس', 'ayahs': 109, 'type': 'مکی'},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Header
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.green[600]!, Colors.green[400]!],
            ),
          ),
          child: Row(
            children: [
              Icon(Icons.menu_book, size: 40, color: Colors.white),
              SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'قرآن مجید',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  Text(
                    'مکمل قرآن پاک مع ترجمہ',
                    style: TextStyle(fontSize: 14, color: Colors.white70),
                  ),
                ],
              ),
            ],
          ),
        ),
        
        // Surahs List
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: surahs.length,
            itemBuilder: (context, index) {
              final surah = surahs[index];
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.green,
                    child: Text(
                      '${index + 1}',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                  title: Text(
                    'سورۃ ${surah['name']}',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text('آیات: ${surah['ayahs']} • ${surah['type']}'),
                  trailing: Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {
                    _showSurahDetails(context, surah['name']);
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  void _showSurahDetails(BuildContext context, String surahName) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('سورۃ $surahName'),
        content: Text(
          'سورۃ $surahName کی مکمل آیات جلد ہی دستیاب ہوں گی۔\n\nہم جلد ہی مکمل قرآن پاک مع ترجمہ شامل کر دیں گے۔',
          textAlign: TextAlign.center,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('ٹھیک ہے'),
          ),
        ],
      ),
    );
  }
}

class HadithPage extends StatelessWidget {
  const HadithPage({super.key});

  final List<Map<String, dynamic>> hadithBooks = const [
    {'name': 'صحیح بخاری', 'author': 'امام بخاری', 'hadiths': 7563},
    {'name': 'صحیح مسلم', 'author': 'امام مسلم', 'hadiths': 7563},
    {'name': 'سنن ابو داؤد', 'author': 'ابو داؤد', 'hadiths': 5274},
    {'name': 'سنن ترمذی', 'author': 'امام ترمذی', 'hadiths': 3956},
    {'name': 'سنن نسائی', 'author': 'امام نسائی', 'hadiths': 5761},
    {'name': 'سنن ابن ماجہ', 'author': 'ابن ماجہ', 'hadiths': 4341},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Header
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.blue[600]!, Colors.blue[400]!],
            ),
          ),
          child: Row(
            children: [
              Icon(Icons.import_contacts, size: 40, color: Colors.white),
              SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'حدیثیں',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  Text(
                    'صحیح احادیث کا مجموعہ',
                    style: TextStyle(fontSize: 14, color: Colors.white70),
                  ),
                ],
              ),
            ],
          ),
        ),
        
        // Hadith Books List
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: hadithBooks.length,
            itemBuilder: (context, index) {
              final book = hadithBooks[index];
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                child: ListTile(
                  leading: Icon(Icons.book, color: Colors.blue),
                  title: Text(
                    book['name'],
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text('${book['author']} • ${book['hadiths']} احادیث'),
                  trailing: Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {
                    _showHadithBookDetails(context, book['name']);
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  void _showHadithBookDetails(BuildContext context, String bookName) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(bookName),
        content: Text(
          '$bookName کی مکمل احادیث جلد ہی دستیاب ہوں گی۔\n\nہم جلد ہی تمام صحیح احادیث کا مجموعہ شامل کر دیں گے۔',
          textAlign: TextAlign.center,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('ٹھیک ہے'),
          ),
        ],
      ),
    );
  }
}

class FatawaPage extends StatelessWidget {
  const FatawaPage({super.key});

  final List<Map<String, dynamic>> fatawaCategories = const [
    {'name': 'نماز کے مسائل', 'count': 45},
    {'name': 'روزے کے احکام', 'count': 32},
    {'name': 'زکوۃ کے مسائل', 'count': 28},
    {'name': 'حج و عمرہ', 'count': 36},
    {'name': 'نکاح و طلاق', 'count': 41},
    {'name': 'کاروبار کے احکام', 'count': 29},
    {'name': 'کھانے پینے کے مسائل', 'count': 23},
    {'name': 'لباس و پردہ', 'count': 19},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Header
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.orange[600]!, Colors.orange[400]!],
            ),
          ),
          child: Row(
            children: [
              Icon(Icons.question_answer, size: 40, color: Colors.white),
              SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'فتاوی',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  Text(
                    'شرعی مسائل کے حل',
                    style: TextStyle(fontSize: 14, color: Colors.white70),
                  ),
                ],
              ),
            ],
          ),
        ),
        
        // Fatawa Categories
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.all(16),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 1.2,
            ),
            itemCount: fatawaCategories.length,
            itemBuilder: (context, index) {
              final category = fatawaCategories[index];
              return Card(
                elevation: 4,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: InkWell(
                  onTap: () {
                    _showFatawaCategory(context, category['name']);
                  },
                  borderRadius: BorderRadius.circular(12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.lightbulb, size: 30, color: Colors.orange),
                      SizedBox(height: 8),
                      Text(
                        category['name'],
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 4),
                      Text(
                        '${category['count']} فتوے',
                        style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  void _showFatawaCategory(BuildContext context, String categoryName) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(categoryName),
        content: Text(
          '$categoryName کے تمام فتوے جلد ہی دستیاب ہوں گے۔\n\nہم جلد ہی مکمل فتاویٰ کا مجموعہ شامل کر دیں گے۔',
          textAlign: TextAlign.center,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('ٹھیک ہے'),
          ),
        ],
      ),
    );
  }
}

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Search Header
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.purple[600]!, Colors.purple[400]!],
            ),
          ),
          child: Row(
            children: [
              Icon(Icons.search, size: 40, color: Colors.white),
              SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'تلاش',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  Text(
                    'قرآن، حدیث، فتاویٰ میں تلاش کریں',
                    style: TextStyle(fontSize: 14, color: Colors.white70),
                  ),
                ],
              ),
            ],
          ),
        ),
        
        // Search Box
        Padding(
          padding: const EdgeInsets.all(16),
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search, color: Colors.purple),
              hintText: 'قرآن، حدیث، فتاویٰ میں تلاش کریں...',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.purple),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.purple, width: 2),
              ),
            ),
          ),
        ),
        
        // Search Results Placeholder
        Expanded(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.search_off, size: 80, color: Colors.grey[400]),
                SizedBox(height: 16),
                Text(
                  'تلاش کے نتائج یہاں ظاہر ہوں گے',
                  style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                ),
                SizedBox(height: 8),
                Text(
                  'کوئی لفظ تلاش کریں تو نتائج دکھائی دیں گے',
                  style: TextStyle(fontSize: 14, color: Colors.grey[500]),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
