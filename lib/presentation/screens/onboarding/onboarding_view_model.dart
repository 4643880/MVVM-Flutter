// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter/material.dart';

import 'package:mvvm_flutter_app/domain/models/onboarding_model.dart';
import 'package:mvvm_flutter_app/presentation/base/base_view_model.dart';
import 'package:mvvm_flutter_app/presentation/screens/onboarding/onboarding_screen.dart';

class OnBoardingViewModel
    implements
        BaseViewModel,
        OnbaordingViewModelInputs,
        OnbaordingViewModelOutputs {
  // =========================================
  // Stream Controllers Starts Here
  // =========================================
  final StreamController _streamController = StreamController<SliderViewData>();
  // =========================================
  // Stream Controllers Starts Here
  // =========================================

  // =========================================
  // Input Base View Model Starts Here
  // =========================================
  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  void start() {
    // TODO: implement start
  }

  // =========================================
  // Input Base View Model Ends Here
  // =========================================

  // =========================================
  // Input Onboarding View Model Starts Here
  // =========================================
  @override
  void goNext() {
    // TODO: implement goNext
  }

  @override
  void goPrevious() {
    // TODO: implement goPrevious
  }

  @override
  void onPageChange(int index) {
    // TODO: implement onPageChange
  }

  @override
  // TODO: implement inputOfSliderData
  Sink get inputOfSliderData => throw UnimplementedError();

  // =========================================
  // Input Onboarding View Model Ends Here
  // =========================================

  // =========================================
  // Output Onboarding View Model Starts Here
  // =========================================

  @override
  // TODO: implement outputOfSliderViewData
  Stream<SliderViewData> get outputOfSliderViewData =>
      throw UnimplementedError();

  // =========================================
  // Output Onboarding View Model Ends Here
  // =========================================
}

abstract class OnbaordingViewModelInputs {
  void goNext(); // when user will click on right arrow
  void goPrevious(); // when user will click on left arrow
  void onPageChange(int index);

  Sink get inputOfSliderData; // Stream input
}

abstract class OnbaordingViewModelOutputs {
  Stream<SliderViewData> get outputOfSliderViewData;
}

class SliderViewData {
  SliderData sliderData;
  int numberOfSlider;
  int currentIndex;

  SliderViewData({
    required this.sliderData,
    required this.numberOfSlider,
    required this.currentIndex,
  });
}
