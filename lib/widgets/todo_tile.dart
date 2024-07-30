import 'package:flutter/material.dart';
import 'package:todo/constants/constants.dart';

class TodoTile extends StatelessWidget {
  const TodoTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.05),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.6,
            padding: const EdgeInsets.only(left: 10, top: 5),
            height: 100,
            decoration: const BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.all(Radius.circular(15))),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Title: ${10 + 10}'),
                Text('Description: ${10 + 10}'),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.2,
            height: 100,
            // padding: const EdgeInsets.only(left: 10),
            alignment: Alignment.center,
            decoration: const BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.all(Radius.circular(15))),
            child: Transform.rotate(
              angle: -90 * (3.1415927 / 180),
              child: const Text(
                'In Progress',
                style: TextStyle(
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                  // backgroundColor: Colors.red,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
