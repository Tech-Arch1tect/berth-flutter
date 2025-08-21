import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../services/auth_service.dart';

class TOTPVerifyScreen extends StatefulWidget {
  final String temporaryToken;
  
  const TOTPVerifyScreen({
    super.key,
    required this.temporaryToken,
  });

  @override
  State<TOTPVerifyScreen> createState() => _TOTPVerifyScreenState();
}

class _TOTPVerifyScreenState extends State<TOTPVerifyScreen> {
  final _formKey = GlobalKey<FormState>();
  final _codeController = TextEditingController();
  String? _errorMessage;

  @override
  void dispose() {
    _codeController.dispose();
    super.dispose();
  }

  Future<void> _handleVerify() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _errorMessage = null;
    });

    final authService = context.read<AuthService>();
    
    final result = await authService.verifyTOTP(
      widget.temporaryToken,
      _codeController.text.trim(),
    );

    if (!mounted) return;

    if (result.success) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('TOTP verification successful! Will navigate to dashboard when routing is implemented.'),
          backgroundColor: Colors.green,
        ),
      );
    } else {
      setState(() {
        _errorMessage = result.message;
      });
    }
  }

  Future<void> _handleCancel() async {
    final authService = context.read<AuthService>();
    await authService.logout();
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Cancelled TOTP verification. Will navigate to login when routing is implemented.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Two-Factor Authentication'),
        actions: [
          TextButton(
            onPressed: _handleCancel,
            child: const Text('Cancel'),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 32),
              
              Container(
                alignment: Alignment.center,
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Icon(
                    Icons.security,
                    size: 40,
                    color: Colors.blue.shade600,
                  ),
                ),
              ),
              
              const SizedBox(height: 24),
              
              const Text(
                'Enter Authentication Code',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              
              const SizedBox(height: 8),
              
              const Text(
                'Please enter the 6-digit code from your authenticator app',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),
              
              const SizedBox(height: 48),
              
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _codeController,
                      decoration: const InputDecoration(
                        labelText: 'Authentication Code',
                        hintText: 'Enter 6-digit code',
                        prefixIcon: Icon(Icons.pin),
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                      maxLength: 6,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 18,
                        letterSpacing: 4,
                        fontWeight: FontWeight.w600,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the authentication code';
                        }
                        if (value.length != 6) {
                          return 'Code must be 6 digits';
                        }
                        if (!RegExp(r'^\d{6}$').hasMatch(value)) {
                          return 'Code must contain only numbers';
                        }
                        return null;
                      },
                    ),
                    
                    const SizedBox(height: 24),
                    
                    if (_errorMessage != null)
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.red.shade50,
                          border: Border.all(color: Colors.red.shade200),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.error_outline,
                              color: Colors.red.shade700,
                              size: 20,
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                _errorMessage!,
                                style: TextStyle(
                                  color: Colors.red.shade700,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    
                    if (_errorMessage != null) const SizedBox(height: 16),
                    
                    Consumer<AuthService>(
                      builder: (context, authService, child) {
                        return SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: authService.isLoading ? null : _handleVerify,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Theme.of(context).primaryColor,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: authService.isLoading
                                ? const SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                      strokeWidth: 2,
                                    ),
                                  )
                                : const Text(
                                    'Verify Code',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 24),
              
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  border: Border.all(color: Colors.blue.shade200),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.info_outline,
                          color: Colors.blue.shade700,
                          size: 20,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Need help?',
                          style: TextStyle(
                            color: Colors.blue.shade700,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Open your authenticator app (Google Authenticator, Authy, etc.) and enter the 6-digit code that\'s currently displayed for this account.',
                      style: TextStyle(
                        color: Colors.blue.shade600,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}