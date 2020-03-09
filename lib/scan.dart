import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_mobile_vision/qr_camera.dart';


class ScannerPage extends StatefulWidget {
  final double _width;
  final BuildContext _context;

  ScannerPage(this._width, this._context):super();

  @override
  State<StatefulWidget> createState() {
    return new _ScannerPageState(_width, _context);
  }
}

class _ScannerPageState extends State<ScannerPage>
    with TickerProviderStateMixin {
  final double _width;
  final BuildContext _context;

  _ScannerPageState(this._width, this._context);

  bool _visibilityImageCenter = true;
  bool _visibilityScaleImage = false;
  bool _visibilityBackground = true;
  double _animatedWidth = 0;
  double scannerOffset = 0.5;
  Animation _rotateAnimation;
  Animation _zoomAnimation;
  AnimationController _controller;
  AnimationController _controllerScanner;
  Animation<Offset> _scannerAnimation;
  AnimationController _controllerZoom;
  Animation<double> _endZoomAnimation;
  Tween<Offset> tweenScanner;

  @override
  void initState() {
    _controller = AnimationController(
      duration: Duration(milliseconds: 550),
      vsync: this,
    );

    _playAnimation();

    _controllerScanner = AnimationController(
      duration: Duration(milliseconds: 1700),
      vsync: this,
    );

    _controllerZoom =
        AnimationController(vsync: this, duration: Duration(milliseconds: 600));

    _zoomAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.linear,
    );

    tweenScanner =
        Tween<Offset>(begin: Offset(0.0, scannerOffset), end: Offset(0.0, 1.0));
    _scannerAnimation = tweenScanner.animate(CurvedAnimation(
      parent: _controllerScanner,
      curve: Curves.decelerate,
    ))
      ..addStatusListener((status) {
        if (status == AnimationStatus.reverse) {
          tweenScanner.begin = Offset(0.0, 0.0);
        }
      });

    _rotateAnimation = Tween<double>(begin: 0.0, end: 0.5).animate(_controller)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          setState(() {
            _visibilityScaleImage = true;
            _visibilityImageCenter = false;
            _playAnimationZoomOut().whenComplete(() {});
          });
        }
      });

    _endZoomAnimation = Tween<double>(
      begin: 30,
      end: _width,
    ).animate(
      CurvedAnimation(
        parent: _controllerZoom,
        curve: Curves.ease,
      ),
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          setState(() {
            _visibilityScaleImage = false;
            _visibilityBackground = false;
            _animatedWidth = double.infinity;
            _controllerScanner
              ..repeat(
                reverse: true,
              );
          });
        }
      });

    super.initState();
  }

  Future<void> _playAnimationZoomOut() async {
    try {
      await _controllerZoom.forward();
    } on TickerCanceled {
      // the animation got canceled, probably because we were disposed
    }
  }

  Future<void> _playAnimation() async {
    try {
      await _controller.forward();
    } on TickerCanceled {
      // the animation got canceled, probably because we were disposed
    }
  }

  void setResultQR(code){
    Navigator.pop(context, code);
  }

  @override
  void dispose() {
    _controller.dispose();
    _controllerScanner.dispose();
    _controllerZoom.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double heightScanner = 0.75;
    return Center(
      child: Stack(
        children: [
          Container(
            child: Stack(
              children: <Widget>[
                QrCamera(
                  onError: (context, error) => Text(
                    error.toString(),
                    style: TextStyle(color: Colors.red),
                  ),
                  qrCodeCallback: (code) {
                    //_qrCallback(code);
                    setResultQR(code.toString());
                    //Navigator.pop(context, code.toString());
                  },
                ),
                Visibility(
                  visible: _visibilityBackground,
                  child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    color: Colors.black,
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: () {
                      Scaffold.of(context).showSnackBar(SnackBar(
                        content: Text("Lampu Nyala"),
                      ));
                    },
                    child: Container(
                      width: 20,
                      height: 20,
                      margin:
                          const EdgeInsets.only(left: 10.0, top: 40, right: 20),
                      child: GestureDetector(
                        child: Icon(
                          Icons.flash_on,
                          color: Colors.white,
                        ),
                        onTap: () {
                          Scaffold.of(context).showSnackBar(SnackBar(
                            content: Text('Tap'),
                          ));
                        },
                      ),

                      // ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    width: 20,
                    height: 20,
                    margin: const EdgeInsets.only(left: 20.0, top: 40),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context, "Exit");
                      },
                      child: Icon(
                        Icons.close,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: SlideTransition(
                    position: _scannerAnimation,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 5000),
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: heightScanner,
                            width: _animatedWidth,
                            color: Colors.lightBlue[800],
                          ),
                          Container(
                            height: heightScanner,
                            width: _animatedWidth,
                            color: Colors.lightBlue[600],
                          ),
                          Container(
                            height: heightScanner,
                            width: _animatedWidth,
                            color: Colors.lightBlue[500],
                          ),
                          Container(
                            height: heightScanner,
                            width: _animatedWidth,
                            color: Colors.lightBlue[400],
                          ),
                          Container(
                            height: heightScanner,
                            width: _animatedWidth,
                            color: Colors.lightBlue[300],
                          ),
                          Container(
                            height: heightScanner,
                            width: _animatedWidth,
                            color: Colors.lightBlue[300],
                          ),
                          Container(
                            height: heightScanner,
                            width: _animatedWidth,
                            color: Colors.lightBlue[200],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Visibility(
            visible: _visibilityImageCenter,
            child: RotationTransition(
              turns: _rotateAnimation,
              child: ScaleTransition(
                scale: _zoomAnimation,
                child: Center(
                  child: Image(
                    image: AssetImage('images/ic_scan.png'),
                    width: 60,
                    height: 60,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          AnimatedOpacity(
            opacity: _visibilityScaleImage ? 1.0 : 0.0,
            duration: Duration(milliseconds: 200),
            child: Center(
              child: AnimatedBuilder(
                animation: _endZoomAnimation,
                builder: (BuildContext context, Widget child) {
                  return Stack(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          color: Colors.white,
                          width: _endZoomAnimation.value,
                          height: 5,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
