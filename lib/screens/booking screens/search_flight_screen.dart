import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ui3travelapp/constants/constants.dart';
import 'package:ui3travelapp/screens/home%20screen/homescreen.dart';

class SearchFlightScreen extends StatelessWidget {
  const SearchFlightScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productpxd1 = ModalRoute.of(context)?.settings.arguments as Map;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: default_padding),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            TopbarWithTitleAndBackButton(
              topbarTitle: "Search For Flights",
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: default_padding, horizontal: default_padding / 1.5),
              child: Text(
                "Details was fullfilled by your plan's selection",
                style: TextStyle(
                    color: textGrey,
                    fontWeight: FontWeight.w300,
                    fontSize: default_fontsize),
              ),
            ),
            Stack(
              alignment: Alignment.centerRight,
              children: [
                Column(
                  children: [
                    CustomTestFormField1(
                      hintText: "Enter Your Location",
                    ),
                    SizedBox(height: default_padding * 1.5),
                    CustomTestFormField1(
                      hintText: productpxd1["flightRest"],
                    )
                  ],
                ),
                Positioned(
                    right: default_padding,
                    child: CircleAvatar(
                      backgroundColor: primaryColor,
                      child: Icon(
                        Icons.import_export_rounded,
                        size: default_fontsize * 1.5,
                        color: Colors.white,
                      ),
                      radius: default_fontsize * 1.5,
                    ))
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: default_padding, horizontal: default_padding / 1.5),
              child: Text(
                "Date",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
            TextFormField(
              style: TextStyle(
                  fontSize: default_fontsize, fontWeight: FontWeight.w700),
              decoration: InputDecoration(
                  hintText: "Select Outward Date",
                  hintStyle: TextStyle(
                      fontSize: default_fontsize, fontWeight: FontWeight.w300),
                  contentPadding: EdgeInsets.symmetric(
                      vertical: default_padding * 1.2,
                      horizontal: default_padding),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(default_BRadius),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(default_BRadius)),
                  errorBorder: InputBorder.none,
                  disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(default_BRadius)),
                  filled: true,
                  fillColor: blueGrey,
                  suffixIcon: Icon(
                    Icons.calendar_month,
                    color: grey1,
                  )),
            ),
          ]),
        ),
      )),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed("FlightListScreen");
        },
        child: Container(
          margin: EdgeInsets.symmetric(
            vertical: default_padding * 2,
            horizontal: default_padding * 2,
          ),
          width: MediaQuery.of(context).size.width,
          height: 60,
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(default_BRadius),
          ),
          child: Center(
              child: Text(
            "Search Flights",
            style: TextStyle(
                fontSize: default_fontsize * 1.1,
                fontWeight: FontWeight.w600,
                color: Colors.white),
          )),
        ),
      ),
    );
  }
}

class CustomTestFormField1 extends StatefulWidget {
  const CustomTestFormField1({
    Key? key,
    required this.hintText,
  }) : super(key: key);

  final String hintText;

  @override
  State<CustomTestFormField1> createState() => _CustomTestFormField1State();
}

class _CustomTestFormField1State extends State<CustomTestFormField1> {
  TextEditingController dateInput = TextEditingController();

  @override
  void initState() {
    dateInput.text = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2101));
        if (pickedDate != null) {
          print(pickedDate);
          // String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
        }
      },
      style: TextStyle(fontSize: default_fontsize, fontWeight: FontWeight.w700),
      decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: TextStyle(
              fontSize: default_fontsize, fontWeight: FontWeight.w700),
          contentPadding: EdgeInsets.symmetric(
              vertical: default_padding * 1.2, horizontal: default_padding),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(default_BRadius),
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(default_BRadius)),
          errorBorder: InputBorder.none,
          disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(default_BRadius)),
          filled: true,
          fillColor: blueGrey),
    );
  }
}

class TopbarWithTitleAndBackButton extends StatelessWidget {
  const TopbarWithTitleAndBackButton({
    Key? key,
    required this.topbarTitle,
  }) : super(key: key);

  final String topbarTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: default_padding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          iconButton1(
              icondata: Icon(Icons.arrow_back_ios_new_rounded),
              onIconButtonTap: () {
                Navigator.of(context).pop();
              }),
          Text(
            topbarTitle,
            style: TextStyle(
                fontSize: default_fontsize * 1.2, fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: 50,
            width: 50,
          )
        ],
      ),
    );
  }
}
