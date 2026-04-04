import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/lesson_screen.dart';
import 'screens/game_screen.dart';
import 'screens/glossary_screen.dart';

void main() {
  runApp(const ScienceStudyApp());
}

class ScienceStudyApp extends StatelessWidget {
  const ScienceStudyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Science Study Hub',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF5DCAA5),
          surface: Color(0xFF112240),
        ),
        scaffoldBackgroundColor: const Color(0xFF0d1b2a),
        useMaterial3: true,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF1a3358),
            foregroundColor: const Color(0xFFe8f4f8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ),
      home: const _MainScreen(),
    );
  }
}

class _MainScreen extends StatefulWidget {
  const _MainScreen();

  @override
  State<_MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<_MainScreen> {
  int _tabIndex = 0;
  int _selectedModule = 0;

  void _navigateToLesson(int moduleIndex) {
    setState(() {
      _selectedModule = moduleIndex;
      _tabIndex = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screens = [
      HomeScreen(onNavigateToLesson: _navigateToLesson),
      LessonScreen(
        key: ValueKey(_selectedModule),
        moduleIndex: _selectedModule,
      ),
      const GameScreen(),
      const GlossaryScreen(),
    ];

    return Scaffold(
      body: screens[_tabIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _tabIndex,
        onTap: (i) => setState(() => _tabIndex = i),
        backgroundColor: const Color(0xFF112240),
        selectedItemColor: const Color(0xFF5DCAA5),
        unselectedItemColor: const Color(0xFF8aafc4),
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.menu_book_outlined), label: 'Learn'),
          BottomNavigationBarItem(icon: Icon(Icons.biotech_outlined), label: 'Mission'),
          BottomNavigationBarItem(icon: Icon(Icons.list_alt_outlined), label: 'Glossary'),
        ],
      ),
    );
  }
}

