import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/helpers.dart';
import 'package:vegan_liverpool/models/restaurant/menuItem.dart';

class DetailMenuItemView extends StatefulWidget {
  const DetailMenuItemView({Key? key, required this.menuItem})
      : super(key: key);

  final MenuItem menuItem;

  @override
  _DetailMenuItemViewState createState() => _DetailMenuItemViewState();
}

class _DetailMenuItemViewState extends State<DetailMenuItemView> {
  int _currentIndex = 0;

  // ignore: unused_field
  late Timer _timer;

  List<bool> _selected = [];

  @override
  void initState() {
    super.initState();

    _selected = List.generate(widget.menuItem.options.length, (i) => false);

    _timer = Timer.periodic(Duration(seconds: 5), (timer) async {
      if (mounted) {
        setState(() {
          if (_currentIndex + 1 == widget.menuItem.imageURLs.length) {
            _currentIndex = 0;
          } else {
            _currentIndex = _currentIndex + 1;
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FractionallySizedBox(
          heightFactor: 1,
          child: Scaffold(
            // floatingActionButton: FloatingActionButton(
            //   onPressed: () => {print("item added to card")},
            //   child: Icon(
            //     Icons.add,
            //     color: Colors.black,
            //   ),
            //   backgroundColor: Colors.yellow,
            // ),
            body: SingleChildScrollView(
              controller: ModalScrollController.of(context),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 350.0,
                        child: CarouselSlider(
                          items: widget.menuItem.imageURLs
                              .map(
                                (item) => CachedNetworkImage(
                                  imageUrl: item,
                                  fit: BoxFit.cover,
                                ),
                              )
                              .toList(),
                          options: CarouselOptions(
                            autoPlay: true,
                            height: double.infinity,
                            viewportFraction: 1,
                            autoPlayCurve: Curves.slowMiddle,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: -1,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(100)),
                              color: Colors.white),
                          width: MediaQuery.of(context).size.width,
                          height: 30,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.menuItem.name,
                              style: TextStyle(
                                  fontSize: 28.0, fontWeight: FontWeight.w900),
                            ),
                            Text(
                              widget.menuItem.formattedPrice,
                              style: TextStyle(
                                  fontSize: 28.0, fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        Text(
                          widget.menuItem.category,
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.w100),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Text(
                          widget.menuItem.description,
                          style: TextStyle(fontSize: 18.0),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Text(
                          "Additional Toppings",
                          style: TextStyle(
                              fontSize: 22.0, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: widget.menuItem.options.length,
                          itemBuilder: (_, index) => ListTile(
                            tileColor:
                                _selected[index] ? Colors.yellow[100] : null,
                            title: Text(
                                widget.menuItem.options.keys.elementAt(index)),
                            trailing: Text(cFPrice(widget
                                .menuItem.options.values
                                .elementAt(index))),
                            onTap: () => setState(
                                () => _selected[index] = !_selected[index]),
                          ),
                        ),
                        SizedBox(
                          height: 100,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                color: Colors.yellow[300]),
            width: MediaQuery.of(context).size.width,
            height: 100,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(10),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: IconButton(
                      onPressed: () => {},
                      icon: Icon(Icons.remove),
                    ),
                  ),
                  Container(
                    height: 40,
                    width: 40,
                    child: Center(
                      child: Text(
                        "1",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w900),
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.symmetric(
                        vertical: BorderSide(color: Colors.grey),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 7,
                          offset: Offset(3, 3), // changes position of shadow
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.horizontal(
                        right: Radius.circular(10),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 7,
                          offset: Offset(3, 0), // changes position of shadow
                        ),
                      ],
                    ),
                    child: IconButton(
                      onPressed: () => {},
                      icon: Icon(Icons.add),
                    ),
                  ),
                  Spacer(),
                  ElevatedButton(
                    onPressed: () => {},
                    child: Text("Add to Tote"),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      onPrimary: Colors.black,
                      onSurface: Colors.cyan,
                      fixedSize: Size(120, 40),
                      textStyle: TextStyle(fontWeight: FontWeight.w900),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
