import 'package:flutter/material.dart';
import 'package:shamo/theme.dart';

class EditProfilPage extends StatelessWidget {
  const EditProfilPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Widget header(){ // tidak bisa dipanggil
      return AppBar(
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        backgroundColor: backgroundColor1,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Edit Profil',
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.check,
              color: primaryColor,
            ),
            onPressed: () {}, 
          ),
        ],
      );
    }

    Widget nameInput(){
      return Container(
        margin: EdgeInsets.only(
          top: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name',
              style: secondaryTextStyle.copyWith(
                fontSize: 13, 
              ),
            ),
            TextFormField(
              style: primaryTextStyle,
              decoration: InputDecoration(
                hintText: 'Jordan Istiqlal',
                hintStyle: primaryTextStyle,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: subtitleColor)
                )
              ),
            ),
          ],
        ),
      );
    }

    Widget usernameInput(){
      return Container(
        margin: EdgeInsets.only(
          top: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Username',
              style: secondaryTextStyle.copyWith(
                fontSize: 13, 
              ),
            ),
            TextFormField(
              style: primaryTextStyle,
              decoration: InputDecoration(
                hintText: '@jordanistiqlal',
                hintStyle: primaryTextStyle,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: subtitleColor)
                )
              ),
            ),
          ],
        ),
      );
    }

    Widget emailInput(){
      return Container(
        margin: EdgeInsets.only(
          top: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Email',
              style: secondaryTextStyle.copyWith(
                fontSize: 13, 
              ),
            ),
            TextFormField(
              style: primaryTextStyle,
              decoration: InputDecoration(
                hintText: 'jordanistiqlal18@gmail.com',
                hintStyle: primaryTextStyle,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: subtitleColor)
                )
              ),
            ),
          ],
        ),
      );
    }

    Widget content(){
      return Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: defaultMargin
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              margin: EdgeInsets.only(
                top: defaultMargin,
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(
                    'assets/icon_profile.png',
                  ) 
                ),
              ),
            ),
            nameInput(),
            usernameInput(),
            emailInput()

          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor3,

      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.pushReplacementNamed(context, '/home');
            // Navigator.pop(context);
          },
          icon: Icon(Icons.close),
        ),
        backgroundColor: backgroundColor1,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Edit Profil',
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.check,
              color: primaryColor,
            ),
            onPressed: () {}, 
          ),
        ],
      ),
      
      body:content(),

      resizeToAvoidBottomInset: false,
    );
  }
}