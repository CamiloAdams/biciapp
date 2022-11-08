import 'package:flutter/material.dart';

import '../interfaces/guide.dart';

class GuidesProvider extends ChangeNotifier {
  bool _load = false;
  List<Guide> _guides = [];
  Guide _guide = Guide(
    id: '',
    nombre: '',
    imagenes: [],
    texto: [],
  );

  List<Guide> get guides {
    return _guides;
  }

  set guides(List<Guide> guides) {
    _guides = guides;
    notifyListeners();
  }

  bool get load {
    return _load;
  }

  set load(bool load) {
    _load = load;
    notifyListeners();
  }

  Guide get guide {
    return _guide;
  }

  set guide(Guide guide) {
    _guide = guide;
    notifyListeners();
  }
}
