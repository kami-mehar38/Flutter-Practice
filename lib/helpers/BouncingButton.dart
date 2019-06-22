import 'package:flutter/material.dart';

/// Container for animated button
class BouncingButton extends StatefulWidget {

  final String text;
  final double width;
  final double height;
  final void Function(BuildContext) onTap;

  const BouncingButton({Key key, this.text, this.width, this.height, this.onTap}) : super(key: key);  

  @override
  _BouncingButtonState createState() => _BouncingButtonState();
}

class _BouncingButtonState extends State<BouncingButton>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.ease,
      reverseCurve: Curves.easeIn,
    ));
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Color(0xFFD72D27),
              borderRadius: BorderRadius.all(Radius.circular(widget.height / 2)),
              boxShadow: [
                BoxShadow(
                  color: Color(0xFFEfABA8),
                  blurRadius: 6,
                  spreadRadius: 0.6,
                  offset: Offset(0, 2),
                ),
              ]),
          width: widget.width,
          height: widget.height,
          child: Text(
            widget.text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      onTapDown: (details) => _onTapDown(details),
      onTapUp: (details) => _onTapUp(details),
      onTapCancel: _onTapCancel,
      onTap: () => _onTap(context),
    );
  }

  _onTap(BuildContext context) {
    _controller.reverse();
    widget.onTap(context);
  }

  _onTapDown(TapDownDetails details) {
   _controller.forward();
  }

  _onTapUp(TapUpDetails details) {
    _controller.reverse();
  }

  _onTapCancel() {
   _controller.reverse();
  }
}