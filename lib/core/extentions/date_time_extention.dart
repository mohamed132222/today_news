extension DateTimeExtention on DateTime {
  String formaterDateTime() {
    final diff = DateTime.now().difference(this);

    if (diff.inSeconds < 60) {
      return "${diff.inSeconds} seconds ago";
    }
    if (diff.inMinutes < 60) {
      return "${diff.inMinutes} minutes ago";
    }
    if (diff.inHours < 60) {
      return "${diff.inHours} hours ago";
    }
    return "${diff.inDays} days ago";
  }
}
