import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:pmp_english/core/localization/language_cubit.dart';
import 'package:pmp_english/l10n/l10n.dart';
import 'package:pmp_english/student_repo/mycourse_repo.dart';
import 'package:pmp_english/utils/constants/color.dart';
import 'package:pmp_english/utils/constants/styles.dart';

class LeaveRequestDialog extends StatelessWidget {
  const LeaveRequestDialog({super.key, required this.id, required this.time});
  final String id;
  final DateTime time;
  @override
  Widget build(BuildContext context) {
    TextEditingController reasonController = TextEditingController();

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Lịch học: ${DateFormat('yyyy-MM-dd').format(time)}',
              style: defaultText16M,
            ),
            const SizedBox(height: 16),
            Text(
              L10n.of(context).reasonMiss,
              style: defaultText16M,
            ),
            const SizedBox(height: 8),
            TextField(
              controller: reasonController,
              maxLines: 3,
              decoration: InputDecoration(
                hintText: L10n.of(context).enterReasonForLeave,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
                contentPadding: EdgeInsets.all(12.r),
              ),
            ),
            SizedBox(height: 24.h),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // Close the dialog
                    },
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: const Color(0xFFF7F4F6),
                      padding: EdgeInsets.symmetric(vertical: 14.h),
                    ),
                    child: Text(
                      L10n.of(context).cancel,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () async {
                      // Handle confirmation logic
                      print('Lý do nghỉ: ${reasonController.text}');
                      String message = await MycourseRepo()
                          .takeADayOff(id, reasonController.text);
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text(
                              message,
                              style: defaultText16B,
                            ),
                            actionsPadding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            actions: <Widget>[
                              TextButton(
                                child: const Text(
                                  'OK',
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
                      backgroundColor: sub2Color,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    child: Text(
                      L10n.of(context).confirm,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void showLanguageDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (_) {
      return AlertDialog(
        title: Text(L10n.of(context).chooseLanguage),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _LanguageItem(
              title: 'Tiếng Việt',
              locale: const Locale('vi'),
            ),
            _LanguageItem(
              title: 'English',
              locale: const Locale('en'),
            ),
          ],
        ),
      );
    },
  );
}

class _LanguageItem extends StatelessWidget {
  final String title;
  final Locale locale;

  const _LanguageItem({
    required this.title,
    required this.locale,
  });

  @override
  Widget build(BuildContext context) {
    final current = context.watch<LanguageCubit>().state;

    return ListTile(
      title: Text(title),
      trailing: current.languageCode == locale.languageCode
          ? const Icon(Icons.check, color: Colors.green)
          : null,
      onTap: () {
        context.read<LanguageCubit>().changeLanguage(locale);
        Navigator.pop(context);
      },
    );
  }
}
