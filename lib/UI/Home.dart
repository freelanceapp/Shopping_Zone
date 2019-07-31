import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart';
import 'package:shopping_zone/UI/Auth.dart';
import 'package:shopping_zone/UI/login_page.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomeState();
  }
}

class HomeState extends State<Home> {
  String accountStatus = '******';
  FirebaseUser mCurrentUser;
  FirebaseAuth _auth;
  @override
  void initState() {
    super.initState();
    _auth = FirebaseAuth.instance;
    _getCurrentUser();
  }

  _getCurrentUser() async {
    mCurrentUser = await _auth.currentUser();
    print('Hello ' + mCurrentUser.displayName.toString());
    print('Email ' + mCurrentUser.email.toString());
    setState(() {
      mCurrentUser != null ? accountStatus = 'Signed In' : 'Not Signed In';
      print(accountStatus);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: new AppBar(
            title: new Text("Shopping Zone"),
            centerTitle: true,
            backgroundColor: Color(0xFFFFD500),
            actions: <Widget>[
              new IconButton(
                  icon: Icon(
                    Icons.search,
                    color: Color(0xFFFFD500),
                  ),
                  onPressed: () {}),
              new IconButton(
                  icon: Icon(
                    Icons.shopping_cart,
                    color: Color(0xFFFFD500),
                  ),
                  onPressed: () {})
            ],
            bottom: TabBar(tabs: [
              Tab(
                text: 'Categories',
              ),
              Tab(
                text: 'New Added',
              ),
              Tab(
                text: 'Offers',
              ),
            ]),
          ),
          body: Categorieslist(),
          drawer: new Drawer(
            child: new ListView(
              children: <Widget>[
                new UserAccountsDrawerHeader(
                  accountName: Text("Name: " + mCurrentUser.displayName),
                  accountEmail: Text("Email: " + mCurrentUser.email),
                  currentAccountPicture: new CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.person,
                      color: Color(0xFFFFD500),
                    ),
                  ),
                  decoration: new BoxDecoration(
                      color: Colors.amber.shade300,
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: ListTile(
                    title: Text('Home Page'),
                    leading: Icon(
                      Icons.home,
                      color: Color(0xFFFFD500),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: ListTile(
                    title: Text('My Account'),
                    leading: Icon(
                      Icons.account_circle,
                      color: Color(0xFFFFD500),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: ListTile(
                    title: Text('My Orders'),
                    leading: Icon(
                      Icons.shopping_basket,
                      color: Color(0xFFFFD500),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: ListTile(
                    title: Text('Categories'),
                    leading: Icon(
                      Icons.dashboard,
                      color: Color(0xFFFFD500),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: ListTile(
                    title: Text('Favourites'),
                    leading: Icon(
                      Icons.favorite,
                      color: Color(0xFFFFD500),
                    ),
                  ),
                ),
                Divider(
                  color: Color(0xFFFFD500),
                  height: 10.0,
                ),
                InkWell(
                  onTap: () {},
                  child: ListTile(
                    title: Text('Settings'),
                    leading: Icon(
                      Icons.settings,
                      color: Color(0xFFFFD500),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: ListTile(
                    title: Text('About'),
                    leading: Icon(
                      Icons.help,
                      color: Color(0xFFFFD500),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: ListTile(
                      title: Text('SignOut'),
                      leading: Icon(
                        Icons.exit_to_app,
                        color: Colors.red,
                      ),
                      onTap: () {
                        signOut();
                        Navigator.of(context).pushReplacement(
                            new MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    new LoginPage()));
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // SignOut Current User
  signOut() async {
    FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
    _firebaseAuth.signOut();
  }
}

class Categorieslist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: 230.0,
              horizontal: 50.0
      ),
      child:
        ListView(
          scrollDirection: Axis.horizontal,
           children: <Widget>[
            Container(
              alignment: Alignment.bottomCenter,
              height: 100.0,
              width: 100.0,
              color: Colors.green,
            ),
            Container(
              height: 100.0,
              width: 100.0,
              color: Colors.blue,
            ),
            Container(
              height: 100.0,
              width: 100.0,
              color: Colors.yellow,
            ),
            Container(
              height: 100.0,
              width: 100.0,
              color: Colors.purpleAccent,
            ),
          ],
        ),
    );
  }
}

class NewItemsList extends StatelessWidget {
  final String title;
  NewItemsList({this.title});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        children: <Widget>[
          ListTile(
            //leading: Icon(),
            title: Text('Item 1'),
            onTap: () {},
          ),
          ListTile(
            //leading: Icon(),
            title: Text('Item 2'),
            onTap: () {},
          ),
          ListTile(
            //leading: Icon(),
            title: Text('Item 3'),
            onTap: () {},
          ),
          ListTile(
            //leading: Icon(),
            title: Text('Item 4'),
            onTap: () {},
          ),
          ListTile(
            //leading: Icon(),
            title: Text('Item 5'),
            onTap: () {},
          ),
          ListTile(
            //leading: Icon(),
            title: Text('Item 6'),
            onTap: () {},
          ),
          ListTile(
            //leading: Icon(),
            title: Text('Item 7'),
            onTap: () {},
          ),
          ListTile(
            //leading: Icon(),
            title: Text('Item 8'),
            onTap: () {},
          ),
          ListTile(
            //leading: Icon(),
            title: Text('Item 9'),
            onTap: () {},
          ),
          ListTile(
            //leading: Icon(),
            title: Text('Item 10'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class OffersList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      scrollDirection: Axis.vertical,
      crossAxisCount: 2,
      children: List.generate(100, (index) {
        return Center(
          child: Container(
            height: 200,
            width: 200,
            color: Colors.grey[200],
            child: Center(
              child: Text(
                'Item $index',
                style: Theme.of(context).textTheme.headline,
              ),
            ),
          ),
        );
      }),
    );
  }
}
