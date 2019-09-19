import processing.core.PApplet;

import java.util.*;

public class Reaction {
    private final PApplet mainApp;

    private ReactionData reactionData = new ReactionData();

    Reaction(PApplet mainApp){
        this.mainApp = mainApp;
    }

    public void render(Particle primaryParticle, List<Particle> reactingNeighbourParticles){
        for (Particle reactingNeighbourParticle : reactingNeighbourParticles) {

            String reaction = reactionData.getReaction(primaryParticle.getParticleType(), reactingNeighbourParticle.getParticleType());

            if(reaction.equalsIgnoreCase(ReactionData.REACTION_TYPE_STACK)){
                stack(primaryParticle, reactingNeighbourParticles);
            }
            if(reaction.equalsIgnoreCase(ReactionData.REACTION_TYPE_COLLAPSE)){
                collapse(primaryParticle, reactingNeighbourParticles);
            }
            if(reaction.equalsIgnoreCase(ReactionData.REACTION_TYPE_EXPLODE)){
                explode(primaryParticle, reactingNeighbourParticles);
            }
            if(reaction.equalsIgnoreCase(ReactionData.REACTION_TYPE_REPEL)){
                repel(primaryParticle, reactingNeighbourParticles);
            }
        }
    }

    private void stack(Particle primaryParticle, List<Particle> reactingNeighbourParticles){
        System.out.println(ReactionData.REACTION_TYPE_STACK);
    }

    private void collapse(Particle primaryParticle, List<Particle> reactingNeighbourParticles){
        System.out.println(ReactionData.REACTION_TYPE_COLLAPSE);
    }

    private void explode(Particle primaryParticle, List<Particle> reactingNeighbourParticles){
        System.out.println(ReactionData.REACTION_TYPE_EXPLODE);
    }

    private void repel(Particle primaryParticle, List<Particle> reactingNeighbourParticles){
        System.out.println(ReactionData.REACTION_TYPE_REPEL);
    }
}
