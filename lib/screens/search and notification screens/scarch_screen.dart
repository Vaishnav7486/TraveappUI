import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:ui3travelapp/constants/constants.dart';
import 'package:ui3travelapp/screens/home%20screen/homescreen.dart';

class SearchPlacesScreen extends StatelessWidget {
  SearchPlacesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.amber.shade100,
      body: SafeArea(
          child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: default_padding),
        child: Column(
          children: [
            SizedBox(height: default_padding),
            SearchBar(),
            SizedBox(height: default_padding / 2),
            CategoryTitle(categoryTitle: "Categories"),
            LocationCategoryIconCards(),
            SizedBox(height: default_padding),
            CategoryTitle(categoryTitle: "Popular Places"),
            ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: locationCardsInfoList.length,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {},
                child: ListTile(
                  selectedColor: Colors.green,
                  leading: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(default_BRadius / 2),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                locationCardsInfoList[index]['image_url']))),
                  ),
                  title: Text(
                    locationCardsInfoList[index]['place'],
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  subtitle: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        FluentIcons.star_24_filled,
                        size: default_fontsize,
                        color: Colors.amber,
                      ),
                      SizedBox(width: default_padding / 3),
                      Text(
                        locationCardsInfoList[index]['rating'].toString(),
                        style: TextStyle(
                            fontSize: default_fontsize / 1.3,
                            fontWeight: FontWeight.w900),
                      ),
                      SizedBox(width: default_padding / 3),
                      Text(
                        "(" +
                            locationCardsInfoList[index]['noOfrating']
                                .toString() +
                            ")",
                        style: TextStyle(
                          color: Colors.grey.shade400,
                          fontSize: default_fontsize / 1.4,
                        ),
                      ),
                    ],
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: default_fontsize,
                  ),
                ),
              ),
              separatorBuilder: (BuildContext context, int index) {
                return Divider(
                  color: Colors.transparent,
                );
              },
            ),
            SizedBox(height: default_padding * 2),
          ],
        ),
      )),
      // bottomNavigationBar: ,
    );
  }

  List<Map> locationCardsInfoList = [
    {
      "place": "Machu Pichu",
      "image_url":
          "https://www.intrepidtravel.com/adventures/wp-content/uploads/2018/06/1.-Intrepid-Travel-peru_machupicchu.jpg",
      "rating": 4.5,
      "noOfrating": 22500,
    },
    {
      "place": "The Grand Canyon",
      "image_url":
          "https://d3mvlb3hz2g78.cloudfront.net/wp-content/uploads/2011/06/thumb_720_450_Grand-Canyon_shutterstock_46192000.jpg",
      "rating": 4.2,
      "noOfrating": 17500,
    },
    {
      "place": "Masai Mara",
      "image_url":
          "https://imageio.forbes.com/specials-images/imageserve/623397ef8be47379246e9434/MAASAIMARA-190112-KBG7672/960x0.jpg?format=jpg&width=960",
      "rating": 4.5,
      "noOfrating": 91100,
    },
    {
      "place": "Istanbul",
      "image_url":
          "https://media.timeout.com/images/105859738/750/422/image.jpg",
      "rating": 4.9,
      "noOfrating": 78500,
    },
    {
      "place": "Rome",
      "image_url":
          "https://a.cdn-hotels.com/gdcs/production40/d811/5e89ad90-8f10-11e8-b6b0-0242ac110007.jpg?impolicy=fcrop&w=800&h=533&q=medium",
      "rating": 4.1,
      "noOfrating": 7500,
    },
    {
      "place": "The Great Wall",
      "image_url":
          "https://i.pinimg.com/600x315/e3/01/4c/e3014c526f28a67966e9827e72e873d5.jpg",
      "rating": 4.3,
      "noOfrating": 12020,
    },
    {
      "place": "Taj Mahal",
      "image_url":
          "https://www.makemytrip.com/travel-guide/media/dg_image/agra/1_Taj_Mahal.jpg",
      "rating": 4.8,
      "noOfrating": 79650,
    },
    {
      "place": "Petra",
      "image_url":
          "https://media.tacdn.com/media/attractions-splice-spp-674x446/0a/f4/c0/42.jpg",
      "rating": 4.8,
      "noOfrating": 24000,
    },
    {
      "place": "Himalayas",
      "image_url": "https://peakvisor.com/img/news/Himalayas-Kanchenjunga.jpg",
      "rating": 4.9,
      "noOfrating": 18500,
    },
    {
      "place": "Bora Bora",
      "image_url":
          "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1d/10/74/8b/bungalows-facing-mont.jpg?w=400&h=-1&s=1",
      "rating": 4.8,
      "noOfrating": 14600,
    },
  ];
}
