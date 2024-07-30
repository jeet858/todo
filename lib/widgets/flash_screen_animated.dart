import 'dart:async';
import 'package:flutter/material.dart';

class FlashScreenAnimatedList extends StatefulWidget {
  const FlashScreenAnimatedList({super.key});

  @override
  State<FlashScreenAnimatedList> createState() =>
      _FlashScreenAnimatedListState();
}

class _FlashScreenAnimatedListState extends State<FlashScreenAnimatedList> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  final List<Widget> _items = [
    Center(
      child: Image.asset(
        'assets/images/logo.png',
        height: 100,
      ),
    ),
    const Center(
      child: Text(
        'DELIVERING TO',
        style: TextStyle(fontSize: 14, color: Colors.black),
      ),
    ),
    const Center(
      child: Text(
        'Chetla Central Rd, West Bengal, 700027',
        style: TextStyle(fontSize: 14, color: Colors.black),
      ),
    )
  ];
  final List<Widget> _displayedItems = [];
  int _nextItem = 0;

  @override
  void initState() {
    super.initState();
    _addItemsWithDelay();
  }

  void _addItemsWithDelay() {
    Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (_nextItem < _items.length) {
        _displayedItems.insert(_nextItem, _items[_nextItem]);
        _listKey.currentState!
            .insertItem(_nextItem, duration: const Duration(milliseconds: 500));
        _nextItem++;
      } else {
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        color: Colors.transparent,
        height: 200,
        width: 400,
        child: AnimatedList(
          key: _listKey,
          initialItemCount: _displayedItems.length,
          itemBuilder: (context, index, animation) {
            return SizeTransition(
              sizeFactor: animation,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: _displayedItems[index],
              ),
            );
          },
        ),
      ),
    );
  }
}
