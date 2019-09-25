import processing.core.PApplet;

import java.util.List;

public class Reactions {
    private final PApplet mainApp;

    private final Particles particles;
    private final ReactionData reactionData = new ReactionData();

    Reactions(PApplet mainApp, Particles particles){
        this.mainApp = mainApp;
        this.particles = particles;
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
        for (Particle reactingNeighbourParticle : reactingNeighbourParticles) {
            // if all neighbour particles are not falling and p
            if(reactingNeighbourParticle.getYVelocity() == 0){
                primaryParticle.setYVelocity(0);
            }
        }
    }

    // todo: fix this ConcurrentModificationException
    private void collapse(Particle primaryParticle, List<Particle> reactingNeighbourParticles){
//        for (Particle reactingNeighbourParticle : reactingNeighbourParticles) {
//            reactingNeighbourParticle.collapse();
//            particles.removeParticle(reactingNeighbourParticle);
//        }
    }

    private void explode(Particle primaryParticle, List<Particle> reactingNeighbourParticles){
//        System.out.println(ReactionData.REACTION_TYPE_EXPLODE);
    }

    private void repel(Particle primaryParticle, List<Particle> reactingNeighbourParticles){
//        System.out.println(ReactionData.REACTION_TYPE_REPEL);
    }
}
