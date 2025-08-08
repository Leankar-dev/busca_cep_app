import 'package:busca_cep_app/core/widgets/address_widget.dart';
import 'package:busca_cep_app/core/widgets/custom_elevated_buttom_icon.dart';
import 'package:busca_cep_app/core/widgets/custom_text.dart';
import 'package:busca_cep_app/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // para pegar o thema da App como um todo
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const CustomText(
          'Consulta de Cep',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        leading: Icon(Icons.location_city),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    theme.colorScheme.primary.withValues(alpha: 0.1),
                    theme.colorScheme.secondary.withValues(alpha: 0.05),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  Icon(
                    Icons.search_rounded,
                    color: theme.colorScheme.primary,
                    size: 48,
                  ),
                  const SizedBox(height: 16),
                  CustomText(
                    'Digite o CEP',
                    style: theme.textTheme.titleLarge?.copyWith(
                      color: theme.colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  CustomText(
                    'Você pode buscar por CEPs de todo o Brasil.',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onSurface,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            CustomTextField(
              keyboardType: TextInputType.number,
              maxLength: 9,
              prefixIcon: Icon(
                Icons.location_on_rounded,
                color: theme.colorScheme.primary,
              ),
              labelText: 'CEP',
              hintText: 'Ex: 12345-678',
            ),
            const SizedBox(height: 16),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: CustomElevatedButtonIcon(
                onPressed: () {},
                icon: const Icon(Icons.search_rounded),
                label: const CustomText('Buscar CEP'),
              ),
            ),
            const SizedBox(height: 24),
            AddressWidget(),
          ],
        ),
      ),
    );
  }
}
