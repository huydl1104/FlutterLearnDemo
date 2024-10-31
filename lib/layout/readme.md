### Scrollable 用于管理一个维度中的滚动，并通知查看内容的视口
1、ListView 视图，这是一种常用的滚动视图，显示 滚动，子小部件的线性列表。
2、PageView 视图，它是子小部件的滚动列表，每个子小部件都是 视区的大小。
3、GridView，这是一个显示滚动的 2D 数组的滚动视图 的子小部件。
4、CustomScrollView 滚动视图，这是创建自定义滚动的滚动视图 使用条子的效果。
5、SingleChildScrollView，这是一个可滚动的小部件，具有单个 孩子。
6、ScrollNotification 和 NotificationListener，可用于观看 不使用滚动控制器的滚动位置。
### Offstage 将子组件像在树中一样展开，但不绘制任何内容，不使子组件可用于命中测试，也不占用父组件的任何空间。创建可视地隐藏其子部件的小部件。
### FittedBox 根据适合度对其子在自身内部进行缩放和定位

### MethodChannel、EventChannel、BasicMessageChannel 是Flutter中用于实现Flutter和原生代码之间通信的不同通道类型。它们提供了不同的方式来处理方法调用、事件通知和消息传递。以下是对这些通道的详细解释：


#### MethodChannel:

MethodChannel 用于在Flutter应用程序和原生代码之间进行双向方法调用。Flutter可以向原生发送请求，并等待原生的响应。这通常用于调用原生代码中的方法，如访问设备传感器、调用相机、执行文件操作等。

使用 MethodChannel，Flutter可以将方法调用传递给原生方法，并接收返回值。原生代码也可以使用 MethodChannel 向Flutter发送数据。

在Flutter中创建 MethodChannel：

````
MethodChannel _channel = MethodChannel('channel_name');
````
Flutter向原生发送请求并接收响应：
````
var result = await _channel.invokeMethod('method_name', arguments);
````
原生代码接收Flutter请求并发送响应：

````
_channel.setMethodCallHandler((call) async {
if (call.method == 'method_name') {
// 处理请求并返回结果
return result;
}
});
````
EventChannel:用于从原生代码向Flutter应用程序发送事件通知。这通常用于将原生事件（例如传感器数据、系统事件等）传递到Flutter应用程序中。

使用 EventChannel，原生代码可以向Flutter发送流式事件，而Flutter应用程序可以订阅这些事件并处理它们。

在Flutter中创建 EventChannel：

````
EventChannel _channel = EventChannel('channel_name');
````

Flutter订阅事件：

````
StreamSubscription subscription = _channel.receiveBroadcastStream().listen((event) {
// 处理事件
});
````
原生代码发送事件通知：

````
// 在适当的时候发送事件
_channel.send(eventData);
````
BasicMessageChannel:

BasicMessageChannel 用于在Flutter应用程序和原生代码之间传递简单消息。它支持双向通信，并允许传递任何类型的消息。

使用 BasicMessageChannel，您可以传递数据、JSON对象等。

在Flutter中创建 BasicMessageChannel：

````
BasicMessageChannel<dynamic> _channel = BasicMessageChannel('channel_name', StandardMessageCodec());
````
Flutter发送消息：

````
_channel.send(message);
````
原生代码接收消息：

````
_channel.setMessageHandler((message) async {
// 处理消息并返回结果
return result;
});
````
原生代码也可以使用 BasicMessageChannel 向Flutter发送消息。
这些通道提供了不同级别的灵活性和功能，您可以根据项目需求来选择适合的通道类型。通常，MethodChannel 用于方法调用，EventChannel 用于事件通知，而 BasicMessageChannel 用于简单消息传递。这些通道使Flutter与原生代码之间的通信变得相对容易，同时提供了不同的数据传输方式。





