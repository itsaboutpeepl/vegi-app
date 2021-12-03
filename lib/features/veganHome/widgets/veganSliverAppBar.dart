import 'package:flutter/material.dart';

class VeganSliverAppBar extends StatelessWidget {
  const VeganSliverAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.transparent,
      floating: false,
      pinned: false,
      snap: false,
      centerTitle: false,
      expandedHeight: MediaQuery.of(context).size.height * 0.07,
      flexibleSpace: FlexibleSpaceBar(
        background: AppBar(
          toolbarHeight: 60,
          backgroundColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Material(
                  borderRadius: BorderRadius.circular(40),
                  elevation: 5,
                  child: CircleAvatar(
                    radius: 23,
                    backgroundImage: NetworkImage(
                        "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cGVyc29ufGVufDB8fDB8fA%3D%3D&w=1000&q=80"),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    width: 40,
                    height: 40,
                    color: Colors.grey[200],
                    child: Icon(
                      Icons.menu,
                      color: Colors.black,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        centerTitle: true,
        collapseMode: CollapseMode.parallax,
      ),
    );
  }
}
