import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool hasAction;
  const CustomAppBar({
    Key? key,
    required this.title,
    this.hasAction = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Row(
        children: [
          Expanded(
            child: Image.asset(
              'assets/logo.png',
              height: 30,
            ),
          ),
          Expanded(
            flex: 2,
            child: hasAction
                ? Center(
                    child: Text(
                      title,
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  )
                : Text(
                    title,
                    style: Theme.of(context).textTheme.headline2,
                  ),
          ),
        ],
      ),
      actions: hasAction
          ? [
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/matches',
                  );
                },
                icon: Icon(
                  Icons.message,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/profile',
                  );
                },
                icon: Icon(
                  Icons.person,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ]
          : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
