# 基础
- 组件居中有 Container,Center,Align
- Textfield需要设置哪些属性才能实现无限换行和扩展高度 (expands,maxLines)
- 如何让图片重复堆叠容器？(repeat)
- 哪些组件可以使用属性控制child的显隐 (Visibility ,Offstage)
  1、Visibility中 visible属性为true可见,false不可见 ，即使不可见也会占用布局空间
  2、Offstage中 offstage属性为true不可见,false可见，子控件不可见，不会影响布局
- 如何正确的使用 setState ？
  1、点击按钮触发刷新实例中的变量 
  2、使用前判断mounted 是否为true
- AppBar标题居中 （centerTitle = true，Center组件包裹title）
- 滑动的组件有 ListView，GridView， SingleChildScrollView 
- 赋值操作符
  1、AA ?? “999”表示：AA如果为空，则显示999
  2、AA ??= “999”表示：AA如果为空，则给值设置为999
  3、AA ~/999表示：AA对于999整除
  4、A?.a表示：A如果为空则不调用，如果不为空则调用a值
  5、A?.a??”999”表示：A如果为空则不调用，如果不为空则调用a值，然后a值为空则显示999
- 容器无论设置多少都占整个屏幕的宽高，使用 UnconstrainedBox 解决 松约束
- 键盘弹出底部溢出如何解决？ （scaffold的 resizeToAvoidBottomPadding: false 让其遮挡布局；）
- Container 设置borderRadius 不生效.(使用裁切组件ClipRect)
- GestureDetector 设置onTap 不生效？ （GestureDetector的behavior: HitTestBehavior.translucent）
- 动态更改TabBar长度？ （DefaultTabController）
- 如何拦截App返回事件？（使用 WillPopScope 组件，通过返回值bool，判断是否是循序返回）
- 监听 app 的生命周期？ （使用WidgetsBindingObserver）
- 如何获取控件的大小和位置？
  1、通过key 拿到上下文取得 findRenderObject 拿到内筒的尺寸数据
  2、使用context取得 findRenderObject 拿到内筒的尺寸数据
- dart是值传递还是引用传递？ 
  dart是值传递，每次调用函数，传递过去的都是对象的内存地址，而不是这个对象的赋值
- dart的现成模型是如何执行的？
  Dart在单线程中是以 **消息循环机制** 包含两个任务队列（microtask queue，event queue），应用启动后首先会按照 先进后出的顺序 逐个执行微任务队列中的人物，当所有的任务执行完毕后开始执行
时间队列中的任务，事件任务执行完毕后再去执行微任务，如此往复。。
- Dart如何实现多任务并行？
  Dart中一个Isolate对象就是一个isolate执行环境的引用，通过当前的isolate控制其他的isolate完成之间的交互，使用sendPort相互之间发送消息，而
isolate也存在一个receiverPort来接受消息，创建isolate 可以使用Isolate.spawn来创建。
- 单订阅，多订阅的调用
  单订阅：只有一个订阅者，在订阅之前会持有数据，订阅者出现会把数据转交给它。
  多订阅，多个订阅者，在订阅之前会持有数据，订阅者出现会把数据转交给它。
- dart中mixin机制？
  为了解决继承方面的问题而引入的机制，dart支持多继承，mixin 定义的类不能有构造方法，避免多个类而产生的父类构造方法冲突，继承自 Object 。
- JIT 和 AOT 是什么？
  dart同时支持JIT和AOT语言之一，JIT在运行时即时编译，在开发中可以动态下发和执行代码，开发测试效率高，AOT提前吧编译，可直接执行二进制代码，
运行速度快，每次执行前都要提前编译，开发测试效率低
- Dart中内存分配和垃圾回收是怎样的？
  dart中内存分配策略，创建对象时只需要再堆上移动指针，内存长长始终是线性的，省去了查找可用内存的过程，并发是使用Isolate实现的，类似于线程
但是不会共享内存，独立运行 worker，这种机制可以让dart实现无所的快速分配。
  dart的垃圾回收，采用了多生代算法，新生代再回首内存时采用“半空间”机制，触发垃圾回收时，dart会将当前的半空间中的“活跃对象拷贝到备用空间”，
