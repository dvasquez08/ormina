import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:ormina/screens/summary_detail_screen.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({super.key});

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  String? _fileName;
  PlatformFile? _file;

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

      const generatedSummary =
          "Here's a summary of your meeting. Key points:\n~ Discussed project timeline\n~ Agreed on milestones\n- Assigned tasks";

      if (!mounted) return;
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) =>
                  const SummaryDetailScreen(summary: generatedSummary)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upload Recording'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
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
