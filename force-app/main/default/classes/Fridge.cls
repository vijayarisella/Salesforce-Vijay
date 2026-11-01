public class Fridge {
public String modelNumber;
public Integer numberInStock;
    public void setModelNumber(String theModelNumber) {
modelNumber = theModelNumber;
}
public String getModelNumber() {
return modelNumber;
}
    static{
        System.debug('this is a ststic block');
    }
public void updateStock(Integer justSold) {
numberInStock = numberInStock - justSold;
}
}