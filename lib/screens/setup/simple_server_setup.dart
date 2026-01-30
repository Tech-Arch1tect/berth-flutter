import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import '../../services/config_service.dart';
import '../../services/berth_api_provider.dart';

class SimpleServerSetupScreen extends StatefulWidget {
  const SimpleServerSetupScreen({super.key});

  @override
  State<SimpleServerSetupScreen> createState() => _SimpleServerSetupScreenState();
}

class _SimpleServerSetupScreenState extends State<SimpleServerSetupScreen> {
  final _urlController = TextEditingController(text: 'https://localhost:8080');
  bool _skipSslVerification = true;

  @override
  void dispose() {
    _urlController.dispose();
    super.dispose();
  }

  Future<void> _saveAndContinue() async {
    final url = _urlController.text.trim();

    final configService = context.read<ConfigService>();
    final berthApiProvider = context.read<BerthApiProvider>();
    final colorScheme = Theme.of(context).colorScheme;

    final success = await configService.setServerUrl(url, skipSslVerification: _skipSslVerification);

    if (success && mounted) {
      berthApiProvider.setBaseUrl(url);
      berthApiProvider.updateSslVerification(_skipSslVerification);
      context.go('/login');
    } else if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Failed to save server URL'),
          backgroundColor: colorScheme.error,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Server Setup'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Enter Berth Server URL',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            
            TextFormField(
              controller: _urlController,
              decoration: const InputDecoration(
                labelText: 'Server URL',
                hintText: 'https://localhost:8080',
                border: OutlineInputBorder(),
              ),
            ),
            
            const SizedBox(height: 16),
            
            CheckboxListTile(
              title: const Text('Skip SSL certificate verification'),
              subtitle: const Text('Enable this for self-signed certificates'),
              value: _skipSslVerification,
              onChanged: (bool? value) {
                setState(() {
                  _skipSslVerification = value ?? true;
                });
              },
              controlAffinity: ListTileControlAffinity.leading,
            ),
            
            const SizedBox(height: 16),
            
            ElevatedButton(
              onPressed: _saveAndContinue,
              child: const Text('Connect'),
            ),
            
            const SizedBox(height: 16),
            
            Wrap(
              spacing: 8,
              children: [
                'https://localhost:8080',
                'http://localhost:8080',
                'https://192.168.1.100:8080',
              ].map((url) => ElevatedButton(
                onPressed: () {
                  setState(() {
                    _urlController.text = url;
                  });
                },
                child: Text(url),
              )).toList(),
            ),
          ],
        ),
      ),
    );
  }
}