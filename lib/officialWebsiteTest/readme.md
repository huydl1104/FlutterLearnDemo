### GestureDetector 参数详解
- child：这是 GestureDetector 包装的小部件，即当用户与包装的小部件交互时，手势检测器将捕获和处理手势事件。通常，您将在此处放置要响应手势事件的小部件。
- onTapDown: 手指按下时的回调函数
- onTapUp: 手指松开时的回调函数
- onTap: 当用户轻触小部件时触发的回调函数。通常，它在用户单击小部件时被调用。参数是一个不带参数的函数。
- onTapCancel: 手指取消点击时的回调函数
- onSecondaryTap,
- onSecondaryTapDown,
- onSecondaryTapUp,
- onSecondaryTapCancel,
- onTertiaryTapDown,
- onTertiaryTapUp,
- onTertiaryTapCancel,
- onDoubleTapDown,快速双击小部件时 手指按下时的回调函数
- onDoubleTap：当用户快速双击小部件时触发的回调函数。通常，它在用户双击小部件时被调用。参数是一个不带参数的函数。
- onDoubleTapCancel,
- onLongPressDown,
- onLongPressCancel,
- onLongPress：当用户长按小部件时触发的回调函数。通常，它在用户长按小部件时被调用。参数是一个不带参数的函数。
- onLongPressStart,
- onLongPressMoveUpdate：当用户长按小部件并移动手指时触发的回调函数。参数是一个带有 LongPressMoveUpdateDetails 对象的函数，该对象包含与移动手势相关的详细信息。
- onLongPressUp,
- onLongPressEnd：当用户长按小部件并结束手势时触发的回调函数。参数是一个带有 LongPressEndDetails 对象的函数，该对象包含与手势结束相关的详细信息。
- onSecondaryLongPressDown,
- onSecondaryLongPressCancel,
- onSecondaryLongPress,
- onSecondaryLongPressStart,
- onSecondaryLongPressMoveUpdate,
- onSecondaryLongPressUp,
- onSecondaryLongPressEnd,
- onTertiaryLongPressDown,
- onTertiaryLongPressCancel,
- onTertiaryLongPress,
- onTertiaryLongPressStart,
- onTertiaryLongPressMoveUpdate,
- onTertiaryLongPressUp,
- onTertiaryLongPressEnd,
- onVerticalDragDown：当用户按下并开始垂直拖动手势时触发的回调函数。参数是一个带有 DragDownDetails 对象的函数，该对象包含与拖动手势的起始位置相关的详细信息。
- onVerticalDragStart,
- onVerticalDragUpdate,
- onVerticalDragEnd：当用户垂直拖动手势结束时触发的回调函数。参数是一个带有 DragEndDetails 对象的函数，该对象包含与拖动手势结束相关的详细信息。
- onVerticalDragCancel,
- onHorizontalDragDown,
- onHorizontalDragStart：当用户开始水平拖动手势时触发的回调函数。参数是一个带有 DragStartDetails 对象的函数，该对象包含与拖动手势的起始信息。
- onHorizontalDragUpdate,
- onHorizontalDragEnd,
- onHorizontalDragCancel,
- onForcePressStart,
- onForcePressPeak,
- onForcePressUpdate,
- onForcePressEnd,
- onPanDown,
- onPanStart,
- onPanUpdate,
- onPanEnd,
- onPanCancel,
- onScaleStart,
- onScaleUpdate：当用户执行缩放手势时触发的回调函数。参数是一个带有 ScaleUpdateDetails 对象的函数，该对象包含与缩放手势的详细信息。
- onScaleEnd,
- behavior,
- excludeFromSemantics = false,
- dragStartBehavior = DragStartBehavior.start,
- supportedDevices,


