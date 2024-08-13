
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:rafi/home/widgets/data.dart';
import 'article_details.dart';

class Articles extends StatelessWidget {
  const Articles({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Explore',
                style: GoogleFonts.quicksand(fontSize: 37, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              searchBar(),
              const SizedBox(height: 20),
              sectionHeader('Hot Topics', 'See All'),
              const SizedBox(height: 10),
              hotTopics(context),
              const SizedBox(height: 20),
              sectionHeader('Your Articles', 'See All'),
              const SizedBox(height: 15),
              Expanded(
                child: yourArticles.isEmpty
                    ?  Center(
                  child: Text(
                    'No articles available.',
                    style: GoogleFonts.quicksand(fontSize: 18, color: Colors.black54),
                  ),
                )
                    : ListView.builder(
                  itemCount: yourArticles.length,
                  itemBuilder: (context, index) {
                    final article = yourArticles[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ArticleDetails(article: article),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Material(
                          elevation: 1,
                          borderRadius: BorderRadius.circular(20),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    article.articleImage,
                                    height: 100,
                                    width: 100,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      article.articleTitle,
                                      style:  GoogleFonts.quicksand(
                                          fontSize: 18, fontWeight: FontWeight.bold),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 5),
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: article.color,
                                      ),
                                      child: Text(
                                        article.articleCategories,
                                        style: GoogleFonts.quicksand(color: Colors.white, fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      article.time,
                                      style: GoogleFonts.quicksand(color: Colors.black45),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget searchBar() {
    return Container(
      height: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color.fromARGB(31, 151, 146, 146),
      ),
      child:  Center(
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Search',
            hintStyle: GoogleFonts.quicksand(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black45),
            prefixIcon: const Icon(Iconsax.search_normal, size: 30, color: Colors.black45),
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(horizontal: 20),
          ),
        ),
      ),
    );
  }

  Widget sectionHeader(String title, String actionText) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style:  GoogleFonts.quicksand(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          Text(
            actionText,
            style: GoogleFonts.quicksand(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blueAccent),
          ),
        ],
      ),
    );
  }

  Widget hotTopics(BuildContext context) {
    return SizedBox(
      height: 55,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        itemCount: topicItems.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final topic = topicItems[index];
          return Container(
            margin: const EdgeInsets.only(right: 10),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: topic.color,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              children: [
                Image.asset(
                  topic.icon,
                  height: 45,
                  width: 45,
                ),
                const SizedBox(width: 10),
                Text(
                  topic.name,
                  style: GoogleFonts.quicksand(fontSize: 20, fontWeight: FontWeight.w300, color: Colors.white),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
