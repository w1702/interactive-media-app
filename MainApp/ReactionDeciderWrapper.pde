import java.util.*;

public class ReactionDecider {
    // A map of possible reactions 
    private final Map<String, Map<String, String>> reactions;

    /**
     * Constructor method, initialise class fields
     *
     * Reactions Matrix
     *
     *              RED             GREEN           BLUE
     *----------------------------------------------------------
     * RED   |       NONE            RED-GREEN       RED-BLUE
     *       |
     * GREEN |       GREEN-RED       NONE            GREEN-BLUE
     *       |
     * BLUE  |       BLUE-RED        BLUE-GREEN      NONE
     *
     */
    ReactionDecider(){
        final String ELEMENT_1 = "Red";
        final String ELEMENT_2 = "Green";
        final String ELEMENT_3 = "Blue";

        // Initialise row 1 of the matrix
        Map<String, String> row1 = new HashMap<String, String>();
        row1.put(ELEMENT_1, "NONE");
        row1.put(ELEMENT_2, "RED-GREEN");
        row1.put(ELEMENT_3, "RED-BLUE");

        // Initialise row 2 of the matrix
        Map<String, String> row2 = new HashMap<String, String>();
        row2.put(ELEMENT_1, "GREEN-RED");
        row2.put(ELEMENT_2, "NONE");
        row2.put(ELEMENT_3, "GREEN-BLUE");

        // Initialise row 3 of the matrix
        Map<String, String> row3 = new HashMap<String, String>();
        row3.put(ELEMENT_1, "BLUE-RED");
        row3.put(ELEMENT_2, "BLUE-GREEN");
        row3.put(ELEMENT_3, "NONE");

        // Initialise whole matrix
        reactions = new HashMap<String, Map<String, String>>();
        reactions.put(ELEMENT_1, row1);
        reactions.put(ELEMENT_2, row2);
        reactions.put(ELEMENT_3, row3);
    }

    /**
     * Get a String representation of the reaction between two elements by looking up it's
     * @param element1 the first element
     * @param element2 the second element
     * @return a String representation of the reaction
     */
    public String getReaction(String element1, String element2){
        for (String firstElement : reactions.keySet()) {
            if(firstElement.equalsIgnoreCase(element1)){
                Map<String, String> innerMap = reactions.get(firstElement);
                for (String secondElement : innerMap.keySet()) {
                    if(secondElement.equalsIgnoreCase(element2)){
                        return innerMap.get(secondElement);
                    }
                }
            }
        }
        return null;
    }
}


