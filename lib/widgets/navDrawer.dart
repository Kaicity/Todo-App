import 'package:flutter/material.dart';
import 'package:todo_apps/constants/colors.dart';

//Tao Navbar thanh menu 
class NavDrawSideMenu extends StatelessWidget {
  const NavDrawSideMenu ({Key? key}) : super(key : key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: tdBGColor,
      child: ListView(
        children: <Widget>[
          // const DrawerHeader(
          //   child: Text('Nguyen Minh Thong',
          //   style: TextStyle(color: Colors.white, fontSize: 25),
          //   ),
          //   decoration: BoxDecoration(
          //     color: Colors.green,
          //     image: DecorationImage(
          //       fit: BoxFit.fill,
          //       image: AssetImage('assets/images/carol-hu-j50aeDzf92g-unsplash.jpg')
          //     )
          //   ),
          // ),
          new UserAccountsDrawerHeader(
            accountName: Text('Nguyễn Minh Thông'),
            accountEmail: Text('ITMIX'),

            // currentAccountPicture: CircleAvatar(
            //   backgroundImage: AssetImage('assets/images/129463228_1044323955974046_7436598048619044227_n.jpg'),
            // ),

            currentAccountPicture: ClipOval(
              child: Image.asset('assets/images/129463228_1044323955974046_7436598048619044227_n.jpg',
                fit: BoxFit.cover,
                width: 80.0,
                height: 80.0,
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.green,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/carol-hu-j50aeDzf92g-unsplash.jpg'),   
              )
            ),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('About me'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.history),
            title:  Text('History working time'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Setting'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.logout_outlined),
            title:  Text('Logout'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.info),
            title:  Text('Info'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

