import 'package:onesignal_flutter/onesignal_flutter.dart';

const oneSignalAppId = "";

Future<void> initOneSignal() async {
  OneSignal.initialize('9b072e8d-445c-405a-9733-9508dfe1e79e');
  OneSignal.Notifications.requestPermission(true).then((value) {});
}

void registerOneSignalEventListener({
  required Function(OSNotificationClickEvent) onOpened,
  required Function(OSNotificationClickResult) onReceivedInForeground,
}) {
  OneSignal.Debug.setLogLevel(OSLogLevel.verbose);
  OneSignal.initialize("9b072e8d-445c-405a-9733-9508dfe1e79e");
  OneSignal.Notifications.requestPermission(true);
}

const tagName = "userId";

void sendUserTag(int schoolId) {
  OneSignal.User.addTagWithKey("schoolId", schoolId);
}

void deleteUserTag() {
  OneSignal.User.removeTag("userId");
}
