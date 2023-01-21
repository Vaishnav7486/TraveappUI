import 'package:flutter/material.dart';
import 'package:hidable/hidable.dart';
import 'package:ui3travelapp/constants/constants.dart';

class LocationSelectedScreen extends StatelessWidget {
  LocationSelectedScreen({super.key});

  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final productpxd1 = ModalRoute.of(context)?.settings.arguments as Map;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              children: [
                SizedBox(height: default_padding / 1.5),
                ImageCardL(
                  productpdx1: productpxd1["imageURL"],
                  destination: productpxd1["destination"],
                  flightRest: productpxd1["flightRest"],
                  location: productpxd1["location"],
                ),
                NameLocAndRatingProductView(
                  site: productpxd1["site"],
                  destination: productpxd1["destination"],
                  destinationM: productpxd1["destinationM"],
                  noOfRating: productpxd1["noOfRating"],
                  rating: productpxd1["rating"],
                ),
                DetailsCommentsReviews(),
                DetailsTextContent(
                  description: productpxd1["Description"],
                ),
              ],
            )),
      ),
      bottomNavigationBar: Hidable(
        controller: scrollController,
        preferredWidgetSize: Size.fromHeight(90),
        child: Container(
          height: 50,
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.symmetric(
            vertical: default_padding * 1.2,
          ),
          padding: EdgeInsets.symmetric(horizontal: default_padding * 1.5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Trip Price",
                        style: TextStyle(
                            fontSize: default_fontsize / 1.2,
                            color: textGrey,
                            fontWeight: FontWeight.w300),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "\$" + productpxd1["tripPrice"].toString(),
                        style: TextStyle(
                            fontSize: default_fontsize * 1.5,
                            fontWeight: FontWeight.w800),
                      )
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed("SearchFlightScreen",
                          arguments: productpxd1);
                    },
                    child: Container(
                      // margin: EdgeInsets.only(right: default_padding / 1.5),
                      height: 50,
                      width: 180,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: primaryULight,
                                offset: Offset(0, 5),
                                spreadRadius: 5,
                                blurRadius: 5)
                          ],
                          color: primaryColor,
                          borderRadius:
                              BorderRadius.circular(default_BRadius / 2)),
                      child: Center(
                          child: Text(
                        'Book Now',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: default_fontsize * 1.1),
                      )),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class DetailsTextContent extends StatelessWidget {
  const DetailsTextContent({
    Key? key,
    required this.description,
  }) : super(key: key);
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: default_padding, vertical: default_padding * 1.5),
      child: Text(
        description,
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
          color: Colors.grey.shade200,
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
    required this.site,
    required this.destination,
    required this.destinationM,
    required this.rating,
    required this.noOfRating,
  }) : super(key: key);

  final String site;
  final String destination;
  final String destinationM;
  final double rating;
  final int noOfRating;

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
                site,
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
                    text: "$destination, $destinationM",
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
                    '$rating/5',
                    style: TextStyle(
                        fontSize: default_fontsize * 1.1,
                        fontWeight: FontWeight.w300,
                        color: Colors.amber.shade500),
                  ),
                  Text(
                    "($noOfRating)",
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
    required this.productpdx1,
    required this.location,
    required this.flightRest,
    required this.destination,
  }) : super(key: key);

  final String productpdx1;
  final String location;
  final String flightRest;
  final String destination;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: default_padding),
          height: MediaQuery.of(context).size.height * 0.6,
          decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover, image: NetworkImage(productpdx1)
                //  NetworkImage(
                //     'https://images.unsplash.com/photo-1464822759023-fed622ff2c3b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8bW91bnRhaW5zfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=600&q=60'),
                ),
            borderRadius: BorderRadius.circular(default_BRadius * 1.8),
          ),
          alignment: Alignment.bottomCenter,
          padding: EdgeInsets.only(bottom: default_padding),
          child: LocationFlightDestinationcard(
              destination: destination,
              flightRest: flightRest,
              location: location),
        ),
        Positioned(
          top: default_padding,
          left: default_padding * 2,
          child: iconButtonTransparent(
            iconname: Icons.arrow_back_ios_new_rounded,
            iconcolor: Colors.white,
            onButtonPressed: () {
              Navigator.of(context).pop();
            },
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
    required this.location,
    required this.flightRest,
    required this.destination,
  }) : super(key: key);

  final String location;
  final String flightRest;
  final String destination;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: default_padding),
      alignment: Alignment.center,
      height: 80,
      // width: 300,
      // width: media,
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
            Expanded(
              child: Container(
                padding: EdgeInsets.only(
                    left: default_padding / 1.5, right: default_padding / 2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Location",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: default_fontsize / 1.1,
                          fontWeight: FontWeight.w200),
                    ),
                    SizedBox(height: default_padding / 4),
                    Text(
                      location,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: default_fontsize,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ),
            verticalLineSeperatorL48(),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: default_padding / 2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Flight Rest",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: default_fontsize / 1.1,
                          fontWeight: FontWeight.w200),
                    ),
                    SizedBox(height: default_padding / 4),
                    Text(
                      flightRest,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: default_fontsize,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ),
            verticalLineSeperatorL48(),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(
                    right: default_padding / 1.5, left: default_padding / 2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Destination",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: default_fontsize / 1.1,
                          fontWeight: FontWeight.w200),
                    ),
                    SizedBox(height: default_padding / 4),
                    Text(
                      destination,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: default_fontsize,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ),
          ],
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
