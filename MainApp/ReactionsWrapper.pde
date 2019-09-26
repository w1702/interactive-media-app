import java.util.List;

/**
 * This class executes reactions between particles in the application
 */
public class Reactions {
    private final Particles particles;
    private final ReactionData reactionData = new ReactionData();

    Reactions(Particles particles){
        this.particles = particles;
    }

    public void render(Particle primaryParticle, List<Particle> reactingNeighbourParticles){
        for (Particle reactingNeighbourParticle : reactingNeighbourParticles) {

            String reaction = reactionData.getReaction(primaryParticle.getType(), reactingNeighbourParticle.getType());

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
            if(reactingNeighbourParticle.getYVelocity() == 0){
                primaryParticle.setYVelocity(0);
            }
        }
    }

    private void collapse(Particle primaryParticle, List<Particle> reactingNeighbourParticles){
        for (Particle reactingNeighbourParticle : reactingNeighbourParticles) {
            particles.getParticlesToDelete().add(reactingNeighbourParticle);
        }
    }

    private void explode(Particle primaryParticle, List<Particle> reactingNeighbourParticles){
//        System.out.println(ReactionData.REACTION_TYPE_EXPLODE);
    }

    private void repel(Particle primaryParticle, List<Particle> reactingNeighbourParticles){
//        System.out.println(ReactionData.REACTION_TYPE_REPEL);
    }
}
