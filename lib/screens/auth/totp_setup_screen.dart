import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../../services/auth_service.dart';

class TOTPSetupScreen extends StatefulWidget {
  const TOTPSetupScreen({super.key});

  @override
  State<TOTPSetupScreen> createState() => _TOTPSetupScreenState();
}

class _TOTPSetupScreenState extends State<TOTPSetupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _codeController = TextEditingController();
  TOTPSetupResponse? _setupData;
  bool _isLoading = true;
  String? _errorMessage;
  bool _isEnabling = false;

  @override
  void initState() {
    super.initState();
    _loadSetupData();
  }

  @override
  void dispose() {
    _codeController.dispose();
    super.dispose();
  }

  Future<void> _loadSetupData() async {
    final authService = context.read<AuthService>();
    
    try {
      final setupData = await authService.getTOTPSetup();
      setState(() {
        _setupData = setupData;
        _isLoading = false;
        if (setupData == null) {
          _errorMessage = 'Failed to load TOTP setup data';
        }
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
        _errorMessage = 'Failed to load TOTP setup data';
      });
    }
  }

  Future<void> _handleEnable() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _errorMessage = null;
      _isEnabling = true;
    });

    final authService = context.read<AuthService>();
    
    final success = await authService.enableTOTP(_codeController.text.trim());

    if (!mounted) return;

    setState(() {
      _isEnabling = false;
    });

    if (success) {
      _showSuccessDialog();
    } else {
      setState(() {
        _errorMessage = 'Failed to enable two-factor authentication. Please check your code and try again.';
      });
    }
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Row(
          children: [
            Icon(Icons.check_circle, color: Colors.green),
            SizedBox(width: 8),
            Text('Success!'),
          ],
        ),
        content: const Text('Two-factor authentication has been enabled successfully. Your account is now more secure.'),
        actions: [
          TextButton(
            onPressed: () {
              if (mounted) {
                context.go('/dashboard');
              }
            },
            child: const Text('Continue'),
          ),
        ],
      ),
    );
  }

  void _copySecret() {
    if (_setupData?.secret != null) {
      Clipboard.setData(ClipboardData(text: _setupData!.secret));
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Secret copied to clipboard')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Setup Two-Factor Authentication'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/dashboard'),
        ),
      ),
      body: SafeArea(
        child: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : _setupData == null
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.error_outline,
                          size: 64,
                          color: Colors.red,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          _errorMessage ?? 'Failed to load setup data',
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 24),
                        ElevatedButton(
                          onPressed: _loadSetupData,
                          child: const Text('Retry'),
                        ),
                      ],
                    ),
                  )
                : SingleChildScrollView(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _buildStepCard(
                          stepNumber: 1,
                          title: 'Install an Authenticator App',
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Download and install an authenticator app such as:',
                                style: TextStyle(fontSize: 14),
                              ),
                              SizedBox(height: 8),
                              Text('• Google Authenticator'),
                              Text('• Microsoft Authenticator'),
                              Text('• Authy'),
                              Text('• 1Password'),
                            ],
                          ),
                        ),
                        
                        const SizedBox(height: 16),
                        
                        _buildStepCard(
                          stepNumber: 2,
                          title: 'Scan QR Code',
                          child: Column(
                            children: [
                              const Text(
                                'Scan this QR code with your authenticator app:',
                                style: TextStyle(fontSize: 14),
                              ),
                              const SizedBox(height: 16),
                              Container(
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: Colors.grey.shade300),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Center(
                                  child: QrImageView(
                                    data: _setupData!.qrCodeURI,
                                    version: QrVersions.auto,
                                    size: 200.0,
                                    backgroundColor: Colors.white,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 16),
                              const Text(
                                'Or manually enter this secret key:',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade100,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        _setupData!.secret,
                                        style: const TextStyle(
                                          fontFamily: 'monospace',
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: _copySecret,
                                      icon: const Icon(Icons.copy),
                                      iconSize: 18,
                                      tooltip: 'Copy secret',
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        
                        const SizedBox(height: 16),
                        
                        _buildStepCard(
                          stepNumber: 3,
                          title: 'Verify Setup',
                          child: Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                const Text(
                                  'Enter the 6-digit code from your authenticator app:',
                                  style: TextStyle(fontSize: 14),
                                ),
                                const SizedBox(height: 16),
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
                                const SizedBox(height: 16),
                                
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
                                
                                SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    onPressed: _isEnabling ? null : _handleEnable,
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.green,
                                      foregroundColor: Colors.white,
                                      padding: const EdgeInsets.symmetric(vertical: 16),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    child: _isEnabling
                                        ? const SizedBox(
                                            height: 20,
                                            width: 20,
                                            child: CircularProgressIndicator(
                                              color: Colors.white,
                                              strokeWidth: 2,
                                            ),
                                          )
                                        : const Text(
                                            'Enable Two-Factor Authentication',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                  ),
                                ),
                                const SizedBox(height: 16),
                                SizedBox(
                                  width: double.infinity,
                                  child: TextButton(
                                    onPressed: () => context.go('/dashboard'),
                                    child: const Text(
                                      'Skip for now',
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        
                        const SizedBox(height: 24),
                        
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.orange.shade50,
                            border: Border.all(color: Colors.orange.shade200),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.warning_outlined,
                                    color: Colors.orange.shade700,
                                    size: 20,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    'Important',
                                    style: TextStyle(
                                      color: Colors.orange.shade700,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Make sure to save your secret key in a secure location. If you lose access to your authenticator app, you\'ll need this key to regain access to your account.',
                                style: TextStyle(
                                  color: Colors.orange.shade700,
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

  Widget _buildStepCard({
    required int stepNumber,
    required String title,
    required Widget child,
  }) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Center(
                    child: Text(
                      stepNumber.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            child,
          ],
        ),
      ),
    );
  }
}