import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:file_picker/file_picker.dart';
import '../providers/auth_provider.dart';
import 'summary_detail_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UploadScreen extends ConsumerStatefulWidget {
  const UploadScreen({super.key});

  @override
  ConsumerState<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends ConsumerState<UploadScreen> {
  String? _fileName;
  PlatformFile? _file;

  @override
  void initState() {
    super.initState();

    // Redirect to login if user logs out
    ref.listen<AsyncValue<User?>>(
      authStateProvider,
      (prev, next) {
        next.whenOrNull(data: (user) {
          if (user == null) {
            Navigator.pushReplacementNamed(context, '/');
          }
        });
      },
    );
  }

  Future<void> _pickFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['mp3', 'mp4', 'wav', 'm4a'],
    );

    if (result != null && result.files.isNotEmpty) {
      setState(() {
        _file = result.files.first;
        _fileName = _file!.name;
      });

      // Placeholder: navigate to summary screen
      const generatedSummary =
          "Here's a summary of your meeting. Key points:\n~ Discussed project timeline\n~ Agreed on milestones\n- Assigned tasks";

      if (!mounted) return;
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => const SummaryDetailScreen(summary: generatedSummary),
        ),
      );
    }
  }

  void _handleSignOut() {
    ref.read(authStateProvider.notifier).signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upload Recording'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: _handleSignOut,
            tooltip: 'Sign out',
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Upload a meeting recording to summarize',
                style: TextStyle(fontSize: 18.0),
              ),
              const SizedBox(height: 24.0),
              ElevatedButton.icon(
                onPressed: _pickFile,
                icon: const Icon(Icons.upload_file),
                label: const Text('Pick a File'),
              ),
              if (_fileName != null) ...[
                const SizedBox(height: 16.0),
                Text('Selected: $_fileName'),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
