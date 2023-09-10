import 'package:flutter/material.dart';
import 'package:forbeddashboard/screens/categroy/categroyScreen.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color.fromRGBO(245, 138, 41, 1),
      child: ListView(
        children: [
          const DrawerHeader(
            child: Image(
              image: NetworkImage(
                  "https://www.forbed.com/web/image/website/1/arabic_logo/FORBED?unique=84dac83"),
              fit: BoxFit.cover,
            ),
          ),
          DrawerListTile(
            title: "  Dashboard",
            icon: Icon(Icons.dashboard),
            press: () {},
          ),
          DrawerListTile(
            title: "  Add Shop",
            icon: Icon(Icons.apps_sharp),
            press: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CategroyScreen()));
            },
          ),
          // DrawerListTile(
          //   title: "Add Category",
          //   svgSrc: "assets/icons/menu_task.svg",
          //   press: () {
          //     // Navigator.push(
          //     //     context, MaterialPageRoute(builder: (context) => Category()));
          //   },
          // ),
          // // AddProducts
          // DrawerListTile(
          //   title: "Add Products",
          //   svgSrc: "assets/icons/menu_doc.svg",
          //   press: () {
          //     Navigator.push(context,
          //         MaterialPageRoute(builder: (context) => AddProducts()));
          //   },
          // ),
          // DrawerListTile(
          //   title: "DisplayShop",
          //   svgSrc: "assets/icons/menu_store.svg",
          //   press: () {
          //     Navigator.push(context,
          //         MaterialPageRoute(builder: (context) => DisplayProducts()));
          //   },
          // ),
          // DrawerListTile(
          //   title: "Sponsored",
          //   svgSrc: "assets/icons/menu_notification.svg",
          //   press: () {
          //     Navigator.push(context,
          //         MaterialPageRoute(builder: (context) => Advertisment()));
          //   },
          // ),
          // DrawerListTile(
          //   title: "Profile",
          //   svgSrc: "assets/icons/menu_profile.svg",
          //   press: () {},
          // ),
          // DrawerListTile(
          //   title: "AddNewShop",
          //   svgSrc: "assets/icons/menu_profile.svg",
          //   press: () {
          //     Navigator.push(
          //         context, MaterialPageRoute(builder: (context) => Newshop()));
          //   },
          // ),
          // DrawerListTile(
          //   title: "Featured ",
          //   svgSrc: "assets/icons/menu_profile.svg",
          //   press: () {
          //     Navigator.push(
          //         context, MaterialPageRoute(builder: (context) => Featured()));
          //   },
          // ),
          // DrawerListTile(
          //   title: "Settings",
          //   svgSrc: "assets/icons/menu_setting.svg",
          //   press: () {},
          // ),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.icon,
    required this.press,
  }) : super(key: key);

  final String title;
  final Icon icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      focusColor: const Color.fromARGB(137, 0, 0, 0),
      onTap: press,
      horizontalTitleGap: 0.1,
      leading: icon,
      title: Text(
        title,
        style: TextStyle(color: const Color.fromARGB(137, 0, 0, 0)),
      ),
    );
  }
}
