import processing.core.PApplet;

import java.util.ArrayList;
import java.util.List;

public class Particles {
    private final PApplet mainApp;

    private final List<Particle> particles = new ArrayList<Particle>();
    private final Reactions reactions;

    Particles(PApplet mainApp){
        this.mainApp = mainApp;
        reactions = new Reactions(mainApp);
    }

    public void render(){
        for(Particle particle : particles) {
            // render each particle
            particle.render();

            // Make particles react with their neighbours
            List<Particle> neighbourParticles = getNeighbourParticles(particle);
            // todo: do particles need to be stationary?
            reactions.render(particle, neighbourParticles);
        }
    }

    public void addNewParticle(String particleType){
        Particle newParticle = new Particle(mainApp, particleType, mainApp.mouseX, mainApp.mouseY);
        particles.add(newParticle);
    }

    /**
     * Get the neighbour particles in contact with the given @param particle
     * @param primaryParticle the Particle to get the neighbours of
     */
    private List<Particle> getNeighbourParticles(Particle primaryParticle){
        List<Particle> neighbourParticles = new ArrayList<Particle>();
        // because this loops over all the particles, it will also include the primary particle

        for (Particle particle : particles) {
            // todo: check if this is needed here
            if(particle.equals(primaryParticle)){
                continue;
            }
            if(particlesAreInContact(particle, primaryParticle)) {
                neighbourParticles.add(particle);
            }
        }
        return neighbourParticles;
    }

    // todo: revise logic in this method(particle1.getXPosition(), particle1.getYPosition(), particle2.getXPos
    /**
     * Returns true if two particles are in contact with each other, otherwise returns false
     * @param particle1 the first Particle
     * @param particle2 the second Particle
     * @return a boolean value
     */
    private boolean particlesAreInContact(Particle particle1, Particle particle2){
        return MainApp.dist(particle1.getXPosition(), particle1.getYPosition(), particle2.getXPosition(), particle2.getYPosition())
                <= particle1.getRadius() + particle2.getRadius();
    }

    /**
     * Remove a single obsolete particle from the particles list
     * Use this method if only removing a single particle as it is more efficient than removing a list at once
     * @param obsoleteParticle the obsolete particle
     */
    private void removeParticle(Particle obsoleteParticle){
        for (Particle particle : particles) {
            if(particle.equals(obsoleteParticle)){
                particles.remove(obsoleteParticle);
            }
        }
    }

    /**
     * Remove a list of obsolete particles from the particles list
     * Use this for removing multiple particles at once, it efficient than removing a single particle at a time but necessary for some reactions
     * @param obsoleteParticles a list of obsolete particles to be deleted from the particles list
     */
    private void removeParticles(List<Particle> obsoleteParticles){
        for (Particle particle : particles) {
            for (Particle obsoleteParticle : obsoleteParticles) {
                if(particle.equals(obsoleteParticle)){
                    particles.remove(obsoleteParticle);
                }
            }
        }
    }

    /**
     * Sets the limit of the amount of particles, for performance purposes
     * If amount of particles goes over the set limit, remove particles from the particles list in a first in first out queue like order
     * @param maxNumberOfParticles the maximum number of particles before the system starts deleting them
     */
    public void setParticleLimit(int maxNumberOfParticles){
        if(particles.size() > maxNumberOfParticles){
            particles.remove(particles.get(0));
        }
    }

    public List<Particle> getParticles(){
        return particles;
    }
}
