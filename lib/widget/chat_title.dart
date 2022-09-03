import 'package:flutter/material.dart';
import 'package:shamo/theme.dart';

class Chattitle extends StatelessWidget {
  const Chattitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/detail-chat');
      },
      child: Container(
        margin: EdgeInsets.only(top: 33),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/icon_shop.png',
                  width: 54,
                ),
    
                SizedBox(
                  width: 12 ,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Text(
                      'Shoe Store',
                      style: primaryTextStyle.copyWith(
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      'Good Night This item is on',
                      style: secondaryTextStyle.copyWith(
                        fontWeight: light,
                      ),
                    )
                  ],
                            ),
                ),
              Text(
                'Now',
                style: secondaryTextStyle.copyWith(
                  fontSize: 10,
                ),
              )
              ],
            ),
            SizedBox(height: 12,),
            Divider(
              thickness: 1,
              color: Color(0xff2B2939),
            )
          ],
        ),
      ),
    );
  }
}