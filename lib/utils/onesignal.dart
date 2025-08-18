import 'package:onesignal_flutter/onesignal_flutter.dart';

const oneSignalAppId = "";

Future<void> initOneSignal() async {
  OneSignal.initialize('9eed43b6-3e7d-4d7b-a8fb-621e889f71c9');
  OneSignal.Notifications.requestPermission(true).then((value) {});
}

void registerOneSignalEventListener({
  required Function(OSNotificationClickEvent) onOpened,
  required Function(OSNotificationClickResult) onReceivedInForeground,
}) {
  OneSignal.Debug.setLogLevel(OSLogLevel.verbose);
  OneSignal.initialize("9eed43b6-3e7d-4d7b-a8fb-621e889f71c9");
  OneSignal.Notifications.requestPermission(true);
}

const tagName = "userId";

void sendUserTag(int schoolId) {
  OneSignal.User.addTagWithKey("schoolId", schoolId);
}

void deleteUserTag() {
  OneSignal.User.removeTag("userId");
}
