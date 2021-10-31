part of 'widgets.dart';

class CategoryWidget extends StatelessWidget {
  final bool isSelected;
  final String? name;
  final Function? onTap;
  const CategoryWidget(
      {Key? key, this.isSelected = false, this.name, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onTap != null) {
          onTap!();
        }
      },
      child: Container(
        height: 40,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: (isSelected) ? primaryColor : Colors.white,
        ),
        child: Center(
          child: Text(
            name!,
            style: subHeadingTextStyle.copyWith(
              fontSize: 14,
              color: (isSelected) ? Colors.white : Colors.black,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
      ),
    );
  }
}
