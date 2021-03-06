part of 'board.dart';

class _Board extends StatelessWidget {
  const _Board({
    required this.child,
    Key? key,
  }) : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 60),
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
            decoration: BoxDecoration(
                color: const Color(0xFF664AC4),
                borderRadius: BorderRadius.circular(16)),
            width: double.maxFinite,
            padding: const EdgeInsets.all(3),
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: child),
      ),
    );
  }
}

class _BoardTile extends StatelessWidget {
  const _BoardTile({
    required this.move,
    Key? key,
  }) : super(key: key);

  final Move move;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: const Color(0xFF332367),
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.all(6),
      child: move.widget,
    );
  }
}

class _GameOverBoard extends StatelessWidget {
  _GameOverBoard.win({required this.onTap, required this.name, Key? key})
      : text = 'Congrats $name !!',
        image = Assets.images.win.image(),
        super(key: key);
  _GameOverBoard.tie({required this.onTap, Key? key})
      : text = 'Ahhhhh it\'s a tie !!',
        name = '',
        image = Assets.images.tie.image(),
        super(key: key);

  final String text;
  final Image image;
  final VoidCallback onTap;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _Board(
          child: Center(
              child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                image,
                Text(
                  text,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 24),
                ),
              ],
            ),
          )),
        ),
        Positioned(
          bottom: 30,
          left: 0,
          right: 0,
          child: Center(
            child: SizedBox(
              height: 72,
              width: 72,
              child: GestureDetector(
                onTap: onTap,
                child: Container(
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(255, 227, 75, 141),
                          Color.fromARGB(255, 228, 149, 69),
                        ],
                        stops: [0.2, 1.0],
                      ),
                      shape: BoxShape.circle),
                  child: const Icon(
                    Icons.replay,
                    color: Colors.white,
                    size: 32,
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
