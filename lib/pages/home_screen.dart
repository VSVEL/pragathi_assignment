import 'dart:convert';
import 'dart:isolate';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mqtt_client/mqtt_server_client.dart';
import 'package:prag_assignment/components/grid_view_comp.dart';
import 'package:prag_assignment/pages/notification_screen.dart';
import 'package:prag_assignment/services/theme.dart';
import 'package:flutter/material.dart';
import 'package:mqtt_client/mqtt_client.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {


  void getData() async {
    MqttServerClient  client = MqttServerClient('142.132.163.51','mqttx_ca175ac0');
    try {
      await client.connect();
      print('inside');
      client.subscribe('data/#', MqttQos.atLeastOnce);
      print('1');
      client.updates.listen((List<MqttReceivedMessage<MqttMessage>> data) {
        final MqttPublishMessage recMess = data[0].payload as MqttPublishMessage;
        final String payload = MqttPublishPayload.bytesToStringAsString(recMess.payload.message);
        print('Payload: $payload');
      });
    } catch (e) {
      print('Error connecting to MQTT broker: $e');
    }

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    getData();

    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedLabelStyle: AppTheme.primaryFont,
          selectedItemColor: AppTheme.primaryGreen,
          items: [
            BottomNavigationBarItem(
              icon: Image.asset('images/home.png'),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Image.asset('images/cart.png'),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Image.asset('images/order.png'),
              label: 'My Orders',
            ),
            BottomNavigationBarItem(
              icon: Image.asset('images/profile.png'),
              label: 'Profile',
            ),
          ],
        ),
        body: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.pin_drop_outlined,
                      color: AppTheme.primaryGreen,
                    ),
                    Text(
                      'ABCD,Delhi',
                      style: AppTheme.secondaryFont,
                    ),
                    Icon(
                      Icons.arrow_drop_down_outlined,
                      color: AppTheme.primaryGreen,
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Enter text',
                          suffixIcon: Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => NotificationScreen(),
                        ));
                      },
                      icon: Icon(
                        Icons.notifications_none_rounded,
                        color: Colors.red,
                        size: 45,
                      ),
                    ),
                    Image.asset('images/tag.png'),
                  ],
                ),
              ),
              Image.asset('images/today.png'),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Top Picks for you',
                    style: AppTheme.primaryFont,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Container(
                  child: CarouselSlider(
                    options: CarouselOptions(
                      aspectRatio: 2.0,
                      height: 160,
                      disableCenter: true,
                    ),
                    items: imageSliders,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Trending',
                    style: AppTheme.primaryFont,
                  ),
                  Text(
                    'See all',
                    style: AppTheme.primaryFont,
                  ),
                ],
              ),
              Container(
                height: 300,
                width: double.infinity,
                // Set a fixed height or adjust as needed
                child: GridView.builder(
                  scrollDirection: Axis.horizontal,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 0.5),
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    // return GridImage(
                    //   image: 'images/trending.png',
                    //   height: 88,
                    //   width: 254,
                    // );
                  },
                ),
              ),
              Row(
                children: [
                  Text(
                    'Craze Deals',
                    style: AppTheme.primaryFont,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Container(
                  child: CarouselSlider(
                    options: CarouselOptions(
                      aspectRatio: 2.0,
                      height: 160,
                      disableCenter: true,
                    ),
                    items: image2Sliders,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset('images/refer.png'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Nearby Stores',
                    style: AppTheme.primaryFont,
                  ),
                  Text(
                    'See all',
                    style: AppTheme.primaryFont,
                  ),
                ],
              ),
              Container(
                height: 300, // Set a fixed height or adjust as needed
                child: ListView.builder(
                  shrinkWrap: true, // Set shrinkWrap to true
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                    //   child: GridImage(
                    //     image: 'images/nearby_stores.png',
                    //     height: 120,
                    //     width: 383,
                    //   ),
                     );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.primaryGreen),
                    child: Text(
                      'View all stores',
                      style: GoogleFonts.quicksand(color: Colors.white,fontSize: 20),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

final List<Widget> imageSliders = [
  'images/discount.png',
  'images/discount.png',
]
    .map((item) => Container(
          margin: EdgeInsets.all(5.0),
          child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              child: Stack(
                children: <Widget>[
                  Image.asset(item, fit: BoxFit.cover, width: 1000.0),
                ],
              )),
        ))
    .toList();

final List<Widget> image2Sliders = [
  'images/craze_delas.png',
  'images/craze_delas.png',
]
    .map((item) => Container(
          child: Container(
            margin: EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                child: Stack(
                  children: <Widget>[
                    Image.asset(item, fit: BoxFit.cover, width: 1000.0),
                  ],
                )),
          ),
        ))
    .toList();



