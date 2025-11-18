import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/login_page.dart';
import 'screens/home_page.dart';
import 'screens/add_task_page.dart';
import 'screens/task_list_page.dart';
import 'screens/profile_page.dart';
import 'providers/theme_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? username = prefs.getString('username');
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: MyApp(isLoggedIn: username != null),
    ),
  );
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;

  const MyApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          title: 'H1D023069_Tugas7',
          theme: themeProvider.isDarkMode ? ThemeData.dark() : ThemeData.light(),
          initialRoute: isLoggedIn ? '/home' : '/login',
          routes: {
            '/login': (context) => const LoginPage(),
            '/home': (context) => const HomePage(),
            '/add_task': (context) => const AddTaskPage(),
            '/task_list': (context) => const TaskListPage(),
            '/profile': (context) => const ProfilePage(),
          },
        );
      },
    );
  }
}