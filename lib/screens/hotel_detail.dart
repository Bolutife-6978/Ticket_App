import 'package:flutter/material.dart';
import 'package:ticket_app/base/utils/app_json.dart';

class HotelDetail extends StatefulWidget {
  const HotelDetail({super.key});

  
  @override
  State<HotelDetail> createState() => _HotelDetailState();
}

class _HotelDetailState extends State<HotelDetail> {

  late int hotelIndex=0;

  @override
  void didChangeDependencies() {
    if(ModalRoute.of(context)!.settings.arguments!=null){
      var args =ModalRoute.of(context)!.settings.arguments as Map;
      hotelIndex = args["index"];
    }
    super.didChangeDependencies();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300.0,
            floating: false,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset("assets/images/${hotelList[hotelIndex]['image']}"),
              title: Text(hotelList[hotelIndex]["place"]) ,
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
             Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(hotelList[hotelIndex]["destination"]),
            ),
            const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  "More Images",
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                )),
            Container(
              height: 200.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
                        margin: EdgeInsets.all(8),
                        child: Image.asset("assets/images/${hotelList[hotelIndex]['image']}"));
                  }),
            )
          ]))
        ],
      ),
    );
  }
}
