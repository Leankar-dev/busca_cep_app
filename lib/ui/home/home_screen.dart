import 'package:busca_cep_app/core/widgets/address_widget.dart';
import 'package:busca_cep_app/core/widgets/custom_text.dart';
import 'package:busca_cep_app/models/cep_model.dart';
import 'package:busca_cep_app/repositories/cep_repository.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final repository = CepRepository(client: http.Client());
  final cepController = TextEditingController();
  String? errorMessage;
  CepModel? cepModel;

  Future<void> buscarCep() async {
    setState(() {
      errorMessage = null;
      cepModel = null;
    });
    final cep = cepController.text.trim();
    if (cep.isEmpty) {
      setState(() {
        errorMessage = 'Por favor, insira um CEP válido.';
      });
      return;
    }
    try {
      final addressModel = await repository.consultarCep(cep);
      setState(() {
        cepModel = addressModel;
        errorMessage = null;
      });
    } on Exception catch (e) {
      setState(() {
        errorMessage = 'Erro ao buscar CEP';
        // errorMessage = 'Erro ao buscar CEP: ${e.toString()}';
      });
    } finally {
      cepController.clear();
      FocusScope.of(context).unfocus(); // Remove o foco do campo de texto
    }
  }

  @override
  void dispose() {
    cepController.dispose();
    super.dispose();
  }

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
            TextField(
              controller: cepController,
              keyboardType: TextInputType.number,
              maxLength: 9,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.location_on_rounded,
                  color: theme.colorScheme.primary,
                ),
                labelText: 'CEP',
                hintText: 'Ex: 12345-678',
              ),
            ),
            const SizedBox(height: 16),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: ElevatedButton.icon(
                onPressed: buscarCep,
                icon: const Icon(Icons.search_rounded),
                label: const CustomText('Buscar CEP'),
              ),
            ),
            const SizedBox(height: 24),
            Visibility(
              visible: errorMessage != null,
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: theme.colorScheme.error.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: theme.colorScheme.error.withValues(alpha: 0.3),
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.error_outline_rounded,
                      color: theme.colorScheme.error,
                      size: 24,
                    ),
                    const SizedBox(width: 12),
                    CustomText(
                      errorMessage ?? '',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.error,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            Visibility(
              visible: cepModel != null,
              child: AddressWidget(
                cepModel: cepModel,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
