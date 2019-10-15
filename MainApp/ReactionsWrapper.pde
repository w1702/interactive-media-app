import java.util.List;

/**
 * This class executes reactions between particles in the application
 * Done by: William
 */
public class Reactions {
    private final Particles particles;
    private final ReactionData reactionData = new ReactionData();

    Reactions(Particles particles){
        this.particles = particles;
    }

    public void render(Particle primaryParticle, List<Particle> reactingParticles){
        for (Particle reactingParticle : reactingParticles) {

            String reaction = reactionData.getReaction(primaryParticle.getType(), reactingParticle.getType());

            if(reaction.equalsIgnoreCase(ReactionData.REACTION_TYPE_STACK) && !reactingParticle.getFalling()){
                stack(primaryParticle, reactingParticles);
            }
            if(reaction.equalsIgnoreCase(ReactionData.REACTION_TYPE_COLLAPSE) && !reactingParticle.getFalling()){
                collapse(primaryParticle, reactingParticles);
            }
            if(reaction.equalsIgnoreCase(ReactionData.REACTION_TYPE_EXPLODE) && !reactingParticle.getFalling()){
                explode(primaryParticle, reactingParticles);
            }
            if(reaction.equalsIgnoreCase(ReactionData.REACTION_TYPE_REPEL) && !reactingParticle.getFalling()){
                repel(primaryParticle, reactingParticles);
            }
        }
    }

    // todo: will need to figure out a recursive solution for chaining reactions
    private void stack(Particle primaryParticle, List<Particle> reactingParticles){
        for (Particle reactingParticle : reactingParticles) {
            if(!reactingParticle.getFalling()){
                primaryParticle.setFalling(false);
            }
        }
    }

    private void collapse(Particle primaryParticle, List<Particle> reactingParticles){
        for (Particle reactingParticle : reactingParticles) {
            particles.markParticleForDeletion(reactingParticle);
        }
    }

    private void explode(Particle primaryParticle, List<Particle> reactingParticles){
       final float primaryParticleMaximumRadius = primaryParticle.getRadius() * 2;
       final float reactingParticlesMaximumRadius = reactingParticles.iterator().next().getRadius() * 2;
       final float explodeSpeed = (float) 0.5;

       primaryParticle.setRadius(primaryParticle.getRadius() + explodeSpeed);
        for (Particle reactingParticle : reactingParticles) {
            reactingParticle.setRadius(reactingParticle.getRadius() + explodeSpeed);
        }

        if(primaryParticle.getRadius() == primaryParticleMaximumRadius){
            particles.markParticleForDeletion(primaryParticle);
        }
        for (Particle reactingParticle : reactingParticles) {
            if(reactingParticle.getRadius() == reactingParticlesMaximumRadius){
                particles.markParticleForDeletion(reactingParticle);
            }
        }
    }

    private void repel(Particle primaryParticle, List<Particle> reactingParticles){
        for (Particle reactingParticle : reactingParticles) {
            reactingParticle.setYPosition(reactingParticle.getYPosition() - 10);
        }
        primaryParticle.setYPosition(primaryParticle.getYPosition() - 10);
    }
}