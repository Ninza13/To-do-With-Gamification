enum AppImages {
  cat('cat'),
  translate('translate'),
  humans('humans'),
  flower('flower'),
  notebook('notebook'),
  user("user"),
  pc('pc');

  const AppImages(this._name);
  final String _name;

  String get path => 'assets/images/$_name.png';
}
