import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';

import 'package:file_picker/file_picker.dart';

class DetailExamScreen extends StatefulWidget {
  const DetailExamScreen({super.key});

  @override
  _DetailExamScreenState createState() => _DetailExamScreenState();
}

class _DetailExamScreenState extends State<DetailExamScreen> {
  String? _fileName;

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        _fileName = result.files.single.name;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            _fileName ?? "Chưa có tệp nào được chọn",
            style: TextStyle(color: Colors.grey[600]),
          ),
        ),
        const SizedBox(height: 10),
        DottedBorder(
          borderType: BorderType.RRect,
          radius: const Radius.circular(8),
          dashPattern: const [6, 3], // Áp dụng nét đứt
          strokeWidth: 2,
          color: Colors.blue,
          child: GestureDetector(
            onTap: _pickFile,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 15),
              color: Colors.blue.withOpacity(0.1),
              alignment: Alignment.center,
              child: const Text(
                "+ Chọn tệp tải lên",
                style: TextStyle(color: Colors.blue, fontSize: 16),
              ),
            ),
          ),
        ),
        // GestureDetector(
        //   onTap: _pickFile,
        //   child: Container(
        //     padding: EdgeInsets.all(12),
        //     width: double.infinity,
        //     decoration: BoxDecoration(
        //       color: Colors.blue[50],
        //       borderRadius: BorderRadius.circular(8),
        //       border: Border.all(color: Colors.blue, style: BorderStyle.solid, width: 1.5, dashPattern: [5, 5]),
        //     ),
        //     child: Center(
        //       child: Text(
        //         "+ Chọn tệp tải lên",
        //         style: TextStyle(color: Colors.blue, fontSize: 16, fontWeight: FontWeight.bold),
        //       ),
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
