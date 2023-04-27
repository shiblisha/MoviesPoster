import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MorePage extends StatefulWidget {
  final String image;
  final String title;
  final String rating;
  final String discription;
  final String trailer;
  final List<String> genre;
  final String director;
  final String writer;

  const MorePage({
    Key? key,
    required this.image,
    required this.title,
    required this.rating,
    required this.discription,
    required this.trailer,
    required this.genre,
    required this.director,
    required this.writer,
  }) : super(key: key);

  @override
  State<MorePage> createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {
  @override
  Widget build(BuildContext context) {
    var mwidth = MediaQuery.of(context).size.width;
    var mheight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                  height: mheight * 0.45,
                  width: mwidth * 1,
                  child: Image.network(
                    widget.image,
                    fit: BoxFit.fill,
                  )),
              Padding(
                padding:
                    EdgeInsets.only(left: mwidth * 0.02, top: mheight * 0.02),
                child: Text(
                  widget.title,
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              ),
              SizedBox(
                height: mheight * 0.01,
              ),
              Padding(
                padding: EdgeInsets.only(left: mwidth * 0.02),
                child: Row(
                  children: [
                    Text(
                      "genre    :-",
                      style: TextStyle(fontSize: 13, color: Colors.white),
                    ),
                    SizedBox(
                      width: mwidth * 0.03,
                    ),
                    SizedBox(height: mheight*0.02,
                      width: mwidth*0.8,
                      child: ListView.builder(itemCount: widget.genre.length,

                        itemBuilder: (BuildContext context, int index) {
                          return Text(
                            widget.genre[index].toString(),
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: mheight * 0.02,
              ),
              Padding(
                padding: EdgeInsets.only(left: mwidth * 0.02),
                child: Row(
                  children: [
                    Text(
                      "Ratting :-",
                      style: TextStyle(fontSize: 13, color: Colors.white),
                    ),
                    SizedBox(
                      width: mwidth * 0.03,
                    ),
                    Text(
                      widget.rating,
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: mheight * 0.02,
              ),
              Center(
                child: GestureDetector(onTap: (){
                  launchUrl(
                      Uri.parse(widget.trailer),
                      mode: LaunchMode.externalApplication);
                },
                  child: Container(
                    height: mheight * 0.06,
                    width: mwidth * 0.96,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.grey,
                    ),
                    child: Center(
                        child: Text(
                      "Wach Trailer",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    )),
                  ),
                ),
              ),
              SizedBox(
                height: mheight * 0.02,
              ),
              Center(
                child: FittedBox(
                  child: Container(
                    height: mheight * .15,
                    width: mwidth * .97,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black26,
                    ),
                    child: Padding(
                      padding:
                          EdgeInsets.only(left: mwidth * 0.02, top: mheight * 0.01),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Prolog",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                color: Colors.white),
                          ),
                          Text(
                            widget.discription,
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: mheight * 0.02,
              ),
              Padding(
                padding: EdgeInsets.only(left: mwidth * 0.02),
                child: Row(
                  children: [
                    Text(
                      "Director :- ",
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                    Text(widget.director,
                        style: TextStyle(fontSize: 15, color: Colors.white))
                  ],
                ),
              ),
              SizedBox(
                height: mheight * 0.02,
              ),
              Padding(
                padding: EdgeInsets.only(left: mwidth * 0.02),
                child: Row(
                  children: [
                    Text(
                      "Writer    :- ",
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                    FittedBox(
                      child: Container(
                        width: mwidth*0.8,
                        height: mheight*0.1,
                        child: Text(widget.writer,
                            style: TextStyle(fontSize: 15, color: Colors.white)),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
