// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter/material.dart';

import 'package:mvvm_flutter_app/domain/models/onboarding_model.dart';
import 'package:mvvm_flutter_app/presentation/base/base_view_model.dart';
import 'package:mvvm_flutter_app/presentation/resources/assets_manager.dart';
import 'package:mvvm_flutter_app/presentation/resources/strings_manager.dart';
import 'package:mvvm_flutter_app/presentation/screens/onboarding/onboarding_screen.dart';

class OnBoardingViewModel
    implements
        BaseViewModel,
        OnbaordingViewModelInputs,
        OnbaordingViewModelOutputs {
  late final StreamController _streamController;

  int currentIndex = 0;
  late final List<SliderData> _list;

  @override
  void dispose() {
    _streamController.close();
  }

  @override
  void start() {
    _streamController = StreamController<SliderViewData>();
    _list = _getSliderData();
    _postDataToView();
  }

  @override
  void goNext() {
    int nextIndex = currentIndex++;
    if (nextIndex >= _list.length) {
      currentIndex = 0;
    } else {
      print("reached here");
    }
    _postDataToView();
  }

  @override
  void goPrevious() {
    int previousIndex = currentIndex--;
    if (previousIndex == -1) {
      currentIndex = _list.length - 1;
    }
    _postDataToView();
  }

  @override
  void onPageChange(int index) {
    currentIndex = index;
    _postDataToView();
  }

  @override
  Sink get inputOfSliderData => _streamController.sink;

  @override
  Stream<SliderViewData> get outputOfSliderViewData =>
      _streamController.stream.map((sliderViewData) => sliderViewData);

  List<SliderData> _getSliderData() => [
        SliderData(
          title: AppStrings.onBoardingTitle1,
          subTitle: AppStrings.onBoardingSubTitle1,
          img: ImageAssets.onboardingLogo1,
        ),
        SliderData(
          title: AppStrings.onBoardingTitle2,
          subTitle: AppStrings.onBoardingSubTitle2,
          img: ImageAssets.onboardingLogo2,
        ),
        SliderData(
          title: AppStrings.onBoardingTitle3,
          subTitle: AppStrings.onBoardingSubTitle3,
          img: ImageAssets.onboardingLogo3,
        ),
        SliderData(
          title: AppStrings.onBoardingTitle4,
          subTitle: AppStrings.onBoardingSubTitle4,
          img: ImageAssets.onboardingLogo4,
        ),
      ];

  _postDataToView() {
    inputOfSliderData.add(
      SliderViewData(
        sliderData: _list[currentIndex],
        numberOfSlider: _list.length,
        currentIndex: currentIndex,
      ),
    );
  }
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
