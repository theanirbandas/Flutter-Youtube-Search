import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:youtube_search/model/search_item.dart';

class VideoItem extends StatelessWidget {
  
  final SearchItem item;
  
  const VideoItem(this.item, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 7.0,
			shadowColor: Colors.grey[200].withOpacity(0.6),
			shape: RoundedRectangleBorder(
				borderRadius: BorderRadius.circular(5.0)
			),
      margin: const EdgeInsets.all(5.0),
      child: Container(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            CachedNetworkImage(
              width: 115.0,
              height: 90.0,
              fit: BoxFit.fill,
              imageUrl: item.thumbnail,
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            const SizedBox(width: 10.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    item.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 5.0),
                  Text(
                    item.description,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.grey
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  Text(
                    item.channelTitle ?? '',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.grey
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}