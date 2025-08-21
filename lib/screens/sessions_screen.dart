import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/session.dart';
import '../services/auth_service.dart';
import '../widgets/app_drawer.dart';

class SessionsScreen extends StatefulWidget {
  const SessionsScreen({super.key});

  @override
  State<SessionsScreen> createState() => _SessionsScreenState();
}

class _SessionsScreenState extends State<SessionsScreen> {
  bool _isLoading = true;
  List<UserSession> _sessions = [];
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _loadSessions();
  }

  Future<void> _loadSessions() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    final authService = Provider.of<AuthService>(context, listen: false);
    final sessions = await authService.getSessions();

    setState(() {
      _isLoading = false;
      if (sessions != null) {
        _sessions = sessions;
      } else {
        _errorMessage = 'Failed to load sessions';
      }
    });
  }

  Future<void> _revokeSession(UserSession session) async {
    final confirmed = await _showRevokeConfirmDialog(
      title: 'Revoke Session',
      content: 'Are you sure you want to revoke this session?\n\n'
               'Browser: ${session.browser}\n'
               'Device: ${session.device}\n'
               'Location: ${session.location}',
    );

    if (confirmed == true) {
      final authService = Provider.of<AuthService>(context, listen: false);
      final success = await authService.revokeSession(session.id);

      if (mounted) {
        if (success) {
          _showSnackBar('Session revoked successfully', Colors.green);
          _loadSessions();
        } else {
          _showSnackBar('Failed to revoke session', Colors.red);
        }
      }
    }
  }

  Future<void> _revokeAllOtherSessions() async {
    final confirmed = await _showRevokeConfirmDialog(
      title: 'Revoke All Other Sessions',
      content: 'This will log you out from all other devices and browsers.\n\n'
               'You will remain logged in on this device only.\n\n'
               'Are you sure you want to continue?',
    );

    if (confirmed == true) {
      final authService = Provider.of<AuthService>(context, listen: false);
      final success = await authService.revokeAllOtherSessions();

      if (mounted) {
        if (success) {
          _showSnackBar('All other sessions revoked successfully', Colors.green);
          _loadSessions();
        } else {
          _showSnackBar('Failed to revoke other sessions', Colors.red);
        }
      }
    }
  }

  Future<bool?> _showRevokeConfirmDialog({
    required String title,
    required String content,
  }) async {
    return showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              style: TextButton.styleFrom(
                foregroundColor: Colors.red,
              ),
              child: const Text('Revoke'),
            ),
          ],
        );
      },
    );
  }

  void _showSnackBar(String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color,
        duration: const Duration(seconds: 3),
      ),
    );
  }

  String _formatDateTime(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.isNegative) {
      final futureDifference = dateTime.difference(now);
      if (futureDifference.inMinutes < 60) {
        return 'In ${futureDifference.inMinutes}m';
      } else if (futureDifference.inHours < 24) {
        return 'In ${futureDifference.inHours}h';
      } else if (futureDifference.inDays < 30) {
        return 'In ${futureDifference.inDays}d';
      } else {
        return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
      }
    }

    if (difference.inMinutes < 1) {
      return 'Just now';
    } else if (difference.inHours < 1) {
      return '${difference.inMinutes}m ago';
    } else if (difference.inDays < 1) {
      return '${difference.inHours}h ago';
    } else if (difference.inDays < 7) {
      return '${difference.inDays}d ago';
    } else {
      return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
    }
  }

  IconData _getDeviceIcon(UserSession session) {
    if (session.bot) return Icons.smart_toy;
    if (session.mobile) return Icons.phone_android;
    if (session.tablet) return Icons.tablet;
    
    final browser = session.browser.toLowerCase();
    if (browser.contains('chrome')) return Icons.web;
    if (browser.contains('firefox')) return Icons.whatshot;
    if (browser.contains('safari')) return Icons.language;
    if (browser.contains('edge')) return Icons.shield;
    if (browser.contains('opera')) return Icons.theaters;
    
    return Icons.computer;
  }

  Color _getSessionColor(UserSession session) {
    if (session.current) {
      return Colors.green;
    } else if (session.isExpired) {
      return Colors.red;
    } else {
      return Colors.blue;
    }
  }

  Color _getDeviceTypeColor(UserSession session) {
    if (session.bot) return Colors.purple;
    if (session.mobile) return Colors.blue;
    if (session.tablet) return Colors.green;
    return Colors.grey;
  }

  Widget _buildSessionCard(UserSession session) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 2,
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: CircleAvatar(
          backgroundColor: _getSessionColor(session).withValues(alpha: 0.2),
          child: Icon(
            _getDeviceIcon(session),
            color: _getSessionColor(session),
          ),
        ),
        title: Row(
          children: [
            Expanded(
              child: Text(
                session.browser,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: _getDeviceTypeColor(session),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                session.deviceType,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(width: 4),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.grey[600],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                session.type.toUpperCase(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            if (session.current) ...[
              const SizedBox(width: 4),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  'Current',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ],
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            Text('Operating System: ${session.os}'),
            Text('Device: ${session.device}'),
            Text('Location: ${session.location}'),
            Text('IP Address: ${session.ipAddress}'),
            const SizedBox(height: 8),
            Row(
              children: [
                Text(
                  'Last Active: ${_formatDateTime(session.lastUsed)}',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  'Created: ${_formatDateTime(session.createdAt)}',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  'Expires: ${_formatDateTime(session.expiresAt)}',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 12,
                  ),
                ),
                const SizedBox(width: 16),
                if (session.isExpired)
                  Text(
                    'Expired',
                    style: TextStyle(
                      color: Colors.red[600],
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
              ],
            ),
          ],
        ),
        trailing: session.current
            ? null
            : IconButton(
                icon: const Icon(Icons.logout, color: Colors.red),
                onPressed: () => _revokeSession(session),
                tooltip: 'Revoke Session',
              ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Active Sessions'),
        actions: [
          if (_sessions.where((s) => !s.current).isNotEmpty)
            TextButton.icon(
              onPressed: _revokeAllOtherSessions,
              icon: const Icon(Icons.logout, color: Colors.red),
              label: const Text(
                'Revoke All Others',
                style: TextStyle(color: Colors.red),
              ),
            ),
          IconButton(
            onPressed: _loadSessions,
            icon: const Icon(Icons.refresh),
            tooltip: 'Refresh',
          ),
        ],
      ),
      drawer: const AppDrawer(currentRoute: '/sessions'),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (_isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (_errorMessage != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 64,
              color: Colors.red[300],
            ),
            const SizedBox(height: 16),
            Text(
              _errorMessage!,
              style: const TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _loadSessions,
              child: const Text('Retry'),
            ),
          ],
        ),
      );
    }

    if (_sessions.isEmpty) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.devices_other,
              size: 64,
              color: Colors.grey,
            ),
            SizedBox(height: 16),
            Text(
              'No active sessions found',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      );
    }

    _sessions.sort((a, b) {
      if (a.current && !b.current) return -1;
      if (!a.current && b.current) return 1;
      return b.lastUsed.compareTo(a.lastUsed);
    });

    return RefreshIndicator(
      onRefresh: _loadSessions,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 16),
        itemCount: _sessions.length,
        itemBuilder: (context, index) {
          return _buildSessionCard(_sessions[index]);
        },
      ),
    );
  }
}