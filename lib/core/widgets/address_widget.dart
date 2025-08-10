import 'package:busca_cep_app/core/widgets/custom_text.dart';
import 'package:busca_cep_app/core/widgets/info_card_widget.dart';
import 'package:busca_cep_app/models/cep_model.dart';
import 'package:flutter/material.dart';

class AddressWidget extends StatelessWidget {
  final CepModel? cepModel;

  const AddressWidget({super.key, this.cepModel});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (cepModel == null) {
      return const SizedBox.shrink();
    }

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
        InfoCardWidget(
          icon: Icons.location_on_rounded,
          title: 'CEP',
          subtitle: cepModel!.cep,
          color: theme.colorScheme.primary,
        ),
        InfoCardWidget(
          icon: Icons.streetview_rounded,
          title: 'Logradouro',
          subtitle: cepModel!.logradouro,
          color: theme.colorScheme.secondary,
        ),
        InfoCardWidget(
          icon: Icons.home_rounded,
          title: 'Bairro',
          subtitle: cepModel!.bairro,
          color: theme.colorScheme.tertiary,
        ),
        InfoCardWidget(
          icon: Icons.location_city_rounded,
          title: 'Cidade',
          subtitle: cepModel!.localidade,
          color: Color(0xff10b981),
        ),
        InfoCardWidget(
          icon: Icons.map_rounded,
          title: 'Estado',
          subtitle: cepModel!.uf,
          color: Colors.orange,
        ),

        if (cepModel!.complemento.isNotEmpty)
          InfoCardWidget(
            icon: Icons.info_rounded,
            title: 'Complemento',
            subtitle: cepModel!.complemento,
            color: Colors.purple,
          ),
      ],
    );
  }
}
