import 'package:flutter/material.dart';
import 'package:gradient_text/gradient_text.dart';
import 'package:onboarding_screen/models/data.dart';
import 'package:onboarding_screen/widgets/page_indicators.dart';

class HomePageScreen extends StatefulWidget {
  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen>
    with TickerProviderStateMixin {
  PageController _pageController;
  int _currentPage = 0;
  bool _lastPage = false;

  AnimationController animationController;
  Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: _currentPage,
    );
    animationController =
        AnimationController(duration: Duration(milliseconds: 300), vsync: this);
    _scaleAnimation = Tween(begin: 0.6, end: 1.0).animate(animationController);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF485563), Color(0xFF29323C)],
          tileMode: TileMode.clamp,
          begin: Alignment.center,
          stops: [0.0, 1.0],
          end: Alignment.bottomCenter,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            PageView.builder(
              itemCount: pageList.length,
              controller: _pageController,
              onPageChanged: (index) {
                setState(
                  () {
                    _currentPage = index;
                    if (_currentPage == pageList.length - 1) {
                      _lastPage = true;
                      animationController.forward();
                    } else {
                      _lastPage = false;
                      animationController.reset();
                    }
                    print(_lastPage);
                  },
                );
              },
              itemBuilder: (context, index) {
                return AnimatedBuilder(
                  animation: _pageController,
                  builder: (context, child) {
                    var _page = pageList[index];
                    var _delta;
                    var y = 1.0;

                    if (_pageController.position.haveDimensions) {
                      _delta = _pageController.page - index;
                      y = 1 - _delta.abs().clamp(0.0, 1.0);
                    }
                    return Column(
                      children: <Widget>[
                        Image.asset(_page.imageUrl),
                        Container(
                          margin: const EdgeInsets.only(left: 12.0),
                          height: 100.0,
                          child: Stack(
                            children: <Widget>[
                              Opacity(
                                opacity: .10,
                                child: GradientText(
                                  _page.title,
                                  gradient: LinearGradient(
                                    colors: pageList[index].titleGradient,
                                  ),
                                  style: TextStyle(
                                      fontSize: 100.0, letterSpacing: 1.0),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 30.0,
                                  left: 22.0,
                                ),
                                child: GradientText(
                                  _page.title,
                                  gradient: LinearGradient(
                                    colors: pageList[index].titleGradient,
                                  ),
                                  style: TextStyle(
                                    fontSize: 70.0,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 34.0,
                                  top: 12.0,
                                ),
                                child: Transform(
                                  transform: Matrix4.translationValues(
                                      0, 50.0 * (1 - y), 0),
                                  child: Text(
                                    _page.body,
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        color: Color(0xFF9B9B9B)),
                                  ),
                                ),
                              ),
                              Positioned(
                                child: Container(
                                  width: 160.0,
                                  child: PageIndicator(
                                    currentIndex: index,
                                    pageCount: pageList.length,
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 30.0,
                                bottom: 30.0,
                                child: ScaleTransition(
                                  scale: _scaleAnimation,
                                  child: _lastPage
                                      ? FloatingActionButton(
                                          backgroundColor: Colors.white,
                                          child: Icon(
                                            Icons.arrow_forward,
                                            color: Colors.black,
                                          ),
                                          onPressed: () {},
                                        )
                                      : Container(),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}

// Color(0xFF485563), Color(0xFF29323C)
