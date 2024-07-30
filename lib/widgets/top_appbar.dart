import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Row(
            children: [
              Icon(Icons.menu),
              // Icon(
              //   Icons.location_on_outlined,
              //   color: Color(0xFF00B3A1),
              //   size: 10,
              // ),
              // Text(
              //   'West Bengal, 700027',
              //   style: TextStyle(color: Color(0xFF626161), fontSize: 8),
              // )
            ],
          ),
          Image.asset(
            'assets/images/logo2.png',
            width: 100.0,
            alignment: Alignment.center,
          ),
          MaterialButton(
            onPressed: () {},
            padding: EdgeInsets.zero,
            minWidth: 20.0,
            child: Image.asset(
              'assets/images/profile_icon.png',
              width: 20.0,
              alignment: Alignment.center,
            ),
          )
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
