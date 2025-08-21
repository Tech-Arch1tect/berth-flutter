import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import '../../services/config_service.dart';
import '../../services/api_client.dart';

class SimpleServerSetupScreen extends StatefulWidget {
  const SimpleServerSetupScreen({super.key});

  @override
  State<SimpleServerSetupScreen> createState() => _SimpleServerSetupScreenState();
}

class _SimpleServerSetupScreenState extends State<SimpleServerSetupScreen> {
  final _urlController = TextEditingController(text: 'http://localhost:8080');

  @override
  void dispose() {
    _urlController.dispose();
    super.dispose();
  }

  Future<void> _saveAndContinue() async {
    final url = _urlController.text.trim();
    
    final configService = context.read<ConfigService>();
    final success = await configService.setServerUrl(url);
    
    if (success && mounted) {
      context.read<ApiClient>().setBaseUrl(url);
      context.go('/login');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Failed to save server URL'),
          backgroundColor: Theme.of(context).colorScheme.error,
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
              'Enter BRX Server URL',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            
            TextFormField(
              controller: _urlController,
              decoration: const InputDecoration(
                labelText: 'Server URL',
                hintText: 'http://localhost:8080',
                border: OutlineInputBorder(),
              ),
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
                'http://localhost:8080',
                'https://localhost:8443',
                'http://192.168.1.100:8080',
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