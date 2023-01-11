import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ui3travelapp/constants/constants.dart';
import 'package:ui3travelapp/screens/home%20screen/homescreen.dart';

class LocationSelectedScreen extends StatelessWidget {
  const LocationSelectedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            child: Column(
          children: [
            SizedBox(height: default_padding / 1.5),
            ImageCardL(),
            NameLocAndRatingProductView(),
            DetailsCommentsReviews(),
            DetailsTextContent(),
            Container(
              height: 80,
              width: MediaQuery.of(context).size.width,
              color: grey1,
              padding: EdgeInsets.symmetric(horizontal: default_padding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            "Trip Price",
                            style: TextStyle(
                                fontSize: default_fontsize,
                                color: textGrey,
                                fontWeight: FontWeight.w300),
                          ),
                          Text('\$1350.00')
                        ],
                      ),
                      Container(
                        height: 40,
                        width: 200,
                        color: Colors.red,
                        child: Center(child: Text('Book Now')),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        )),
      ),
    );
  }
}

class DetailsTextContent extends StatelessWidget {
  const DetailsTextContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: default_padding, vertical: default_padding * 1.5),
      child: Text(
        """Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
        At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio.
        Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.""",
        style: TextStyle(
            fontSize: default_fontsize,
            color: textGrey,
            fontWeight: FontWeight.w300),
      ),
    );
  }
}

class DetailsCommentsReviews extends StatelessWidget {
  const DetailsCommentsReviews({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: default_padding, vertical: default_padding / 2),
      child: Row(
        children: [
          textbuttonwithpaddingSelected(
            text: "Details",
          ),
          textbuttonwithpadding(
            text: "Comments",
          ),
          textbuttonwithpadding(
            text: "Reviews",
          ),
        ],
      ),
    );
  }
}

class textbuttonwithpaddingSelected extends StatelessWidget {
  const textbuttonwithpaddingSelected({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: default_padding),
      padding: EdgeInsets.symmetric(
          vertical: default_padding / 1.8, horizontal: default_padding / 1.2),
      decoration: BoxDecoration(
          color: grey2,
          borderRadius: BorderRadius.circular(default_BRadius / 2)),
      child: Text(
        text,
        style:
            TextStyle(fontSize: default_fontsize, fontWeight: FontWeight.w600),
      ),
    );
  }
}

class textbuttonwithpadding extends StatelessWidget {
  const textbuttonwithpadding({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: default_padding * 1.5,
      ),
      child: Text(
        text,
        style: TextStyle(
            color: textGrey,
            fontSize: default_fontsize,
            fontWeight: FontWeight.w300),
      ),
    );
  }
}

class NameLocAndRatingProductView extends StatelessWidget {
  const NameLocAndRatingProductView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: default_padding, vertical: default_padding * 1.2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Denver Mountains",
                style: TextStyle(
                    fontSize: default_fontsize * 1.7,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87),
              ),
              SizedBox(height: default_padding / 3),
              RichText(
                  text: TextSpan(children: [
                WidgetSpan(
                    child: Icon(
                  Icons.location_on_outlined,
                  size: default_fontsize,
                  color: textRed,
                )),
                TextSpan(
                    text: "Denver, Colorado",
                    style: TextStyle(
                        color: textRed, fontSize: default_fontsize / 1.2))
              ]))
            ],
          ),
          Row(
            children: [
              Icon(
                Icons.star,
                color: Colors.amber.shade500,
              ),
              SizedBox(width: default_padding / 2),
              Column(
                children: [
                  Text(
                    '4.9/5',
                    style: TextStyle(
                        fontSize: default_fontsize * 1.2,
                        fontWeight: FontWeight.w300,
                        color: Colors.amber.shade500),
                  ),
                  Text(
                    "(17,500)",
                    style: TextStyle(
                        fontSize: default_fontsize / 1.5,
                        // fontWeight: FontWeight.w600,
                        color: textGrey2),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

class ImageCardL extends StatelessWidget {
  const ImageCardL({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: default_padding),
          height: MediaQuery.of(context).size.height * 0.6,
          decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/Tajmahal.jpg')
                //  NetworkImage(
                //     'https://images.unsplash.com/photo-1464822759023-fed622ff2c3b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8bW91bnRhaW5zfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=600&q=60'),
                ),
            borderRadius: BorderRadius.circular(default_BRadius * 1.8),
          ),
          alignment: Alignment.bottomCenter,
          padding: EdgeInsets.only(bottom: default_padding),
          child: LocationFlightDestinationcard(),
        ),
        Positioned(
          top: default_padding,
          left: default_padding * 2,
          child: iconButtonTransparent(
            iconname: Icons.arrow_back_ios_new_rounded,
            iconcolor: Colors.white,
            onButtonPressed: () {},
          ),
        ),
        Positioned(
          top: default_padding,
          right: default_padding * 2,
          child: iconButtonTransparent(
            iconname: Icons.favorite_border_outlined,
            iconcolor: Colors.red,
            onButtonPressed: () {},
          ),
        ),
      ],
    );
  }
}

class LocationFlightDestinationcard extends StatelessWidget {
  const LocationFlightDestinationcard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: default_padding),
      child: Container(
        alignment: Alignment.center,
        height: 80,
        decoration: BoxDecoration(
            color: Colors.black38,
            borderRadius: BorderRadius.circular(default_BRadius)),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: default_padding,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: default_padding / 1.2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Location",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: default_fontsize,
                          fontWeight: FontWeight.w200),
                    ),
                    SizedBox(height: default_padding / 4),
                    Text(
                      "New York",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: default_fontsize * 1.2,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              verticalLineSeperatorL48(),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: default_padding / 1.2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Flight Rest",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: default_fontsize,
                          fontWeight: FontWeight.w200),
                    ),
                    SizedBox(height: default_padding / 4),
                    Text(
                      "Chikago",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: default_fontsize * 1.2,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              verticalLineSeperatorL48(),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: default_padding / 1.2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Destination",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: default_fontsize,
                          fontWeight: FontWeight.w200),
                    ),
                    SizedBox(height: default_padding / 4),
                    Text(
                      "Denver",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: default_fontsize * 1.2,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class verticalLineSeperatorL48 extends StatelessWidget {
  const verticalLineSeperatorL48({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: 1,
      color: Colors.white,
    );
  }
}

class iconButtonTransparent extends StatelessWidget {
  const iconButtonTransparent({
    Key? key,
    required this.iconname,
    required this.iconcolor,
    required this.onButtonPressed,
  }) : super(key: key);

  final IconData iconname;
  final Color iconcolor;
  final VoidCallback onButtonPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onButtonPressed,
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
            color: Colors.black38,
            borderRadius: BorderRadius.circular(default_BRadius)),
        child: Icon(
          iconname,
          color: iconcolor,
        ),
      ),
    );
  }
}
