import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shamo/theme.dart';

class Productpage extends StatefulWidget {
  @override
  State<Productpage> createState() => _ProductpageState();
}

class _ProductpageState extends State<Productpage> {
  List images = ['assets/image_shoes.png','assets/image_shoes.png','assets/image_shoes.png'];

  List familiarshoes = ['assets/image_shoes.png','assets/image_shoes.png','assets/image_shoes.png','assets/image_shoes.png','assets/image_shoes.png','assets/image_shoes.png','assets/image_shoes.png'];

  int currentIndex = 0;
  bool isWishlist = true;

  @override
  Widget build(BuildContext context) {

    Future<void> showSuccessDialog(){
      return showDialog(
        context: context, 
        builder:  (BuildContext context) => Container(
          width: MediaQuery.of(context).size.width - (2*defaultMargin),
          child: AlertDialog(
            backgroundColor: backgroundColor3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.close,
                        color: primaryTextColor,
                      ),
                    ),
                  ),
                  Image.asset(
                    'assets/Icon_success.png',
                    width: 100,
                    ),
                  SizedBox(height: 12,),
                  Text(
                    'Hurray :)',
                    style: primaryTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: semibold,
                    ),
                  ),
                  SizedBox(height: 12,),
                  Text(
                    'Item Added Successfuly',
                    style: secondaryTextStyle,
                  ),
                  SizedBox(height: 20,),
                  Container(
                    width: 154,
                    height: 44,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                          context, 
                          '/cart', 
                          (route) => false
                        );
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: primaryColor, 
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)
                        )
                      ),
                      child: Text(
                        'View May Cart',
                        style: primaryTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: medium,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      );
    }

    Widget indicator(int index){
      return Container(
        width: currentIndex == index ? 16 : 4,
        height: 4,
        margin: EdgeInsets.symmetric(
          horizontal: 2,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: currentIndex == index ? primaryColor : Color(0xffC4C4C4)
        ),
      );
    }

    Widget header(){

      int index = -1;

      return Column(
        children: [
          Container(
            margin: EdgeInsets.only(
              top: 20,
              left: defaultMargin,
              right: defaultMargin,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.chevron_left
                  ),
                ),
                Icon(
                  Icons.shopping_bag,
                  color: backgroundColor1,
                  )
              ],
            ),
          ),
          CarouselSlider(
            items: images.map(
                (image) => Image.asset(
                  image,
                  width: MediaQuery.of(context).size.width,
                  height: 310,
                  fit: BoxFit.cover,
                )).toList(), 
            options: CarouselOptions(
              initialPage: 0,
              onPageChanged: (index, reason) {
                setState(() {
                  currentIndex = index;
                });
              }
            ),
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: images.map((e){
              index++;
              return indicator(index);
            }).toList(),
          )
        ],
      );
    }

    Widget familiarshoescard(String imageUrl){
      return Container(
        width: 54,
        height: 54,
        margin: EdgeInsets.only(
          right: 16,
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imageUrl)
          ),
          borderRadius: BorderRadius.circular(6)
        ),
      );
    }

    Widget content(){

      int index = -1;

      return Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: 17),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(24),
          ),
          color: backgroundColor1,
        ),
        child: Column(
          children: [
            // NOTE : Header
            Container(
              margin: EdgeInsets.only(
                top: defaultMargin,
                left: defaultMargin,
                right: defaultMargin
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'TERREX URBAN LOW',
                          style: primaryTextStyle.copyWith(
                            fontSize: 18,
                            fontWeight: semibold
                          ),
                        ),
                        Text(
                          'Hiking',
                          style: secondaryTextStyle.copyWith(
                            fontSize: 12,
                          ),
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        isWishlist = !isWishlist;
                      });

                      if(isWishlist){
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: secondaryColor,
                            content: 
                            Text(
                              'Has been added to the Whitelist',
                              textAlign: TextAlign.center,
                            )
                          )
                        );
                      }else{
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: alertColor,
                            content: 
                            Text(
                              'Has been removed from the Whitelist',
                              textAlign: TextAlign.center,
                            )
                          )
                        );
                      }
                      
                    },
                    child: Image.asset(
                      isWishlist 
                      ? 'assets/button_wishlist_blue.png' 
                      : 'assets/button_wishlist.png',
                      width: 46,
                    ),
                  ) 
                ],
              ),
            ),

            // NOTE: Price
            Container(
              margin: EdgeInsets.only(
                top: 20,
                left: defaultMargin,
                right: defaultMargin
              ),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: backgroundColor2,
                borderRadius: BorderRadius.circular(4)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Price Starts From',
                    style: primaryTextStyle,
                  ),
                  Text(
                    'Rp. 120.000',
                    style: priceTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semibold
                    ),
                  )
                ],
              ),
            ),

            // Note : Description
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(
                top: defaultMargin,
                left: defaultMargin,
                right: defaultMargin
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start ,
                children: [
                  Text(
                    'Description',
                    style: primaryTextStyle.copyWith(
                      fontWeight: medium
                    ),
                  ),
                  SizedBox(height: 12,),
                  Text(
                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                    style: subtitleTextStyle.copyWith(
                      fontWeight: light
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),

            // Note : Familiar Shoes

            Container(
              width: double.infinity,
              margin: EdgeInsets.only(
                top: defaultMargin,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:  EdgeInsets.symmetric(
                      horizontal: defaultMargin
                    ),
                    child: Text(
                      'Fimiliar Shoes',
                      style: primaryTextStyle.copyWith(
                        fontWeight: medium,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: familiarshoes
                          .map((image){
                            index++;
                            return Container(
                              margin: EdgeInsets.only(
                                left: index == 0 ? defaultMargin : 0
                              ),
                              child: familiarshoescard(image)
                              );
                          }).toList(),
                    ),
                  )
                ],
              ),
            ),

            // Note : Buttons
            Container(
              width: double.infinity,
              margin: EdgeInsets.all(defaultMargin),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/detail-chat');
                    },
                    child: Container(
                      width: 54,
                      height: 54,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/button_chat.png',
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 16,),
                  Expanded(
                    child: Container(
                      height: 54,
                      child: TextButton(
                        onPressed: (){
                          showSuccessDialog();
                        },
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)
                          ),
                          backgroundColor: primaryColor
                        ),
                        child: Text(
                          'Add to Card',
                          style: primaryTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: semibold,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      );
    }
    
    return Scaffold(
      backgroundColor: backgroundColor6,
      body: ListView(
        children: [
          header(),
          content()
        ],
      )
    );
  }
}