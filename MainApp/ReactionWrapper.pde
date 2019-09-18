import processing.core.PApplet;

import java.util.*;

public class Reaction {
    private final PApplet mainApp;

    private ReactionData reactionData = new ReactionData();

    Reaction(PApplet mainApp){
        this.mainApp = mainApp;
    }

    public void react(String fallParticle, List<String> particleTypesTheNewParticleLandsOn){
        for (String typeTheNewParticleLandsOn : particleTypesTheNewParticleLandsOn) {
            String reaction = reactionData.getReaction(fallParticle, typeTheNewParticleLandsOn);

            if(reaction.equalsIgnoreCase(ReactionData.REACTION_TYPE_STACK)){
                stack();
            }
            if(reaction.equalsIgnoreCase(ReactionData.REACTION_TYPE_COLLAPSE)){
                collapse();
            }
            if(reaction.equalsIgnoreCase(ReactionData.REACTION_TYPE_EXPLODE)){
                explode();
            }
            if(reaction.equalsIgnoreCase(ReactionData.REACTION_TYPE_REPEL)){
                repel();
            }
        }
    }

    private void stack(){

    }

    private void collapse(){

    }

    private void explode(){

    }

    private void repel(){

    }
}

