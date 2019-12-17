/// Ref: https://medium.com/flutter/managing-visibility-in-flutter-f558588adefe
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';

enum VisibilityFlag {
  visible,
  invisible,
  offscreen,
  gone,
}

class Visibility extends StatelessWidget {
  Visibility({
    @required this.child,
    @required this.visibility,
  }) : removedChild = Container();

  final VisibilityFlag visibility;
  final Widget child;
  final Widget removedChild;

  @override
  Widget build(BuildContext context) {
    if (visibility == VisibilityFlag.visible) {
      return child;
    } else if (visibility == VisibilityFlag.invisible) {
      return IgnorePointer(
        ignoring: true,
        child: Opacity(
          opacity: 0,
          child: child,
        ),
      );
    } else if (visibility == VisibilityFlag.offscreen) {
      return Offstage(
        offstage: true,
        child: child,
      );
    } else {
      // If gone, we replace child with a custom widget (defaulting to a
      // [Container] with no defined size).
      return removedChild;
    }
  }
}
