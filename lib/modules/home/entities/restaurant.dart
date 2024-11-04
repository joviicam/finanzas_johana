class Restaurant {
  final String _name;
  final String _description;
  final List<String> _images;
  final double _rating;
  final int _count;
  final List<String> _comments;
  final double _latitud;
  final double _longitud;

  Restaurant(this._name, this._description, this._images, this._rating,
      this._count, this._comments, this._latitud, this._longitud);
  String get name => _name;

  String get description => _description;

  List<String> get images => _images;

  List<String> get comments => _comments;

  double get rating => _rating;
  int get count => _count;

  double get latitud => _latitud;
  double get longitud => _longitud;
}
