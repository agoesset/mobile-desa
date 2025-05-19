import 'package:flutter/foundation.dart';
import '../models/aparatur.dart';
import '../services/aparatur_service.dart';
import 'base_state.dart';

class AparaturProvider extends ChangeNotifier {
  final AparaturService _aparaturService;
  BaseState<List<Aparatur>> _state = BaseState<List<Aparatur>>.initial();

  AparaturProvider({AparaturService? aparaturService})
      : _aparaturService = aparaturService ?? AparaturService();

  BaseState<List<Aparatur>> get state => _state;

  Future<void> loadAparaturs() async {
    try {
      _state = BaseState<List<Aparatur>>.loading();
      notifyListeners();

      final aparaturs = await _aparaturService.getAll();
      _state = BaseState<List<Aparatur>>.success(aparaturs);
    } catch (e) {
      _state = BaseState<List<Aparatur>>.error(e.toString());
    }
      notifyListeners();
  }

  Future<void> loadAparaturDetail(String id) async {
    try {
      _state = BaseState<List<Aparatur>>.loading();
      notifyListeners();

      final aparatur = await _aparaturService.getById(id);
      _state = BaseState<List<Aparatur>>.success([aparatur]);
    } catch (e) {
      _state = BaseState<List<Aparatur>>.error(e.toString());
    }
      notifyListeners();
  }
} 