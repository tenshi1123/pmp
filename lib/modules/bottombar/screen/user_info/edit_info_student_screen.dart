import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pmp_english/student_models/profile_model.dart';
import 'package:pmp_english/student_repo/customer_repo.dart';
import 'package:pmp_english/utils/constants/color.dart';
import 'package:pmp_english/utils/constants/styles.dart';
import 'package:image_picker/image_picker.dart';

class EditInfoStudentScreen extends StatefulWidget {
  final ProfileModel profileModel;
  const EditInfoStudentScreen({super.key, required this.profileModel});

  @override
  State<EditInfoStudentScreen> createState() => _EditInfoStudentScreenState();
}

class _EditInfoStudentScreenState extends State<EditInfoStudentScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController birthdayController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  final ImagePicker _picker = ImagePicker();

  File? _avatarFile;
  Future<void> _pickImage() async {
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );

    if (pickedFile == null) return;

    if (!mounted) return;

    setState(() {
      _avatarFile = File(pickedFile.path);
    });
  }

  @override
  void initState() {
    nameController.text = widget.profileModel.fullName;
    phoneController.text = widget.profileModel.phone;
    emailController.text = widget.profileModel.email;
    birthdayController.text = widget.profileModel.dob;
    addressController.text = widget.profileModel.address;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Thông tin cá nhân'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            // Avatar + nút thêm
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundImage: _avatarFile != null
                      ? FileImage(_avatarFile!)
                      : NetworkImage(
                          'https://lms.pmpenglish.edu.vn/images/${widget.profileModel.img}',
                        ) as ImageProvider,
                ),
                Positioned(
                  bottom: 4,
                  right: 4,
                  child: GestureDetector(
                    onTap: _pickImage,
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue,
                      ),
                      child: const Icon(
                        Icons.add,
                        size: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 24.h),
            buildLabeledField(
              label: 'Họ và tên',
              controller: nameController,
              context: context,
            ),
            SizedBox(height: 16.h),
            buildLabeledField(
              label: 'Số điện thoại',
              controller: phoneController,
              context: context,
            ),
            SizedBox(height: 16.h),
            buildLabeledField(
              label: 'Email',
              controller: emailController,
              context: context,
            ),
            SizedBox(height: 16.h),
            buildLabeledField(
              label: 'Sinh nhật',
              controller: birthdayController,
              context: context,
              isDateField: true,
            ),
            SizedBox(height: 16.h),
            buildLabeledField(
              label: 'Địa chỉ',
              controller: addressController,
              context: context,
            ),
            SizedBox(height: 32.h),
            // Nút lưu
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  // Lưu dữ liệu
                  String message = await CustomerRepo().changeInfo(
                    name: nameController.text,
                    phone: phoneController.text,
                    email: emailController.text,
                    dob: birthdayController.text,
                    address: addressController.text,
                  );
                  //show dialog
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text(
                          message,
                          style: defaultText16M.copyWith(
                            color: const Color.fromARGB(255, 29, 29, 29),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        actionsPadding:
                            const EdgeInsets.symmetric(horizontal: 10.0),
                        actions: <Widget>[
                          TextButton(
                            child: Text(
                              'ok',
                              style: defaultText16M.copyWith(
                                  color: const Color(0xff3C3C3C)),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF00B0F0),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Lưu thay đổi',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 32.h),
          ],
        ),
      ),
    );
  }
}

Widget buildLabeledField({
  required BuildContext context,
  required String label,
  required TextEditingController controller,
  bool isDateField = false,
  void Function(DateTime)? onDateSelected,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: defaultText14B.copyWith(color: const Color(0xFF102B61)),
      ),
      const SizedBox(height: 8),
      GestureDetector(
        onTap: isDateField
            ? () async {
                FocusScope.of(context).unfocus();
                final selectedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime(2100),
                );
                if (selectedDate != null) {
                  controller.text =
                      '${selectedDate.day.toString().padLeft(2, '0')}-${selectedDate.month.toString().padLeft(2, '0')}-${selectedDate.year}';
                  if (onDateSelected != null) onDateSelected(selectedDate);
                }
              }
            : null,
        child: AbsorbPointer(
          absorbing: isDateField,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
            decoration: BoxDecoration(
              color: const Color(0xFFF5F2F6).withValues(alpha: 0.2),
              border: Border.all(
                color: Color(0xFFF5F2F6).withValues(alpha: 0.8),
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: TextField(
              controller: controller,
              style: defaultText14M.copyWith(color: key1Color),
              decoration: const InputDecoration.collapsed(hintText: ''),
            ),
          ),
        ),
      ),
    ],
  );
}
