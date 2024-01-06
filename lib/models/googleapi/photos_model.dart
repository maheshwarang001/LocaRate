class Photos{

  int? _height;
  List<String>? _html_attributions;
  String? _photo_reference;
  int? _width;



  int? get height => _height;
  List<String>? get html_attributions => _html_attributions;
  String? get photo_reference => _photo_reference;
  int? get width => _width;


  Photos.fromJson(Map<String, dynamic> json) {
    _height = json['height'];
    _html_attributions = json['html_attributions']?.cast<String>();
    _photo_reference = json['photo_reference'];
    _width = json['width'];
  }



  set height(int? height) {
    _height = height;
  }

  set width(int? width) {
    _width = width;
  }

  set photo_reference(String? photo_reference) {
    _photo_reference = photo_reference;
  }

  set html_attributions(List<String>? html_attributions) {
    _html_attributions = html_attributions;
  }

}