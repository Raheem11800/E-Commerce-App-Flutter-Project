import 'Products Class.dart';
import 'constants.dart';
class Database {
  static List<Products> generatedata()
  {
    List<Products> productlist = [
      Products(constants.W1, "BASIC POPLIN", "1,500", "M", "White"),
      Products(constants.W3, "GINGHAM CHECK SHIRT", "1,800", "S", "Blue"),
      Products(constants.W4, "LINEN LEG PANTS", "2,000", "20-30", "Red"),
      Products(constants.W5, "POPLIN CROPPED SHIRT", "1,550", "S", "Blue"),
      Products(constants.W6, "POPLIN SHIRT", "2,700", "S", "Blue"),
      Products(constants.W7, "POPLIN TOP", "1,990", "L", "Black"),
      Products(constants.W8, "SUPER CROPPED SHIRT", "2,800", "L", "White"),
      Products(constants.W11, "WIDE LEG TROUSERS", "3,000", "20-30", "Pink"),
      Products(constants.W12, "WIDE LEG", "1,999", "20-30", "Black"),
    ];
    return productlist;
  }
}