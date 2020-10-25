import 'package:flutter/material.dart';
import 'package:life_must_go_on/constants.dart';
import 'package:life_must_go_on/drawer.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(projectTitle),
      ),
      drawer: MyDrawer(
        curr: "about",
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              Text(
                "Why you should donate your things?",
                style: Theme.of(context).textTheme.headline4.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                    ),
                textAlign: TextAlign.center,
              ),
              Container(
                margin: EdgeInsets.only(top: 20, bottom: 5),
                child: Text(
                  "It’s much better for the environment",
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      .copyWith(color: Colors.deepOrangeAccent),
                ),
              ),
              Text(
                "When you donate your stuff, you are saving the environment from a lot of harm. According to the EPA, it costs \$45 on average per ton to dispose of waste in a landfill. When decomposing the waste emits toxic and greenhouse gases. We can significantly reduce the impact if we give our old possesions to be reused.",
                textAlign: TextAlign.justify,
              ),
              Container(
                margin: EdgeInsets.all(15),
                child: Image.network(
                  "https://img.pngio.com/recycle-waste-symbol-recycling-bin-png-download-free-recycle-recycle-logo-png-920_880.png",
                  width: width / 2,
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 5),
                child: Text(
                  "It helps people in need",
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      .copyWith(color: Colors.deepOrangeAccent),
                ),
              ),
              Text(
                "Even though you don’t want your old things anymore, it’s almost guaranteed that someone else will. There are many people in need of usable clothing, toys, food, etc. There are disaster victims, underprivileged people, and children in need, and your donations can them. When you throw away your items, they have no chance of reaching people who need them the most.",
                textAlign: TextAlign.justify,
              ),
              Container(
                margin: EdgeInsets.all(15),
                child: Image.network(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQ1_afWVZNnMZ8NY6Y9xgjj-JdHgZS8UlTPZg&usqp=CAU",
                  width: width / 2,
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 5),
                child: Text(
                  "It will give you an ego boost",
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      .copyWith(color: Colors.deepOrangeAccent),
                ),
              ),
              Text(
                "When you do things for others, something good happens for you too. Doing a good deed like donating your old items will make you feel good because you’re doing something for a worthy cause. You’re getting rid of the clutter in your home and helping others at the same time.",
                textAlign: TextAlign.justify,
              ),
              Container(
                margin: EdgeInsets.all(15),
                child: Image.network(
                  "https://cdn2.f-cdn.com/contestentries/1460390/31202003/5c1c0cd38393a_thumb900.jpg",
                  width: width / 2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
