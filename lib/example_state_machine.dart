import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

class MyRiveAnimation extends StatefulWidget {
  @override
  _MyRiveAnimationState createState() => _MyRiveAnimationState();
}

class _MyRiveAnimationState extends State<MyRiveAnimation> {
  Artboard? _artboard;
  RiveAnimationController? _wipersController;

  // flag to turn on and off the six animation
  bool _sixAnimation = true;

  @override
  void initState() {
    _loadRiveFile();
    super.initState();
  }

  /// Loads a Rive file
  void _loadRiveFile() async {
    final bytes = await rootBundle.load('assets/cric.riv');
    final file = RiveFile.import(bytes);
    setState(() => _artboard = file.mainArtboard..addController(SimpleAnimation('idle')));
    // if (_wipersController == null) {
    //   _artboard!.addController(
    //     _wipersController = SimpleAnimation('Blue'),
    //   );
    // }
  }

  void _wipersChange(bool wipersOn, String animationName) {
    if (_wipersController == null) {

      _artboard?.removeController( _wipersController = SimpleAnimation('Blue'),);
      _artboard!.addController(
        _wipersController = SimpleAnimation(animationName),
      );
    }
    setState(() => _wipersController!.isActive = _sixAnimation = wipersOn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: _artboard != null
                ? Rive(
                    artboard: _artboard!,
                    fit: BoxFit.contain,
                  )
                : Container(),
          ),
          SizedBox(
            height: 100,
            width: 200,
            child: Row(
              children: [
                FlatButton(onPressed: () {
                  _wipersChange(true, 'Orange');
                }, child: Text('Orange', style: TextStyle(color: Colors.white),),color: Colors.orange,),

                FlatButton(onPressed: () {
                  _sixAnimation = !_sixAnimation;
                  setState(() => _wipersController!.isActive = _sixAnimation);
                }, child: Text(!_sixAnimation ? 'Animate': 'Stop')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
