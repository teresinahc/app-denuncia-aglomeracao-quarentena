import 'package:flutter/material.dart';
import 'package:image_fade/image_fade.dart';

class Avatar extends StatelessWidget {
  final double radius;
  final ImageProvider image;
  final bool isRemoveble;
  final Function onRemovePressed;
  final bool isEditable;
  final Function onEditPressed;
  final Function onTap;
  final Widget placeHolder;

  const Avatar(
      {Key key,
      @required this.radius,
      @required this.image,
      this.isRemoveble: false,
      this.onRemovePressed,
      this.onTap,
      this.isEditable: false,
      this.onEditPressed,
      this.placeHolder: const Center(child: CircularProgressIndicator())})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.25),
                    blurRadius: 4,
                    offset: Offset(0, 4))
              ],
              borderRadius: BorderRadius.circular(radius),
              border:
                  Border.all(color: Theme.of(context).primaryColor, width: 1)),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(radius),
              child: ImageFade(
                width: radius * 2,
                height: radius * 2,
                fit: BoxFit.cover,
                image: image,
                placeholder: placeHolder,
              )),
        ),
        (isRemoveble && onRemovePressed != null)
            ? InkWell(
                onTap: onRemovePressed,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(radius)),
                  width: radius / 2,
                  height: radius / 2,
                  child: Icon(
                    Icons.close,
                    size: radius / 3,
                    color: Colors.white,
                  ),
                ),
              )
            : Container(
                width: 1,
                height: 1,
              ),
        (isEditable && onEditPressed != null)
            ? Positioned(
                bottom: 0,
                right: radius / 6,
                child: Material(
                  borderRadius: BorderRadius.circular(radius),
                  color: Colors.red,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(radius),
                    onTap: onEditPressed,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      width: radius * (2 / 4),
                      height: radius * (2 / 4),
                      child: Icon(
                        Icons.edit,
                        color: Colors.white,
                        size: radius / 3,
                      ),
                    ),
                  ),
                ),
              )
            : Container(
                width: 1,
                height: 1,
              ),
        (onTap != null)
            ? Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(radius),
                  onTap: onTap,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(radius)),
                    width: radius * 2 + 2,
                    height: radius * 2 + 2,
                  ),
                ),
              )
            : Container(
                width: 1,
                height: 1,
              ),
      ],
    );
  }
}
