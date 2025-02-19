public class HomoglyphFunction {

    public static void greetUser() {
        System.out.println("Welcome, User!");
    }
    
    public static void greetUѕer() { // Note: the 's' in 'Uѕer' is a Cyrillic homoglyph.
        System.out.println("Farewell, User!");
    }
    
    public static void main(String[] args) {
        greetUѕer();
    }
}