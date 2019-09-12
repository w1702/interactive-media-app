import java.util.*;

public class ReactionData {
        /* Constant String representations of all the reaction types */

        // GIVEN two Particles with the SAME Type, Particle1 and Particle2
        // WHEN Particle1 contacts with Particle2
        // THEN Particle1 will STACK on top of Particle2
        public static final String REACTION_TYPE_STACK = "stack";

        // GIVEN two Particle types, ParticleType1 and ParticleType2
        // WHEN ParticleType1 contacts with ParticleType2
        // THEN ParticleType1 AND ALL OTHER Particles (regardless of their type) in the radius of Particle2 will EXPLODE outwards and disappear
        public static final String REACTION_TYPE_EXPLODE = "explode";

        // GIVEN two Particle types, ParticleType1 and ParticleType2
        // WHEN ParticleType1 contacts with ParticleType2
        // THEN ParticleType2 will COLLAPSE and disappear, ParticleType1 remains and will still be subject to gravity
        public static final String REACTION_TYPE_COLLAPSE = "collapse";

        // GIVEN two Particle types, ParticleType1 and ParticleType2
        // WHEN ParticleType1 contacts with ParticleType2
        // THEN ParticleType2 will remain in its place and REPEL ParticleType1 upwards, ParticleType1 will eventually stop bouncing and disappear
        public static final String REACTION_TYPE_REPEL = "repel";

    // A map of possible reactions
    private final Map<String, Map<String, String>> reactions;

    /**
     * Constructor method, initialise class fields
     *
     * Reactions Matrix
     *
     *              RED             GREEN           BLUE
     *        ---------------------------------------------------
     * RED   |       STACK           REPEL          COLLAPSE
     *       |
     * GREEN |       REPEL           STACK          EXPLODE
     *       |
     * BLUE  |       COLLAPSE        EXPLODE        STACK
     *
     */
    ReactionData(){
        // Initialise red row of the matrix
        Map<String, String> redRow = new HashMap<String, String>();
        redRow.put(Particle.PARTICLE_TYPE_RED,  REACTION_TYPE_STACK);
        redRow.put(Particle.PARTICLE_TYPE_GREEN,  REACTION_TYPE_REPEL);
        redRow.put(Particle.PARTICLE_TYPE_BLUE, REACTION_TYPE_COLLAPSE);

        // Initialise green row of the matrix
        Map<String, String> greenRow = new HashMap<String, String>();
        greenRow.put(Particle.PARTICLE_TYPE_RED, REACTION_TYPE_REPEL);
        greenRow.put(Particle.PARTICLE_TYPE_GREEN, REACTION_TYPE_STACK);
        greenRow.put(Particle.PARTICLE_TYPE_BLUE, REACTION_TYPE_EXPLODE);

        // Initialise blue row of the matrix
        Map<String, String> blueRow = new HashMap<String, String>();
        blueRow.put(Particle.PARTICLE_TYPE_RED, REACTION_TYPE_COLLAPSE);
        blueRow.put(Particle.PARTICLE_TYPE_GREEN, REACTION_TYPE_EXPLODE);
        blueRow.put(Particle.PARTICLE_TYPE_BLUE, REACTION_TYPE_STACK);

        // Initialise whole matrix
        reactions = new HashMap<String, Map<String, String>>();
        reactions.put(Particle.PARTICLE_TYPE_RED, redRow);
        reactions.put(Particle.PARTICLE_TYPE_GREEN, greenRow);
        reactions.put(Particle.PARTICLE_TYPE_BLUE, blueRow);
    }

    /**
     * Get a constant String representation of a reaction between two particle types by looking up their intersection in the map
     * @param particleType1 the first particle type
     * @param particleType2 the second particle type
     * @return a String constant of the reaction type
     */
    public String getReaction(String particleType1, String particleType2){
        Map<String, String> innerRow = reactions.get(particleType1);
        return innerRow.get(particleType2);
    }
}


