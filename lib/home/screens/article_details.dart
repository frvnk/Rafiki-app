
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:rafi/home/widgets/data.dart';

class ArticleDetails extends StatefulWidget {
  final YourArticles article;
  const ArticleDetails({super.key, required this.article});

  @override
  State<ArticleDetails> createState() => _ArticleDetailsState();
}

class _ArticleDetailsState extends State<ArticleDetails> {
  final TextEditingController _commentController = TextEditingController();
  final List<String> _comments = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.article.articleTitle),
        backgroundColor: widget.article.color,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                widget.article.articleImage,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 20),
              Text(
                widget.article.articleTitle,
                style: GoogleFonts.quicksand(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(
                'By ${widget.article.image} | ${widget.article.date} | ${widget.article.time}',
                style: GoogleFonts.quicksand(color: Colors.grey),
              ),
              const SizedBox(height: 20),
              Text(
                widget.article.description,
                style: GoogleFonts.quicksand(fontSize: 18),
              ),
              const SizedBox(height: 20),
              const Divider(),
              Text(
                'Comments',
                style: GoogleFonts.quicksand(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 200, // Specify a height to avoid layout issues
                child: ListView.builder(
                  itemCount: _comments.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(_comments[index]),
                    );
                  },
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _commentController,
                decoration: InputDecoration(
                  labelText: 'Add a comment',
                  suffixIcon: IconButton(
                    icon: const Icon(Iconsax.send1),
                    onPressed: () {
                      setState(() {
                        if (_commentController.text.isNotEmpty) {
                          _comments.add(_commentController.text);
                          _commentController.clear();
                        }
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
