class OpeningHours{
  bool? _open_now;

  bool? get open_now => _open_now;

  set open_now(bool? open_now) {
    _open_now = open_now;
  }

  OpeningHours.fromJson(Map<String, dynamic> json) {
    _open_now = json['open_now'];

  }
}