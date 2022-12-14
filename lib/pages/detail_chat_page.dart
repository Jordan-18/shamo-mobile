import 'package:flutter/material.dart';
import 'package:shamo/theme.dart';
import 'package:shamo/widget/chat_buble.dart';

class DetailChatPage extends StatelessWidget {
  const DetailChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget header() { // ga bisa di panggil
      return PreferredSize(
         preferredSize: Size.fromHeight(70),
        child: AppBar(
          backgroundColor: backgroundColor1,
          centerTitle: false,
          title: Row(
            children: [
              Image.asset(
                'assets/online_logo.jpg',
                width: 50,
              ),
              SizedBox(
                width: 12,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Shoe Store',
                    style: primaryTextStyle.copyWith(
                      fontWeight: medium,
                      fontSize: 14,
                    ),
                  ),

                  Text(
                    'Online',
                    style: secondaryTextStyle.copyWith(
                      fontWeight: light,
                      fontSize: 14,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        );
    }

    Widget ProductPreview(){
      return Container(
        width:  255,
        height: 74,
        margin: EdgeInsets.only(bottom: 20),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: backgroundColor5,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: primaryColor,
          )
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                'assets/image_shoes.png',
                 width: 54,
                ),
             ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Text(
                  'COURT VISION...',
                  style: primaryTextStyle,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 2,),
                Text(
                  'Rp. 120.000',
                   style: priceTextStyle.copyWith(
                    fontWeight: medium,
                   ),
                ),
              ],
              ),
            ),
            Image.asset(
                'assets/button_close.png',
                width: 20,
              )
          ],
        ),
      );
    }
    
    Widget chatInput(){
      return Container(
        margin: EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductPreview(),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 40,
                    padding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color: backgroundColor4,
                      borderRadius: BorderRadius.circular(12)
                    ),
                    child: Center(
                      child: TextField(
                        decoration: InputDecoration.collapsed (
                          hintText: 'Type Message...',
                          hintStyle: subtitleTextStyle,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Image.asset(
                  'assets/button_send.png',
                  width: 45,
                  ),
              ],
            ),
          ],
        ),
      );
    }
    
    Widget content(){
      return ListView(
        padding: EdgeInsets.symmetric(
          horizontal: defaultMargin,
        ),
        children: [
          ChatBubble(
            isSender: true,
            text: "Halo, Apakah Barang ini masih ada ?",
            hasProduct: true ,
          ),
          ChatBubble(
            isSender: false,
            text: "Sebentar ya kami periksa terlebih dahulu. tunggu sebentar ya kak mohon bersabar",
          ),
        ],
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor3,

      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBar(
            backgroundColor: backgroundColor1,
            centerTitle: false,
            title: Row(
              children: [
                Image.asset(
                  'assets/online_logo.jpg',
                  width: 50,
                ),
                SizedBox(
                  width: 12,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Shoe Store',
                      style: primaryTextStyle.copyWith(
                        fontWeight: medium,
                        fontSize: 14,
                      ),
                    ),

                    Text(
                      'Online',
                      style: secondaryTextStyle.copyWith(
                        fontWeight: light,
                        fontSize: 14,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),

      bottomNavigationBar: chatInput(),

      body: content(),
    );
  }
}