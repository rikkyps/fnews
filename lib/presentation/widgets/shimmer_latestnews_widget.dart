part of 'widgets.dart';

class ShimmerLatestNewsWidget extends StatelessWidget {
  const ShimmerLatestNewsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey,
      highlightColor: Colors.black38,
      child: Container(
        width: MediaQuery.of(context).size.width * 3 / 3.5,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.black.withOpacity(0.3),
        ),
      ),
    );
  }
}
