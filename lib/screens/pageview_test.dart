import 'package:flutter/material.dart';

class PageViewTest extends StatefulWidget {
  @override
  _PageViewTestState createState() => _PageViewTestState();
}

class _PageViewTestState extends State<PageViewTest> {
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: PageView(
        controller: _pageController,
        children: <Widget>[
          Container(
            color: Colors.red,
            child: Center(
              child: RaisedButton(
                color: Colors.white,
                child: Text(
                  'Next',
                ),
                onPressed: () {
                  if (_pageController.hasClients) {
                    _pageController.animateToPage(
                      1,
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeInOut,
                    );
                  }
                },
              ),
            ),
          ),
          Container(
            color: Colors.blue,
            child: Center(
              child: RaisedButton(
                color: Colors.white,
                child: Text(
                  'Previous',
                ),
                onPressed: () {
                  if (_pageController.hasClients) {
                    _pageController.animateToPage(
                      0,
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeInOut,
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
