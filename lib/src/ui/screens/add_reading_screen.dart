import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../models/bill_reading.dart';
import '../../repositories/bill_repository.dart';

class AddReadingScreen extends StatefulWidget {
  final BillRepository repository;
  const AddReadingScreen({super.key, required this.repository});

  @override
  State<AddReadingScreen> createState() => _AddReadingScreenState();
}

class _AddReadingScreenState extends State<AddReadingScreen> {
  final _formKey = GlobalKey<FormState>();
  final _consumerCtrl = TextEditingController();
  final _meterCtrl = TextEditingController();
  final _readingCtrl = TextEditingController();
  final _remarksCtrl = TextEditingController();
  File? _image;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final file = await picker.pickImage(source: ImageSource.camera);
    if (file != null) setState(() => _image = File(file.path));
  }

  void _submit() async {
    if (_formKey.currentState?.validate() ?? false) {
      final reading = BillReading(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        consumerNo: _consumerCtrl.text,
        meterNo: _meterCtrl.text,
        reading: double.parse(_readingCtrl.text),
        readingDate: DateTime.now(),
        photoPath: _image?.path,
        remarks: _remarksCtrl.text,
      );

      await widget.repository.saveReading(reading);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Reading saved (sync pending if offline)')),
      );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Upload Bill Reading')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _consumerCtrl,
                decoration: const InputDecoration(labelText: 'Consumer Number'),
                validator: (v) => v!.isEmpty ? 'Required' : null,
              ),
              TextFormField(
                controller: _meterCtrl,
                decoration: const InputDecoration(labelText: 'Meter Number'),
                validator: (v) => v!.isEmpty ? 'Required' : null,
              ),
              TextFormField(
                controller: _readingCtrl,
                decoration: const InputDecoration(labelText: 'Reading (kWh)'),
                keyboardType: TextInputType.number,
                validator: (v) => v!.isEmpty ? 'Required' : null,
              ),
              TextFormField(
                controller: _remarksCtrl,
                decoration: const InputDecoration(labelText: 'Remarks'),
              ),
              const SizedBox(height: 12),
              if (_image != null) Image.file(_image!, height: 150),
              ElevatedButton.icon(
                onPressed: _pickImage,
                icon: const Icon(Icons.camera_alt),
                label: const Text('Take Meter Photo'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submit,
                child: const Text('Submit Reading'),
              )
            ],
          ),
        ),
      ),
    );
  }
}