part of 'widgets.dart';

class ShimmerListNewsWidget extends StatelessWidget {
  const ShimmerListNewsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Shimmer.fromColors(
            baseColor: Colors.grey,
            highlightColor: Colors.black38,
            child: Container(
              width: (MediaQuery.of(context).size.width * 1 / 3) - 5 - 15,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: Colors.black.withOpacity(0.3),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Shimmer.fromColors(
                baseColor: Colors.grey,
                highlightColor: Colors.black38,
                child: Container(
                  color: Colors.black.withOpacity(0.3),
                  width: (MediaQuery.of(context).size.width * 2 / 3) - 5 - 15,
                  height: 30,
                ),
              ),
              Shimmer.fromColors(
                baseColor: Colors.grey,
                highlightColor: Colors.black38,
                child: Container(
                  color: Colors.black.withOpacity(0.3),
                  width: (MediaQuery.of(context).size.width * 1 / 3) - 5 - 15,
                  height: 10,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
