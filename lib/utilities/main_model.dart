import 'package:scoped_model/scoped_model.dart';

class MainModel extends Model {
  String _backdrop = "assets/images/white_backdrop.png";

  String get backdrop => _backdrop;

  set backdrop(String value) {
    _backdrop = value;
  }
}