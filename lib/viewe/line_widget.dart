import 'package:flutter/material.dart';

class Line extends StatefulWidget {
  final int state;
  final double size;
  final bool isZ2;
  const Line(this.state, this.size, {this.isZ2 = false, Key? key})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _LineState();
}

class _LineState extends State<Line> with SingleTickerProviderStateMixin {
  double _progress = 0.0;
  late Animation<double> animation;

  bool state = false;

  @override
  void initState() {
    super.initState();
    var controller = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);

    animation = Tween(begin: widget.size == 0.0 ? 1.0 : 0.0, end: widget.size)
        .animate(controller)
      ..addListener(() {
        setState(() {
          _progress = animation.value;
          if (_progress == widget.size) state = true;
        });
      });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.state == 0) {
      return CustomPaint(painter: LinePainter(_progress, widget.isZ2));
    }

    return widget.state == 1
        ? lineH(state ? widget.size : _progress)
        : lineV(state ? widget.size : _progress);
  }
}

class LinePainter extends CustomPainter {
  late Paint _paint;
  final double _progress;
  final bool isZ2;

  LinePainter(this._progress, this.isZ2) {
    _paint = Paint()
      ..color = Colors.redAccent
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8.0;
  }

  @override
  void paint(Canvas canvas, Size size) {
    if (isZ2) {
      canvas.drawLine(
          Offset(0.0, size.height),
          Offset(size.width - size.width * _progress, size.height * _progress),
          _paint);
    } else {
      canvas.drawLine(
          const Offset(0.0, 0.0),
          Offset(size.width - size.width * _progress,
              size.height - size.height * _progress),
          _paint);
    }
  }

  @override
  bool shouldRepaint(LinePainter oldDelegate) {
    return oldDelegate._progress != _progress;
  }
}

SizedBox lineH(double widthS) {
  return SizedBox(
    height: 100,
    child: Center(
      child: Container(
        width: widthS,
        height: 8,
        color: Colors.redAccent,
      ),
    ),
  );
}

SizedBox lineV(heightS) {
  return SizedBox(
    width: 100,
    child: Center(
      child: Container(
        width: 8,
        height: heightS,
        color: Colors.redAccent,
      ),
    ),
  );
}
