import 'package:flutter/material.dart';
import 'package:pharm_traka/screens/home/components/text_title.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextTitle(title: "Search Medicine"),
        Container(
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: Colors.grey,
              )),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(width: 5),
              const Icon(
                Icons.search_sharp,
                color: Colors.grey,
                size: 30,
              ),
              const Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "search",
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
