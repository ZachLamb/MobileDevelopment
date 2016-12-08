package zach.icecream;

/**
 * Created by zach on 12/8/16.
 */

public class iceCreamShop {
    private String iceCreamShop;
    private String getIceCreamURL;

    private void setIceCreamInfo(Integer iceCreamCrowd){
        switch (iceCreamCrowd){
            case 0: //Pumpkin Pie
                iceCreamShop="Glacier";
                getIceCreamURL="http://www.glaciericecream.com/";
                break;
            case 1: //Cookie Dough
                iceCreamShop="Sweet Cow";
                getIceCreamURL="http://www.sweetcowicecream.com/";
                break;
            case 2: //Cookies and Cream
                iceCreamShop="Fior De Latte";
                getIceCreamURL="http://fiordilattegelato.com/";
                break;
            default:
                iceCreamShop="none";
                getIceCreamURL="https://www.google.com/search?q=ice+cream+boulder";
                break;
        }
    }
    public void setIceCreamShop(Integer iceCreamShopCrowd){

        setIceCreamInfo(iceCreamShopCrowd);
    }

    public void setIceCreamShopURL(Integer iceCreamCrowd){

        setIceCreamInfo(iceCreamCrowd);
    }

    public String getIceCreamShop(){

        return iceCreamShop;
    }

    public String getIceCreamShopURL(){

        return getIceCreamURL;
    }
}
