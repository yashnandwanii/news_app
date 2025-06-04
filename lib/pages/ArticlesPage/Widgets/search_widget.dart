import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/Controllers/news_controller.dart';

class SearchWidget extends StatelessWidget {
  SearchWidget({super.key});

  final NewsController newsController = Get.put(NewsController());
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Common decoration for containers
    final inputDecoration = BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Theme.of(context).colorScheme.secondaryFixedDim,
    );

    final buttonDecoration = BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Theme.of(context).primaryColor,
    );

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: inputDecoration,
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: searchController,
              textInputAction: TextInputAction.search,
              onSubmitted: (query) {
                if (query.trim().isNotEmpty) {
                  newsController.searchNews(query);
                }
              },
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: "Search any news...",
                hintStyle: TextStyle(
                  color: Theme.of(context)
                      .colorScheme
                      .onSurface
                      .withValues(alpha: 0.6),
                ),
                fillColor: Theme.of(context).colorScheme.primaryContainer,
                filled: true,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Theme.of(context).primaryColor,
                    width: 1.5,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Theme.of(context).dividerColor,
                    width: 1.0,
                  ),
                ),
                border: InputBorder.none,
              ),
            ),
          ),
          const SizedBox(width: 8), // Added spacing for better layout
          Obx(
            () => newsController.isNewsForYouLoading.value
                ? const SizedBox(
                    width: 50,
                    height: 50,
                    child: CircularProgressIndicator(
                      strokeWidth: 3,
                    ),
                  )
                : Tooltip(
                    message: "Search",
                    child: InkWell(
                      onTap: () {
                        final query = searchController.text.trim();
                        if (query.isNotEmpty) {
                          newsController.searchNews(query);
                        }
                      },
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: buttonDecoration,
                        child: const Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
