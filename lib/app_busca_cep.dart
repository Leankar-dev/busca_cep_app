import 'package:busca_cep_app/core/theme/app_theme.dart';
import 'package:busca_cep_app/ui/home/home_screen.dart';
import 'package:flutter/material.dart';

class AppCep extends StatelessWidget {
  const AppCep({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Consulta de Cep',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
