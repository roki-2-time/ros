import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    return ListView(
      padding: const EdgeInsets.all(24),
      children: [
        Text('Добро пожаловать', style: t.headlineLarge),
        const SizedBox(height: 12),
        Text('Здесь будет краткое описание сайта.', style: t.bodyLarge),
        const SizedBox(height: 24),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          children: List.generate(
            3,
                (i) => SizedBox(
              width: 260,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Раздел ${i + 1}', style: t.titleMedium),
                      const SizedBox(height: 8),
                      const Text('Описание раздела.'),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}