import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ui3travelapp/constants/constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //     backgroundColor: Colors.white,
      //     elevation: 0,
      //     iconTheme: IconThemeData(color: Colors.black),
      //     leading: Container(
      //         decoration: BoxDecoration(border: Border.all(color: grey1)),
      //         child: IconButton(
      //             onPressed: () {}, icon: Icon(Icons.arrow_back_ios)))),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: default_padding, vertical: default_padding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AppbarMainTopBar(),
                const Text(
                  "Discover Natural",
                  style: TextStyle(
                      fontSize: default_fontsize * 2.2,
                      fontWeight: FontWeight.w300,
                      color: textGrey),
                ),
                const Text(
                  "Beauty of the earth",
                  style: TextStyle(
                      fontSize: default_fontsize * 2.2,
                      fontWeight: FontWeight.w400,
                      color: textGreyDark),
                ),
                const SizedBox(
                  height: default_padding,
                ),
                const SearchBar(),
                const SizedBox(height: default_fontsize * 1.5),
                const SearchSortBar(),
                const SizedBox(height: default_padding * 1.5),
                const SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: LocationCardList()),
                const CategoryTitle(categoryTitle: "Categories"),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(children: [
                    IconButtonItem(
                        iconUrl: 'assets/icons/colosseum.png',
                        iconSubTitle: "Italy"),
                    IconButtonItem(
                        iconUrl: 'assets/icons/taj-mahal.png',
                        iconSubTitle: "India"),
                    IconButtonItem(
                        iconUrl: 'assets/icons/great-sphinx-of-giza.png',
                        iconSubTitle: "Egypt"),
                    IconButtonItem(
                        iconUrl: 'assets/icons/cathedral-of-saint-basil.png',
                        iconSubTitle: "Russia"),
                    IconButtonItem(
                        iconUrl: 'assets/icons/big-ben.png',
                        iconSubTitle: "London"),
                    IconButtonItem(
                        iconUrl: 'assets/icons/great-wall-of-china.png',
                        iconSubTitle: "China")
                  ]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class IconButtonItem extends StatelessWidget {
  const IconButtonItem({
    Key? key,
    required this.iconUrl,
    required this.iconSubTitle,
  }) : super(key: key);

  final String iconUrl;
  final String iconSubTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.only(right: default_padding),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: default_padding / 3),
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                  color: lightBlueGrey,
                  borderRadius: BorderRadius.circular(default_BRadius)),
              child: Padding(
                padding: const EdgeInsets.all(default_padding / 1.5),
                child: Image(
                    // fit: BoxFit.cover,
                    image: AssetImage(iconUrl)),
              ),
            ),
            Text(
              iconSubTitle,
              style: TextStyle(color: textGrey2),
            )
          ],
        ),
      ),
    );
  }
}

class CategoryTitle extends StatelessWidget {
  const CategoryTitle({
    Key? key,
    required this.categoryTitle,
  }) : super(key: key);

  final String categoryTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: default_padding, horizontal: default_padding / 1.5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            categoryTitle,
            style: TextStyle(
                fontWeight: FontWeight.w700, fontSize: default_fontsize * 1.2),
          ),
          Text(
            'See all',
            style:
                TextStyle(fontSize: default_fontsize / 1.2, color: textGrey2),
          ),
        ],
      ),
    );
  }
}

class LocationCardList extends StatelessWidget {
  const LocationCardList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        LocationViewCard(
            imageURL:
                'https://images.unsplash.com/photo-1464822759023-fed622ff2c3b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8bW91bnRhaW5zfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=600&q=60',
            title: 'Denver Mountains',
            location: 'Denver, Colorado'),
        LocationViewCard(
          imageURL:
              'https://images.unsplash.com/photo-1443632864897-14973fa006cf?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzJ8fG1vdW50YWluc3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=600&q=60',
          title: 'Rann of Kutch',
          location: 'Kutch, Gujarat',
          peoplereviewno: 8,
        ),
        LocationViewCardAssetImg(
            imageURL: 'assets/images/humayunstomb.jpg',
            title: "Humayunn's Tomb",
            location: 'Nizamuddin, India'),
        LocationViewCardAssetImg(
            imageURL: 'assets/images/dallake2.jpg',
            title: "Dal Lake",
            location: 'Jammu and Kashmir'),
      ],
    );
  }
}

class LocationViewCard extends StatelessWidget {
  const LocationViewCard({
    Key? key,
    required this.imageURL,
    required this.title,
    required this.location,
    this.peoplereviewno = 9.5,
  }) : super(key: key);

