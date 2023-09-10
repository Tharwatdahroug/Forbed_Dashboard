import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: const Text("Hello Friend!"),
            automaticallyImplyLeading: false,
          ),
          const Divider(),
          const ListTile(
            title: Text('Shop'),
            leading: Icon(Icons.shop),
            // onTap: () {
            //   Navigator.of(context).pushReplacementNamed('/');
            // },
          ),
          const Divider(),
          const ListTile(
            title: Text('Order'),
            leading: Icon(Icons.payment),
            // onTap: () {
            //   Navigator.of(context)
            //       .pushReplacementNamed(Order_Screen.routename);
            // },
          ),
          const Divider(),
          const ListTile(
            title: Text('Manager Product'),
            leading: Icon(Icons.edit),
            // onTap: () {
            //   Navigator.of(context).pushReplacementNamed(UserProduct.routename);
            // },
          ),
          const Divider(),
          const ListTile(
            title: Text('Logout'),
            leading: Icon(Icons.exit_to_app),
            // onTap: () {
            //   Navigator.of(context).pop();
            //   Navigator.of(context).pushReplacementNamed('/');
            //   Provider.of<Auth>(context, listen: false).logout();
            // },
          ),
        ],
      ),
    );
  }
}
