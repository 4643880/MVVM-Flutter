import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mvvm_flutter_app/domain/models/onboarding_model.dart';
import 'package:mvvm_flutter_app/presentation/resources/assets_manager.dart';
import 'package:mvvm_flutter_app/presentation/resources/colors_manager.dart';
import 'package:mvvm_flutter_app/presentation/resources/routes_manager.dart';
import 'package:mvvm_flutter_app/presentation/resources/strings_manager.dart';
import 'package:mvvm_flutter_app/presentation/resources/values_manager.dart';
import 'package:mvvm_flutter_app/presentation/screens/onboarding/onboarding_view_model.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  OnBoardingViewModel _viewModel = OnBoardingViewModel();

  _bind() {
    _viewModel.start();
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        backgroundColor: ColorManager.white,
        elevation: AppSize.kSize0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: ColorManager.white,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      body: PageView.builder(
        controller: _pageController,
        itemCount: _list.length,
        onPageChanged: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        itemBuilder: (context, index) {
          return OnBoardingPage(
            sliderData: _list[currentIndex],
          );
        },
      ),
      bottomSheet: Container(
        color: ColorManager.white,
        height: AppSize.kSize100,
        child: Column(
          children: [
            Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                      context,
                      Routes.loginRoute,
                    );
                  },
                  child: Text(
                    AppStrings.skip,
                    style: Theme.of(context).textTheme.titleSmall,
                    textAlign: TextAlign.end,
                  ),
                )),
            // add layout for indicator and arrows
            _getBottomSheetWidget(),
          ],
        ),
      ),
    );
  }

  Widget _getBottomSheetWidget() {
    return Container(
      color: ColorManager.primary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // left arrow
          Padding(
            padding: const EdgeInsets.all(AppPadding.kPadding14),
            child: GestureDetector(
              child: SizedBox(
                height: AppSize.kSize20,
                width: AppSize.kSize20,
                child: SvgPicture.asset(ImageAssets.leftArrowIc),
              ),
              onTap: () {
                // go to previous slide
                _pageController.animateToPage(
                  _getPreviousIndex(),
                  duration: const Duration(milliseconds: DurationConstant.d300),
                  curve: Curves.bounceInOut,
                );
              },
            ),
          ),

          // circles indicator
          Row(
            children: [
              for (int i = 0; i < _list.length; i++)
                Padding(
                  padding: const EdgeInsets.all(AppPadding.kPadding8),
                  child: _getProperCircle(i, currentIndex),
                ),
            ],
          ),

          // right arrow
          Padding(
            padding: const EdgeInsets.all(AppPadding.kPadding14),
            child: GestureDetector(
              child: SizedBox(
                height: AppSize.kSize20,
                width: AppSize.kSize20,
                child: SvgPicture.asset(ImageAssets.rightarrowIc),
              ),
              onTap: () {
                // go to next slide
                _pageController.animateToPage(
                  _getNextIndex(),
                  duration: const Duration(milliseconds: DurationConstant.d300),
                  curve: Curves.bounceInOut,
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _getProperCircle(int index, int _currentIndex) {
    if (index == _currentIndex) {
      return SvgPicture.asset(ImageAssets.hollowCircleIc); // selected slider
    } else {
      return SvgPicture.asset(ImageAssets.solidCircleIc); // unselected slider
    }
  }
}

class OnBoardingPage extends StatelessWidget {
  SliderData sliderData;

  OnBoardingPage({required this.sliderData});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(height: AppSize.kSize40),
        Padding(
          padding: const EdgeInsets.all(AppPadding.kPadding8),
          child: Text(
            sliderData.title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.kPadding8),
          child: Text(
            sliderData.subTitle,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        const SizedBox(
          height: AppSize.kSize60,
        ),
        SvgPicture.asset(sliderData.img),
      ],
    );
  }
}