然后整体释放当前空间的所有内存，在护手的过程中，dart只需操作少量的"活跃"对象，没有引用大量未使用或“死亡”的对象则被忽略，这样的回收机制适合
flutter中大量对象的销毁重建。
- Flutter 和 Isolate 什么区别
  future是异步编程，调用本身立即返回，并在稍后的某个时候执行完成时再获得返回结果。在普通代码中可以使用await 等待一个异步调用结束。
isolate是并发编程，Dart有并发时的共享状态，所有Dart代码都在isolate中运行，包括最初的main()。每个isolate都有它自己的堆内存，
意味着其中所有内存数据，包括全局数据，都仅对该isolate可见，它们之间的通信只能通过传递消息的机制完成，消息则通过端口(port)收发。
isolate只是一个概念，具体取决于如何实现，比如在Dart VM中一个isolate可能会是一个线程，在Web中可能会是一个Web Worker.
# Flutter 
- Widget,Context,State 关系
  Widget在Flutter中几乎所有的东西都是widget，当需构建与布局直接使用widget。Widget是以树的结构进行组织，一旦创建就不能修改，ui状态变化后，会创建新的‘widget’反应变化
  State：定义了 StateFulWidget的实例行为，包含了用于“交互/干预”widget的行为和布局，State对象存储了随着用户交互的数据，当state对象的数据发生改变，相关的widget也会被重建反应变化
  Context：主要查找widget，获取主题数据，处理路由导航等，一个Context只属于一个widget，最终形成context树。
- StatefulState 生命周期？
  create：第一次插入widget树会被调用。
  initState：Widget初始化，不能获取到context。只会执行一次
  didChangeDependencies: 在initState后调用，state对象发生变化也会执行。
  build：在initState 和 didChangeDependencies之后调用，可能被调用多次，返回widget对象
- didUpdateWidget：在build之后调用，判断新的widget是否需要更新，处理新旧widget的差异，
  deactivate：当State被暂时从视图树中移除时会调用这个方法，页面切换时也会调用。类似 android 中的onPause。
  dispose：widget销毁时调用，释放资源，清理工作。
- 说下Widgets、RenderObjects 和 Elements的关系？
  widget：用于存储渲染所需的信息
  RenderObject：负责管理布局、绘制操作
  Element：控件树的实体
  Widget会被填充到Element中，并由Element管理底层的渲染树，widget通过setState来管理状态，Element会持有 RenderObject和widget的实例
 widget只是一个配置，RenderObject 负责管理布局、绘制等操作，若widget发生变化，新旧widget进行比较，更新element。
- Flutter如何与Android 、ios 通信？
  BasicMessageChannel：用于传递字符串和半结构化的信息。
  MethodChannel：用于传递方法调用。Flutter主动调用Native的方法，并获取相应的返回值。
  EventChannel：用于数据流（event streams）的通信。
- Flutter的热重载?
  FLutter热重载是基于JIT编译模式(动态编译)的代码增量同步,编译生成代码让Dart VM运行时解释.
  热重载的流程: 扫描工程改动、增量编译、推送更新、代码合并、widget重建。
  Flutter再收到代码变更后，并不会让App重新执行，只会触发widget树的重新绘制、由于涉及到状态的保存和恢复，兼容和状态初始化的场景，热重载是无法支持，
如：改动前后的widget状态无法兼容、全部变量、静态属性更改、main，initState方法内部修改、泛型修改。
- Flutter 和其他跨平台的本质区别？
  React Native 之类的框架，只是通过 JavaScript 虚拟机扩展调用系统组件，由 Android 和 iOS 系统进行组件的渲染；
  Flutter 则是自己完成了组件渲染的闭环。那么，Flutter 是怎么完成组件渲染的呢？这需要从图像显示的基本原理说起。
在计算机系统中，图像的显示需要 CPU、GPU 和显示器一起配合完成：CPU 负责图像数据计算，GPU 负责图像数据渲染，
而显示器则负责最终图像显示。CPU 把计算好的、需要显示的内容交给 GPU，由 GPU 完成渲染后放入帧缓冲区，
随后视频控制器根据垂直同步信号（VSync）以每秒 60 次的速度，从帧缓冲区读取帧数据交由显示器完成图像显示。
操作系统在呈现图像时遵循了这种机制，而 Flutter 作为跨平台开发框架也采用了这种底层方案。
  Flutter 绘制原理可以看到，Flutter 关注如何尽可能快地在两个硬件时钟的 VSync 信号之间计算并合成视图数据，然后通过 Skia 
