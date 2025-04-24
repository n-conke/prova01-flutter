import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ArtistProfile(),
  ));
}

class ArtistProfile extends StatelessWidget {
  const ArtistProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  'assets/drakebanner.jpeg',
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
                Container(
                  height: 200,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.transparent, Colors.black],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 10,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Chip(
                        label: Text('ARTISTA VERIFICADO',
                            style: TextStyle(fontSize: 10)),
                        backgroundColor: Colors.blue,
                      ),
                      Text(
                        'Drake',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      Text(
                        '79,515,419 ouvintes mensais',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: const [
                    Icon(Icons.favorite_border, color: Colors.white),
                    SizedBox(width: 16),
                    Icon(Icons.more_horiz, color: Colors.white),
                  ]),
                  Row(children: [
                    const Icon(Icons.shuffle, color: Colors.white),
                    const SizedBox(width: 8),
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.play_arrow),
                      label: const Text('Play'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                        shape: const StadiumBorder(),
                      ),
                    ),
                  ]),
                ],
              ),
            ),
            const TabBar(
              indicatorColor: Colors.green,
              tabs: [
                Tab(text: 'Música'),
                Tab(text: 'Sobre'),
                Tab(text: 'Fãs'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  _musicTab(),
                  _aboutTab(),
                  _fansTab(),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.grey[900],
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.library_music),
              label: 'Library',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.share),
              label: 'Share',
            ),
          ],
        ),
      ),
    );
  }

  Widget _musicTab() {
  final songs = [
    {
      'title': 'Hotline Bling',
      'views': '1,234,567,890',
      'image': 'assets/hotlinebling.jpeg',
    },
    {
      'title': 'God\'s Plan',
      'views': '987,654,321',
      'image': 'assets/godsplan.jpeg',
    },
    {
      'title': 'One Dance',
      'views': '876,543,210',
      'image': 'assets/hotlinebling.jpeg',
    },
    {
      'title': 'In My Feelings',
      'views': '765,432,100',
      'image': 'assets/godsplan.jpeg',
    },
    {
      'title': 'Toosie Slide',
      'views': '654,321,000',
      'image': 'assets/tossie.jpeg',
    },
  ];

  final albums = [
    {
      'title': 'Views',
      'subtitle': 'Album • 2016',
      'image': 'assets/hotlinebling.jpeg',
    },
    {
      'title': 'Scorpion',
      'subtitle': 'Album • 2018',
      'image': 'assets/godsplan.jpeg',
    },
    {
      'title': 'Certified Lover Boy',
      'subtitle': 'Album • 2021',
      'image': 'assets/certifiedloverboy.jpeg',
    },
    {
      'title': 'Her Loss',
      'subtitle': 'Album • 2022',
      'image': 'assets/herloss.jpeg',
    },
  ];

  return SingleChildScrollView(
    padding: const EdgeInsets.all(12),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Popular',
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),

        ListView.builder(
          itemCount: songs.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final song = songs[index];
            return ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Image.asset(
                song['image']!,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
              title: Text(song['title']!, style: const TextStyle(color: Colors.white)),
              subtitle: Text(song['views']!, style: const TextStyle(color: Colors.grey)),
              trailing: const Icon(Icons.more_horiz, color: Colors.white),
            );
          },
        ),

        const SizedBox(height: 20),
        const Text(
          'Álbuns',
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),

        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: albums.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 1,
          ),
          itemBuilder: (_, i) {
            final album = albums[i];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Image.asset(
                    album['image']!,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 4),
                Text(album['title']!, style: const TextStyle(color: Colors.white)),
                Text(album['subtitle']!,
                    style: const TextStyle(color: Colors.grey, fontSize: 12)),
              ],
            );
          },
        ),
      ],
    ),
  );
}


  Widget _aboutTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text('Biografia', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          Text(
            'Aubrey Drake Graham mais conhecido como Drake, nasceu dia 24 de outubro de 1986 em Toronto, Canadá, começou sua carreira como ator na série "Degrassi: The Next Generation" antes de se tornar um dos maiores nomes da música. Lançou seu primeiro álbum, "Thank Me Later", em 2010, e seguiu com sucessos como "Take Care" e "Views". Conhecido por combinar rap, R&B e pop, ele é premiado com vários Grammy Awards e detém recordes de streaming, além de ser empresário com sua gravadora OVO Sound.',
            style: TextStyle(color: Colors.grey),
          ),
          SizedBox(height: 20),
          Text('Ouvintes mensais', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          Text('Toronto: 2,345,678\nNew York: 1,987,654\nLondon: 1,765,432', style: TextStyle(color: Colors.grey)),
          SizedBox(height: 20),
          Text('Redes Sociais', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          Row(
            children: [
              Chip(label: Text('Instagram'), backgroundColor: Colors.grey),
              SizedBox(width: 12),
              Chip(label: Text('Twitter'), backgroundColor: Colors.grey),
              SizedBox(width: 12),
              Chip(label: Text('YouTube'), backgroundColor: Colors.grey),
            ],
          ),
        ],
      ),
    );
  }

  Widget _fansTab() {
    final List<Map<String, String>> artists = [
  {'name': 'The Weeknd', 'image': 'assets/the weeknd.png'},
  {'name': 'Bruno Mars', 'image': 'assets/bruno.mars.jpeg'},
  {'name': '50 Cent', 'image': 'assets/50cent.png'},
  {'name': 'Kendrick', 'image': 'assets/kendrick.png'},
  {'name': 'Beyonce', 'image': 'assets/beyonce.png'},
  {'name': 'Snoop Dog', 'image': 'assets/snoop.png'},
];

    return SingleChildScrollView(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Fãs também ouvem', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 6,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1,
            ),
            itemBuilder: (_, i) {
  final artist = artists[i];
  return Column(
    children: [
      CircleAvatar(
        backgroundImage: AssetImage(artist['image']!),
        radius: 40,
      ),
      const SizedBox(height: 6),
      Text(
        artist['name']!,
        style: const TextStyle(color: Colors.white, fontSize: 12),
      ),
    ],
  );
},
          ),
          const SizedBox(height: 20),
          const Text('Próximos Eventos', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          _eventCard('Wireless Festival', 'Finsbury Park, London', 'July 11, 2025'),
          const SizedBox(height: 12),
          _eventCard('Wireless Festival', 'Finsbury Park, London', 'July 13, 2025'),
        ],
      ),
    );
  }

  Widget _eventCard(String title, String location, String date) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              TextButton(
                onPressed: () {},
                child: const Text('Comprar ingressos', style: TextStyle(color: Colors.green)),
              ),
            ],
          ),
          Text(location, style: const TextStyle(color: Colors.grey, fontSize: 12)),
          Text(date, style: const TextStyle(color: Colors.grey, fontSize: 12)),
        ],
      ),
    );
  }
}
