package zach.lab8;

/**
 * Created by zach on 11/10/16.
 */

public class CoffeeShop {
    private String coffeeShop;
    private String coffeeShopURL;

    private void setCoffeeInfo(Integer coffeeCrowd){
        switch (coffeeCrowd){
            case 0: //popular
                coffeeShop="Snooze";
                coffeeShopURL="http://snoozeeatery.com/locations/boco/";
                break;
            case 1: //cycling
                coffeeShop="Southern Sun";
                coffeeShopURL="http://www.mountainsunpub.com/contact.htm";
                break;
            case 2: //hipster
                coffeeShop="Dushanbee TeaHouse";
                coffeeShopURL="http://boulderteahouse.com/";
                break;
            case 3: //Best Drinks
                coffeeShop="The Buff";
                coffeeShopURL="http://www.buffrestaurant.com/";
                break;
            case 4: //Best Pancakes
                coffeeShop="The Village";
                coffeeShopURL="http://www.villagecoffeeshopboulder.com/";
                break;
            default:
                coffeeShop="none";
                coffeeShopURL="https://www.google.com/#q=brunch+boulder";
                break;
        }
    }
        public void setCoffeeShop(Integer coffeeCrowd){

            setCoffeeInfo(coffeeCrowd);
        }

        public void setCoffeeShopURL(Integer coffeeCrowd){

            setCoffeeInfo(coffeeCrowd);
        }

        public String getCoffeeShop(){

            return coffeeShop;
        }

        public String getCoffeeShopURL(){

            return coffeeShopURL;
        }
    }
