import 'package:busca_cep_app/core/widgets/custom_text.dart';
import 'package:busca_cep_app/core/widgets/info_card_widget.dart';
import 'package:flutter/material.dart';

class AddressWidget extends StatelessWidget {
  const AddressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              colors: [
                theme.colorScheme.primary,
                theme.colorScheme.secondary,
              ],
            ),
          ),
          child: Column(
            children: [
              Icon(
                Icons.check_circle_rounded,
                color: Colors.white,
                size: 48,
              ),
              const SizedBox(height: 8),
              CustomText(
                'CEP encontrado com sucesso!',
                style: theme.textTheme.titleLarge?.copyWith(
                  color: Colors.white,
                ),
              ),
              CustomText(
                'Informações do endereço',
                style: theme.textTheme.titleMedium?.copyWith(
                  color: Colors.white.withValues(alpha: 0.9),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        InfoCardWidget(),
        InfoCardWidget(),
        InfoCardWidget(),
        InfoCardWidget(),
        InfoCardWidget(),
        InfoCardWidget(),
        InfoCardWidget(),
        InfoCardWidget(),
        InfoCardWidget(),
        InfoCardWidget(),
      ],
    );
  }
}