交给 GPU 渲染：UI 线程使用 Dart 来构建视图结构数据，这些数据会在 GPU 线程进行图层合成，随后交给 Skia 引擎加工成 GPU 数据，
而这些数据会通过 OpenGL 最终提供给 GPU 渲染。
- Flutter中 GlobalKey、LocalKey、UniqueKey、ObjectKey 区别？
  GlobalKey: 全局唯一标识，常用于Navigator中，用于在不同页面之间传递状态或数据，以及在整个应用程序中管理全局状态。
  LocalKey：在同一个widget本地表示，区分不同的widget。
  UniqueKey：是LocalKey的一种特殊形式，它确保在同一Widget树中具有唯一性。
  ObjectKey：是LocalKey的一种具体实现，它使用Dart对象作为标识符，用于在同一Widget树中标识和区分不同的Widget。
- Navigator是什么？
  负责管理维护页面堆栈的导航器，Navigator.of(context)，会使用context来向上遍历Element树，找到MaterialApp提供的_NavigatorState再调用其push/pop方法完成导航操作。
- Flutter是怎么完成组件渲染的？
  组件渲染通过“Reconciliation”协调的机制完成的，用来比较新旧widget并确定更新ui的过程。
  1、widget树的构建：flutter应用启动时会构建一个初始的widget树、通过build方法构建。
  2、渲染第一帧：Flutter框架在第一帧中将widget树渲染成屏幕上的视图，包括 RenderObject，接着将RenderObject转为屏幕上的实际绘图
  3、用户交互触发：当用户与应用程序交互时，如：点击按钮，滑动屏幕等交互会使widget的状态变化。
  4、setState触发更新：刷新widget 数据。
- 统一管理错误页面
```flutter
  ErrorWidget.builder = (FlutterErrorDetails flutterErrorDetails) {
    debugPrint(flutterErrorDetails.toString());
    return new Center(child: new Text("App错误，快去反馈给作者!"));
  };
```
- PlatformView 原理？
  Flutter 中通过 PlatformView 可以嵌套原生 View 到 Flutter UI 中。
  使用了类似副屏显示的技术，VirtualDisplay 类代表一个虚拟显示器，调用 DisplayManager 的 createVirtualDisplay() 方法，
将虚拟显示器的内容渲染在一个 Surface 控件上，然后将 Surface 的 id 通知给 Dart，让 engine 绘制时，在内存中找到对应的 Surface 
画面内存数据，然后绘制出来。 实时控件截图渲染显示技术。
- Flutter 的 Debug 和 release 分别是在什么模式下运行的?
  Flutter 的 Debug 下是 JIT 模式，release下是AOT模式。
- flutter run  实际走了那学命令？
  flutter build apk：通过gradle来构建APK
  adb install：安装APK
  adb am start：启动应用
- setState工作原理？
  setState 其实是调用了 markNeedsBuild ，该方法内部标记此Element 为 Dirty ，然后在下一帧 WidgetsBinding.drawFrame 才会被绘制， setState 并不是立即生效的。

- Flutter应用启动runApp(MyApp)过程是怎么样的？
  Flutter 中 runApp 启动入口其实是一个 WidgetsFlutterBinding ，它主要是通过 BindingBase 的子类 GestureBinding  、
ServicesBinding  、 SchedulerBinding  、PaintingBinding  、SemanticsBinding  、 RendererBinding  、WidgetsBinding 等,
通过 mixins 的组合而成的

- Dart虚拟机如何管理的？怎么调用？如何跟Flutter引擎交互？
  Dart虚拟机拥有自己的Isolate，完全由虚拟机自己管理的，Flutter引擎也无法直接访问。Dart的UI相关操作，是由Root Isolate通过Dart的C++调用，
或者是发送消息通知的方式，将UI渲染相关的任务提交到UIRunner执行，这样就可以跟Flutter引擎相关模块进行交互。

- Isolate组成部分有哪些？分别有什么作用？
  1、isolate堆是运该isolate中代码分配的所有对象的GC管理的内存存储；
  2、vm isolate是一个伪isolate，里面包含不可变对象，比如null，true，false；
  3、isolate堆能引用vm isolate堆中的对象，但vm isolate不能引用isolate堆；
  4、isolate彼此之间不能相互引用 每个isolate都有一个执行dart代码的Mutator  thread，一个处理虚拟机内部任务(比如GC, JIT等)的helper thread；
