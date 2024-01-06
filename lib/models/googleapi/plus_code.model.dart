class PlusCode{
  String? _compound_code;
  String? _global_code;

  String? get compound_code => _compound_code;

  String? get global_code => _global_code;

  set global_code(String? global_code) {
    _global_code = global_code;
  }

  set compound_code(String? compound_code) {
    _compound_code = compound_code;
  }

  PlusCode.fromJson(Map<String, dynamic> json) {
    _compound_code = json['compound_code'];
    _global_code = json['global_code'];
  }
}