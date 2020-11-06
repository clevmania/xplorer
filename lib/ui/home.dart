import 'package:explorer/constant.dart';
import 'package:explorer/models/Traveler.dart';
import 'package:explorer/models/User.dart';
import 'package:explorer/size_config.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: buildAppBar(),
      body: HomeLayout(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
          icon: Icon(Icons.menu, color: kIconColor), onPressed: () {}),
      actions: [
        IconButton(
            icon: ClipOval(child: Image.asset("assets/images/profile.png")),
            onPressed: () {})
      ],
    );
  }
}

class HomeLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      clipBehavior: Clip.none,
      child: Column(
        children: [
          HeadSection(),
          VerticalSpacing(of: getProportionateScreenWidth(60)),
          PopularPlaces(),
          VerticalSpacing(),
          TopTravelers()
        ],
      ),
    );
  }
}

class TopTravelers extends StatelessWidget {
  const TopTravelers({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(
          title: "Spotlight of Top Travelers",
          clickEvent: () {},
        ),
        VerticalSpacing(of: 20),
        Container(
          padding: EdgeInsets.all(
            getProportionateScreenWidth(24),
          ),
          margin: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(kDefaultPadding),
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [kDefualtShadow],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ...List.generate(
                topTravelers.length,
                (index) => UserCard(user: topTravelers[index]),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class UserCard extends StatelessWidget {
  const UserCard({
    Key key,
    @required this.user,
  }) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipOval(
          child: Image.asset(
            user.image,
            width: getProportionateScreenWidth(55),
            height: getProportionateScreenWidth(55),
            fit: BoxFit.cover,
          ),
        ),
        VerticalSpacing(of: 10),
        Text(
          user.name,
          style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600),
        )
      ],
    );
  }
}

class PopularPlaces extends StatelessWidget {
  const PopularPlaces({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(
          title: "Right at the Park",
          clickEvent: () {},
        ),
        VerticalSpacing(of: 20),
        SingleChildScrollView(
          clipBehavior: Clip.none,
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...List.generate(
                travelSpots.length,
                (index) => Padding(
                  padding:
                      EdgeInsets.only(left: getProportionateScreenWidth(20)),
                  child: PlaceCard(
                    travelSpot: travelSpots[index],
                    pressedEvent: () {},
                  ),
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(20),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class PlaceCard extends StatelessWidget {
  const PlaceCard(
      {Key key, @required this.travelSpot, @required this.pressedEvent})
      : super(key: key);

  final TravelSpot travelSpot;
  final GestureTapCallback pressedEvent;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getProportionateScreenWidth(137),
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 1.29,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                image: DecorationImage(
                  image: AssetImage(travelSpot.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Container(
            width: getProportionateScreenWidth(137),
            padding: EdgeInsets.all(
              getProportionateScreenWidth(kDefaultPadding),
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [kDefualtShadow],
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Column(
              children: [
                Text(
                  travelSpot.name,
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                ),
                VerticalSpacing(
                  of: 10,
                ),
                Travelers(
                  users: travelSpots[0].users,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class Travelers extends StatelessWidget {
  const Travelers({Key key, @required this.users}) : super(key: key);

  final List<User> users;

  @override
  Widget build(BuildContext context) {
    int totalUser = 0;
    return SizedBox(
      width: double.infinity,
      height: getProportionateScreenWidth(30),
      child: Stack(
        children: [
          ...List.generate(
            users.length,
            (index) {
              totalUser++;
              return Positioned(
                  left: (22 * index).toDouble(),
                  child: buildTravelersAvatar(index));
            },
          ),
          Positioned(
            left: (22 * totalUser).toDouble(),
            child: SizedBox(
                height: getProportionateScreenWidth(28),
                width: getProportionateScreenWidth(28),
                child: FlatButton(
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  color: kPrimaryColor,
                  onPressed: () {},
                  child: Icon(Icons.add, color: Colors.white),
                )),
          ),
        ],
      ),
    );
  }

  ClipOval buildTravelersAvatar(int index) {
    return ClipOval(
      child: Image.asset(
        travelSpots[0].users[index].image,
        width: getProportionateScreenWidth(28),
        height: getProportionateScreenWidth(28),
        fit: BoxFit.cover,
      ),
    );
  }
}

class HeadSection extends StatelessWidget {
  const HeadSection({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      overflow: Overflow.visible,
      alignment: Alignment.center,
      children: [
        Image.asset(
          "assets/images/home_bg.png",
          height: getProportionateScreenWidth(315),
          fit: BoxFit.cover,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: getProportionateScreenWidth(70),
            ),
            Text(
              "Travelers",
              style: TextStyle(
                  fontSize: getProportionateScreenWidth(73),
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  height: 0.5),
            ),
            Text(
              "Travel Community App",
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
        Positioned(
            bottom: getProportionateScreenWidth(-25), child: SearchField())
      ],
    );
  }
}

class SectionTitle extends StatelessWidget {
  const SectionTitle({Key key, @required this.title, @required this.clickEvent})
      : super(key: key);

  final String title;
  final GestureTapCallback clickEvent;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(kDefaultPadding),
      ),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(
                color: Colors.black,
                fontSize: getProportionateScreenWidth(16),
                fontWeight: FontWeight.bold),
          ),
          Spacer(),
          GestureDetector(
            child: Text(
              "See All",
            ),
            onTap: clickEvent,
          )
        ],
      ),
    );
  }
}

class SearchField extends StatelessWidget {
  const SearchField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenWidth(50),
      width: getProportionateScreenWidth(313),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Color(0XFF3E4067)),
        boxShadow: [
          BoxShadow(
            offset: Offset(3, 3),
            blurRadius: 10,
            color: Colors.black.withOpacity(0.16),
            spreadRadius: -2,
          )
        ],
      ),
      child: TextField(
        onChanged: (value) {},
        decoration: InputDecoration(
          hintText: "Search your destination",
          hintStyle: TextStyle(
            color: Color(0XFF464A67),
            fontSize: getProportionateScreenWidth(14),
          ),
          suffixIcon: Icon(Icons.search),
          contentPadding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(kDefaultPadding),
            vertical: getProportionateScreenWidth(12),
          ),
        ),
      ),
    );
  }
}
