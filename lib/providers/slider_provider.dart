import 'package:flutter/foundation.dart';
import '../models/slider.dart';
import '../services/slider_service.dart';
import 'base_state.dart';

class SliderProvider extends ChangeNotifier {
  final SliderService _sliderService;
  BaseState<List<SliderModel>> _state = BaseState.initial();

  SliderProvider({SliderService? sliderService})
      : _sliderService = sliderService ?? SliderService();

  BaseState<List<SliderModel>> get state => _state;

  Future<void> loadSliders() async {
    try {
      _state = _state.copyWith(status: Status.loading);
      notifyListeners();

      final sliders = await _sliderService.getAll();
      _state = BaseState.success(sliders);
    } catch (e) {
      _state = BaseState.error(e.toString());
      debugPrint('Error loading sliders: $e');
    }
      notifyListeners();
  }
} 