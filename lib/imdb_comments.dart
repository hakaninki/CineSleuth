import 'package:flutter/material.dart';
import 'package:hakanflix/models/movie.dart'; // Movie modelini içeri aktarıyoruz

class ImdbComments extends StatelessWidget {
  final Movie movie; // Movie objesini almak için constructor

  const ImdbComments({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'IMDB Comments',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          // IMDB yorumlarını listelemek için ListView.builder kullanabilirsiniz
          // Örnek bir liste kullanıyorum, gerçek yorumlarınızı getirmek için uygun fonksiyonu çağırabilirsiniz
          ListView.builder(
            shrinkWrap: true,
            itemCount: 3, // Örnek olarak 3 yorum gösteriyorum
            itemBuilder: (context, index) {
              return ListTile(
                title: Text('Comment ${index + 1}'),
              );
            },
          ),
        ],
      ),
    );
  }
}
