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
            particles.getParticlesToDelete().add(reactingParticle);
        }
    }

    private void explode(Particle primaryParticle, List<Particle> reactingParticles){
//        System.out.println(ReactionData.REACTION_TYPE_EXPLODE);
    }

    private void repel(Particle primaryParticle, List<Particle> reactingParticles){
//        for (Particle reactingParticle : reactingParticles) {
//            if(reactingParticle.getType().equalsIgnoreCase(Particles.PARTICLE_TYPE_RED) && !primaryParticle.getFalling() && primaryParticle.getYVelocity() == 0){
//                primaryParticle.setYVelocity((float) (primaryParticle.getYVelocity() + .1));
//
//                primaryParticle.setYPosition(primaryParticle.getYPosition() - primaryParticle.getYVelocity());
//            }
//        }
        //primaryParticle.setYVelocity(0);
        //primaryParticle.setYVelocity(primaryParticle.getYVelocity() + primaryParticle.getAcceleration());
//        primaryParticle.setYPosition(primaryParticle.getYPosition() - primaryParticle.getYVelocity() + primaryParticle.getAcceleration());
        for (Particle reactingParticle : reactingParticles) {
            reactingParticle.setYPosition(reactingParticle.getYPosition() - 10);
        }
        primaryParticle.setYPosition(primaryParticle.getYPosition() - 10);
    }
}
