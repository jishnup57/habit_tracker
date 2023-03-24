import 'package:flutter/material.dart';
import 'package:habit_tracker_flutter/ui/task/task_compleation_ring.dart';

class AnimatedTask extends StatefulWidget {
  const AnimatedTask({Key? key}) : super(key: key);

  @override
  State<AnimatedTask> createState() => _AnimatedTaskState();
}

class _AnimatedTaskState extends State<AnimatedTask>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 750));
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        animationController.forward(from: 0);
      },
      onLongPressCancel: () {
        
      },
      child: AnimatedBuilder(
          animation: animationController,
          builder: (context, child) => TaskCompleationRing(progress: animationController.value)),
    );
  }
}
