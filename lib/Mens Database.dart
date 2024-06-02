import 'constants.dart';
import 'Products Class.dart';

class Database {
  static List<Products> generatedata() {
    List<Products> productlist = [
      Products(constants.M4, "CHAMBRAY COMMANDO GREEN", "1,500", "M", "Green"),
      Products(constants.M5, "CHAMBRAY ORANGE", "2,000", "S", "Orange"),
      Products(constants.M6, "CHAMBRAY ZINC", "1,250", "L", "Zinc"),
      Products(constants.M8, "BLACK SKIN DRAWING", "2,500", "S", "Black"),
      Products(constants.M9, "CARMEL PALM TREE", "1,800", "S", "Caramel"),
      Products(constants.M10, "HORIZONTAL BLUE STRIP", "1,900", "L", "Blue"),
      Products(constants.M11, "OLIVE BLACK CHEETAH", "1,650", "S", "Olive"),
      Products(constants.M12, "SILVER VECTOR", "2,000", "L", "Silver"),
      Products(constants.M1, "PRINTED POLO", "1,550", "M", "Black"),
      Products(constants.M7, "GRAPHIC TSHIRT", "2,000", "L", "Pink"),
      Products(constants.M3, "V-NECK TSHIRT", "1,100", "M", "Blue"),
      Products(constants.M2, "CREW NECK TSHIRT", "2,100","S", "Skin"),
      Products(constants.M16, "CAMEL PRINT TEXTURE", "1,100", "25-30", "Brown"),
      Products(constants.M17, "CARGO MUSTARD TEXTURE", "1,500", "25-35", "Musturd"),
      Products(constants.M18, "CHINO SELF LINING", "1,800", "28-30", "Blue"),
      Products(constants.M19, "CHINE WEB SILVER", "2,000", "30-35", "Silver"),
      Products(constants.M20, "JOGGER NAVY TEXTURE", "2,500", "30-35", "Navy Blue"),
      Products(constants.M21, "JOGGER DENIM BLUE", "2,800", "25-35", "Denim Blue"),
    ];
    return productlist;
  }
}
