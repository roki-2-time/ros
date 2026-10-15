import 'package:flutter/material.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final _formKey = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _message = TextEditingController();

  @override
  void dispose() {
    _name.dispose();
    _message.dispose();
    super.dispose();
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;
    // Позже здесь будет отправка в Firestore
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Сообщение готово к отправке')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Контакты',
                style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 16),
            TextFormField(
              controller: _name,
              decoration: const InputDecoration(labelText: 'Имя'),
              validator: (v) =>
              (v == null || v.trim().isEmpty) ? 'Введите имя' : null,
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _message,
              maxLines: 4,
              decoration: const InputDecoration(labelText: 'Сообщение'),
              validator: (v) =>
              (v == null || v.trim().isEmpty) ? 'Введите сообщение' : null,
            ),
            const SizedBox(height: 16),
            FilledButton(onPressed: _submit, child: const Text('Отправить')),
          ],
        ),
      ),
    );
  }
}