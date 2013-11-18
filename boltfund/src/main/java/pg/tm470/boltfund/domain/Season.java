package pg.tm470.boltfund.domain;


public enum Season {

    SPRING("spring"), SUMMER("summer"), AUTUMN("autumn"), WINTER("winter");
    
    private final String name;
    private Season(String name){this.name = name;};
    
    public String getName(){
    	// get from messages.properties
    	return name;
    }
}
