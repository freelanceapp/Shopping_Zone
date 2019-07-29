import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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
    _getCurrentUser () async {
      mCurrentUser = await _auth.currentUser();
      setState(() {
        mCurrentUser.displayName != null ? accountStatus = 'Signed In' : 'Not Signed In';
      });

        print('Hello ' + mCurrentUser.displayName.toString());
        print('Email ' + mCurrentUser.email.toString());

    }
      @override
      Widget build(BuildContext context) {

        return new Scaffold(
          appBar: new AppBar(
            title: new Text("Shopping Zone"),
            centerTitle: true,
            backgroundColor: Colors.blue,
            actions: <Widget>[
              new IconButton(
                  icon: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  onPressed: () {}),
              new IconButton(
                  icon: Icon(
                    Icons.shopping_cart,
                    color: Colors.white,
                  ),
                  onPressed: () {})
            ],
          ),
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
                      color: Colors.black,
                    ),
                  ),
                  decoration: new BoxDecoration(color: Colors.blue),
                ),
                InkWell(
                  onTap: () {},
                  child: ListTile(
                    title: Text('Home Page'),
                    leading: Icon(
                      Icons.home,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: ListTile(
                    title: Text('My Account'),
                    leading: Icon(
                      Icons.account_circle,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: ListTile(
                    title: Text('My Orders'),
                    leading: Icon(
                      Icons.shopping_basket,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: ListTile(
                    title: Text('Categoris'),
                    leading: Icon(
                      Icons.dashboard,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: ListTile(
                    title: Text('Favourites'),
                    leading: Icon(
                      Icons.favorite,
                    ),
                  ),
                ),
                Divider(
                  color: Colors.blue,
                  height: 10.0,
                ),
                InkWell(
                  onTap: () {},
                  child: ListTile(
                    title: Text('Settings'),
                    leading: Icon(
                      Icons.settings,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: ListTile(
                    title: Text('About'),
                    leading: Icon(
                      Icons.help,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: ListTile(
                      title: Text('SignOut'),
                      leading: Icon(
                        Icons.exit_to_app,
                      ),
                      onTap: () {
                        signOut();
                        Navigator.of(context).pushReplacement(
                            new MaterialPageRoute(
                                builder: (
                                    BuildContext context) => new LoginPage()));
                      }
                  ),
                ),
              ],
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

