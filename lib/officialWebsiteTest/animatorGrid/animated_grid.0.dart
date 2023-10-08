import 'package:flutter/material.dart';
import 'package:flutter_demo_application/officialWebsiteTest/animatorList/animated_list.0.dart';

void main() {
  runApp(const AnimatedGridSample());
}

class AnimatedGridSample extends StatefulWidget {
  const AnimatedGridSample({super.key});

  @override
  State<AnimatedGridSample> createState() => _AnimatedGridSampleState();
}

typedef RemovedItemBuilder<T> = Widget Function(
    T item, BuildContext context, Animation<double> animation);

class ListModel<E> {
  ListModel(
      {required this.listKey,
      required this.removedItemBuilder,
      Iterable<E>? initItems})
      : _items = List<E>.from(initItems ?? <E>[]);

  final GlobalKey<AnimatedGridState> listKey;
  final RemovedItemBuilder<E> removedItemBuilder;
  final List<E> _items;

  AnimatedGridState? get _animatedGrid => listKey.currentState;

  void insert(int index, E item) {
    _items.insert(index, item);
    _animatedGrid?.insertItem(index,
        duration: const Duration(milliseconds: 500));
  }

  E removeAt(int index) {
    final E removeItem = _items.removeAt(index);
    _animatedGrid?.removeItem(
        index,
        (context, animation) =>
            removedItemBuilder(removeItem, context, animation));
    return removeItem;
  }

  int get length => _items.length;

  E operator [](index) => _items[index];

  int indexOf(E item) {
    return _items.indexOf(item);
  }
}

class _AnimatedGridSampleState extends State<AnimatedGridSample> {
  final GlobalKey<AnimatedGridState> _globalKey = GlobalKey();
  late ListModel<int> _listModel;
  int? _selectItem;
  late int nextItem;

  void _insert() {
    final int index = _selectItem == null
        ? _listModel.length
        : _listModel.indexOf(_selectItem!);
    setState(() {
      _listModel.insert(index, nextItem++);
    });
  }

  void _remove() {
    if (_selectItem != null) {
      setState(() {
        _listModel.removeAt(_listModel.indexOf(_selectItem!));
        _selectItem = null;
      });
    } else {
      if (_listModel.length > 0) {
        setState(() {
          _listModel.removeAt(_listModel.length - 1);
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _listModel = ListModel(
        listKey: _globalKey,
        removedItemBuilder: _removeBuilder,
        initItems: <int>[0, 1, 2, 3, 4, 5, 6]);
    nextItem = _listModel.length;
  }

  Widget _removeBuilder(
      int item, BuildContext context, Animation<double> animation) {
    return CustomCardItem(
      animation: animation,
      item: item,
      removing: true,
    );
  }

  Widget _buildBuilder(
      BuildContext context, int index, Animation<double> animation) {
    return CustomCardItem(
      animation: animation,
      item: index,
      selected: _selectItem == _listModel[index],
      onTap: () {
        setState(() {
          _selectItem =
              _selectItem != _listModel[index] ? _listModel[index] : null;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "AnimatorGridDemo",
            style: TextStyle(fontSize: 30.0),
          ),
          leading: IconButton(
            icon: Icon(Icons.remove_circle),
            iconSize: 32,
            onPressed: _remove,
            tooltip: 'remove the selected item',
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.add_circle),
              iconSize: 32,
              onPressed: _insert,
              tooltip: 'insert the selected item',
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(8.0),
          child: AnimatedGrid(
            key: _globalKey,
            itemBuilder: _buildBuilder,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 100.0,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
            ),
            initialItemCount: _listModel.length,
          ),
        ),
      ),
    );
  }
}

class CustomCardItem extends StatelessWidget {
  final Animation<double> animation;
  final VoidCallback? onTap;
  final int item;
  final bool selected;
  final bool removing;

  const CustomCardItem(
      {required this.animation,
      this.onTap,
      required this.item,
      this.selected = false,
      this.removing = false});

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.headlineMedium!;
    if (selected) {
      textStyle = textStyle.copyWith(color: Colors.lightGreenAccent[400]);
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ScaleTransition(
        scale: CurvedAnimation(
            parent: animation,
            curve: removing ? Curves.easeOut : Curves.easeIn),
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: onTap,
          child: SizedBox(
            height: 80,
            child: Card(
              color: Colors.primaries[item % Colors.primaries.length],
              child: Center(
                child: Text('${item + 1}', style: textStyle),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