  final String imageURL;
  final String title;
  final String location;
  final double peoplereviewno;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: default_padding),
      width: MediaQuery.of(context).size.width * 0.7,
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.width * 0.5,
            width: MediaQuery.of(context).size.width * 0.7,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(default_BRadius),
                    topRight: Radius.circular(default_BRadius)),
                image: DecorationImage(
                    fit: BoxFit.cover, image: NetworkImage(imageURL))),
          ),
          Container(
            // height:
            // MediaQuery.of(context).size.height * 0.08,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(default_BRadius),
                  bottomRight: Radius.circular(default_BRadius),
                ),
                color: lightBlueGrey),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: default_padding, horizontal: default_padding / 1.5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  LocationAndTitleOnLocationCard(
                      title: title, location: location),
                  CircleAvatarOverlay(peoplereviewno: peoplereviewno)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class LocationViewCardAssetImg extends StatelessWidget {
  const LocationViewCardAssetImg({
    Key? key,
    required this.imageURL,
    required this.title,
    required this.location,
    this.peoplereviewno = 9.5,
  }) : super(key: key);

  final String imageURL;
  final String title;
  final String location;
  final double peoplereviewno;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: default_padding),
      width: MediaQuery.of(context).size.width * 0.7,
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.width * 0.5,
            width: MediaQuery.of(context).size.width * 0.7,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(default_BRadius),
                    topRight: Radius.circular(default_BRadius)),
                image: DecorationImage(
                    fit: BoxFit.cover, image: AssetImage(imageURL))),
          ),
          Container(
            // height:
            // MediaQuery.of(context).size.height * 0.08,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(default_BRadius),
                  bottomRight: Radius.circular(default_BRadius),
                ),
                color: lightBlueGrey),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: default_padding, horizontal: default_padding / 1.5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  LocationAndTitleOnLocationCard(
                      title: title, location: location),
                  CircleAvatarOverlay(peoplereviewno: peoplereviewno)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class AppbarMainTopBar extends StatelessWidget {
  const AppbarMainTopBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: default_padding * 1.5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          iconButton1(
              icondata: Icon(Icons.arrow_back_ios_new_rounded),
              onIconButtonTap: () {}),
          Text(
            "travello",
            style: Theme.of(context).textTheme.headline6,
          ),
          iconButton1(
              icondata: Icon(Icons.bookmark_add_outlined),
              onIconButtonTap: () {})
        ],
      ),
    );
  }
}

class CircleAvatarOverlay extends StatelessWidget {
  const CircleAvatarOverlay({
    Key? key,
    required this.peoplereviewno,
  }) : super(key: key);

  final double peoplereviewno;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 60,
          // height: 32,
          color: Colors.red,
        ),
        Positioned(
            child: CircleAvatar(
          backgroundImage: NetworkImage(
              'https://media.istockphoto.com/id/1371301907/photo/friendly-young-man-wearing-denim-shirt.jpg?b=1&s=170667a&w=0&k=20&c=uvclBOQrU3gd4_FMwzmTNK1PY4ydO_SlEgELJYj5mVI='),
          radius: 12,
        )),
        Positioned(
            left: 12,
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://img.freepik.com/free-photo/laughing-black-man-glasses-expressing-excitement-emotional-international-student-holding-computer_197531-20167.jpg'),
              radius: 12,
            )),
        Positioned(
            left: 24,
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://img.freepik.com/photos-gratuite/homme-afro-americain-utilisant-ordinateur-portable-pour-se-divertir_482257-17796.jpg'),
              radius: 12,
            )),
        Positioned(
            left: 36,
            child: CircleAvatarWithOpcity(peoplereviewno: peoplereviewno))
      ],
    );
  }
}

class CircleAvatarWithOpcity extends StatelessWidget {
  const CircleAvatarWithOpcity({
    Key? key,
    required this.peoplereviewno,
  }) : super(key: key);

  final double peoplereviewno;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundImage: NetworkImage(
        'https://www.diethelmtravel.com/wp-content/uploads/2016/04/bill-gates-wealthiest-person.jpg',
      ),
      radius: 12,
      backgroundColor: Color.fromRGBO(256, 256, 256, 1),
      foregroundColor: Colors.white,
      child: CircleAvatar(
          backgroundColor: Colors.black38,
          child: Text(
            '+$peoplereviewno k',
            style: TextStyle(
                color: Colors.white,
                fontSize: default_fontsize / 2,
                fontWeight: FontWeight.w900),
          )),
    );
  }
}

class LocationAndTitleOnLocationCard extends StatelessWidget {
  const LocationAndTitleOnLocationCard({
    Key? key,
    required this.title,
    required this.location,
  }) : super(key: key);

  final String title;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: default_fontsize * 1.1, fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.location_on_outlined,
              size: default_fontsize,
              color: textGrey,
            ),
            SizedBox(width: 4),
            Text(
              location,
              style: TextStyle(color: textGrey),
            )
          ],
        )
      ],
    );
  }
}

class SearchSortBar extends StatelessWidget {
  const SearchSortBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
                vertical: default_padding / 3, horizontal: default_padding),
            margin: EdgeInsets.only(right: default_padding),
            decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(default_BRadius)),
            child: Text(
              "All",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: default_fontsize * 1.05,
                  fontWeight: FontWeight.w500),
            ),
          ),
          SearchSortItem(
            text: "Popular",
          ),
          SearchSortItem(
            text: "Rating",
          ),
          SearchSortItem(
            text: "Most Viewed",
          ),
          SearchSortItem(
            text: "Recently Viewed",
          ),
        ],
      ),
    );
  }
}

class SearchSortItem extends StatefulWidget {
  const SearchSortItem({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  State<SearchSortItem> createState() => _SearchSortItemState();
}

class _SearchSortItemState extends State<SearchSortItem> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.only(right: default_padding * 1.5),
        child: Text(
          widget.text,
          style: TextStyle(
            color: textGreyDark,
          ),
        ),
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        suffixIcon: Icon(
          Icons.mic_none_outlined,
          color: grey1,
        ),
        prefixIcon: Icon(
          Icons.search,
          color: grey1,
        ),
        hintText: "Search",
        hintStyle: TextStyle(color: grey1),
        // focusColor: Colors.red,
        filled: true,
        fillColor: lightBlueGrey,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(default_BRadius),
            borderSide: BorderSide.none),
      ),
    );
  }
}

class iconButton1 extends StatelessWidget {
  const iconButton1({
    Key? key,
    required this.icondata,
    required this.onIconButtonTap,
  }) : super(key: key);

  final Icon icondata;
  final VoidCallback onIconButtonTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onIconButtonTap,
      child: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(default_BRadius),
              border: Border.all(color: grey2)),
          child: icondata),
    );
  }
}