- 线程和isolate的关系是什么？
  1、同一个线程在同一时间只能进入一个isolate，当需要进入另一个isolate则必须先退出当前的isolate；
  2、一次只能有一个Mutator线程关联对应的isolate，Mutator线程是执行Dart代码并使用虚拟机的公共的C语言API的线程；
- flutter 图片记载流程？
  1、AssetBundle 加载图片： Flutter 中的图片通常作为应用的资源进行管理，这些资源包含在应用的 AssetBundle 中。在 Flutter 应用启动时，这些资源会被加载到内存中。
  2、Image Widget 创建： 要在界面上显示图片，你需要使用 Image Widget。Image Widget 可以从不同的来源加载图片，包括网络、文件系统、内存、以及应用资源等。
  3、ImageProvider 创建： Image Widget 使用 ImageProvider 对象来管理图片的加载。不同的 ImageProvider 子类可以用于加载不同来源的图片，例如 AssetImage 用于加载应用资源中的图片，NetworkImage 用于从网络加载图片。
  4、缓存检查： 在加载图片之前，Flutter 会首先检查内存中的图片缓存。如果图片已经被加载过，且尚未被释放，则直接使用缓存中的图片数据，从而提高性能。
  5、图片解码： 如果图片不在缓存中，Flutter 将进行图片解码。图片解码是将图片文件的二进制数据转换为可用于显示的像素数据的过程。
  6、显示图片： 一旦图片被解码，Flutter 就会将其显示在界面上。这涉及到使用渲染对象（RenderObject）将像素数据绘制到屏幕上。
  7、图片的缓存和管理： Flutter 提供了一些工具和机制来管理图片的缓存，以及处理图片加载的性能优化。例如，可以使用 ImageCache 对象来手动管理图片缓存，以及使用 FadeInImage Widget 在加载图片时显示淡入效果，提升用户体验。
- JIT 运行模式中 kernel（内核） service
  该 service是一个 isolate 辅助类 Isolate，核心CFE将dart转为kernel二进制文件，然后直接使用二进制文件再isoalte中运行。
- GestureDector底层实现
  原理：GestureDetector对原始的触摸事件进行处理，识别用户的手势，触发对应的回到函数，涉及到 RenderBox 和命中测试（HitTest），RenderBox是Flutter中处理渲染的基本单位，而命中测试用于确定触摸事件是否命中了特定的区域。
当用户触摸屏幕时，触摸事件传递给应用程序的根“RenderBox”，GestureDetector会在这个阶段进行命中测试来判断那个组件被触摸到，若是命中了特定的组件，
会开始对触摸事件进行手势识别，如：点击，滑动，缩放等手势，接着会回到对应的函数， onTap，onDoubleTap等事件，若是有多个Gesturedetector可以通过 GestureArea来进行分发手势事件
- setState在哪种场景下可能会失效？
  1、刷新方法内的声明变量
  2、刷新被final修饰的变量
- isolate是怎么进行通信的？实例化过程是怎么样的？
  通过消息传递来完成，通过 Isolate.spawn 函数可以创建一个新的 Isolate，该函数是新的Isolate入口
```agsl
Isolate.spawn(entryPoint, message);
```
entryPoint是新Isolate的入口函数，message是要传递给新Isolate的消息。
ReceivePort和SendPort： 在Isolate之间建立通信时，通常使用ReceivePort和SendPort来创建消息通道。ReceivePort用于监听接收消息，而SendPort用于发送消息。
```agsl
// 在主Isolate中创建ReceivePort
ReceivePort receivePort = ReceivePort();

// 获取主Isolate的SendPort
SendPort sendPort = receivePort.sendPort;

// 在新Isolate中监听消息
Isolate.spawn(isolateEntryPoint, sendPort);

```
发送和接收消息： Isolate之间可以通过SendPort发送消息，然后通过ReceivePort监听并接收消息。
```agsl
// 在新Isolate的入口函数中接收消息
void isolateEntryPoint(SendPort sendPort) {
  // 监听消息
  ReceivePort receivePort = ReceivePort();
  sendPort.send(receivePort.sendPort);

  // 处理接收到的消息
  receivePort.listen((message) {
    // 处理消息
  });
}

```
总体来说，Isolate的实例化过程涉及创建新Isolate、指定入口函数和建立通信通道。Isolate之间的通信则通过消息传递机制完成。
这种隔离模型允许在不同的Isolate中执行代码，提高了并发性和应用程序的性能。

