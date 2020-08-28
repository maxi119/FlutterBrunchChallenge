import 'package:flutter/material.dart';
import 'package:flutter_brunch_challenge/const.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Text(
              Wording.homePageName,
              style: TextStyle(
                fontSize: 36,
                color: Colors.lime.shade100,
              ),
            ),
            decoration: BoxDecoration(color: Colors.deepOrange.shade200),
          ),
          ListTile(
            title: Text('小挑戰們',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                )),
            leading: Icon(
              Icons.assistant_photo,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
