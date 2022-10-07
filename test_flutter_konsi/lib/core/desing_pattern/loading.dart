// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:test_flutter_konsi/core/desing_pattern/buttons_widget.dart';
import 'package:test_flutter_konsi/core/utils/colors.dart';

class LoadingPage extends StatelessWidget {
  LoadingPage({
    Key? key,
    this.disabled = true,
  }) : super(key: key);

  final bool? disabled;
  RxBool canceled = false.obs;

  @override
  Widget build(BuildContext context) {
    if (disabled!) {
      Future.delayed(const Duration(seconds: 20), () {
        canceled.value = true;
      });
    }

    return Container(
      color: Colors.transparent,
      alignment: Alignment.center,
      height: Get.height,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          LoadingAnimationWidget.threeArchedCircle(
              color: myPrimaryColor, size: 60),
          const SizedBox(height: 20.0),
          Obx(
            () => canceled.value
                ? MyButtons(
                    text: 'Cancelar',
                    onPressed: () async {
                      Get.close(1);
                    },
                  ).roundedElevatedButton()
                : Container(),
          ),
        ],
      ),
    );
  }
}

class LoadingProgressindicator extends StatefulWidget {
  final Color? primaryColor;
  final Color? accentColor;
  final double size;
  final IndexedWidgetBuilder? itemBuilder;
  final Duration duration;
  const LoadingProgressindicator({
    Key? key,
    this.primaryColor,
    this.accentColor,
    this.size = 50.0,
    this.itemBuilder,
    this.duration = const Duration(milliseconds: 2000),
  }) : super(key: key);

  @override
  State<LoadingProgressindicator> createState() =>
      _LoadingProgressindicatorState();
}

class _LoadingProgressindicatorState extends State<LoadingProgressindicator>
    with TickerProviderStateMixin {
  late AnimationController _scaleCtrl;
  late AnimationController _rotateCtrl;
  late Animation<double> _scale;
  late Animation<double> _rotate;

  @override
  void initState() {
    super.initState();

    _scaleCtrl = AnimationController(vsync: this, duration: widget.duration)
      ..addListener(() => setState(() {}))
      ..repeat(reverse: true);
    _scale = Tween(begin: -1.0, end: 1.0)
        .animate(CurvedAnimation(parent: _scaleCtrl, curve: Curves.easeInOut));

    _rotateCtrl = AnimationController(vsync: this, duration: widget.duration)
      ..addListener(() => setState(() {}))
      ..repeat();
    _rotate = Tween(begin: 0.0, end: 360.0)
        .animate(CurvedAnimation(parent: _rotateCtrl, curve: Curves.linear));
  }

  @override
  void dispose() {
    _scaleCtrl.dispose();
    _rotateCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox.fromSize(
        size: Size.square(widget.size),
        child: Transform.rotate(
          angle: _rotate.value * 0.0174533,
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 0.0,
                child: _circle(
                  1.0 - _scale.value.abs(),
                  0,
                  widget.primaryColor!,
                ),
              ),
              Positioned(
                bottom: 0.0,
                child: _circle(_scale.value.abs(), 1, widget.accentColor!),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _circle(double scale, int index, Color color) {
    return Transform.scale(
      scale: scale,
      child: SizedBox.fromSize(
        size: Size.square(widget.size * 0.6),
        child: widget.itemBuilder != null
            ? widget.itemBuilder!(context, index)
            : DecoratedBox(
                decoration: BoxDecoration(shape: BoxShape.circle, color: color),
              ),
      ),
    );
  }
}
