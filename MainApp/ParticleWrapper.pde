import processing.core.PApplet;

/**
 * This class represents a single particle in the application
 */
public class Particle {
    private final PApplet mainApp;

    private final float acceleration = 0.1f;

    private String type;
    private float xPosition;
    private float yPosition;
    private float radius;
    private float yVelocity;
    private boolean falling;

    Particle(PApplet mainApp, String particleType, float xPosition, float yPosition) {
        this.mainApp = mainApp;
        this.type = particleType;
        this.xPosition = xPosition;
        this.yPosition = yPosition;

        // Different particleTypes may have different properties
        if(particleType.equalsIgnoreCase(Particles.PARTICLE_TYPE_RED)){
            this.radius = 5;
            this.yVelocity = (float) 1;
        }
        if(particleType.equalsIgnoreCase(Particles.PARTICLE_TYPE_GREEN)){
            this.radius = 5;
            this.yVelocity = (float) 1;
        }
        if(particleType.equalsIgnoreCase(Particles.PARTICLE_TYPE_BLUE)){
            this.radius = 5;
            this.yVelocity = (float) 1;
        }

        falling = true;
    }

    public void render() {
        final float particleDiameter = radius * 2;

        // Set the selected particleType to it's appropriate color
        if (type.equalsIgnoreCase(Particles.PARTICLE_TYPE_RED)) {
            mainApp.fill(255, 0, 0);
        }
        if (type.equalsIgnoreCase(Particles.PARTICLE_TYPE_GREEN)) {
            mainApp.fill(0, 255, 0);
        }
        if (type.equalsIgnoreCase(Particles.PARTICLE_TYPE_BLUE)) {
            mainApp.fill(0, 0, 255);
        }

        // Draw the selected particleType
        mainApp.ellipse(xPosition, yPosition, particleDiameter, particleDiameter);

        if(falling) {
            simulateFalling();
        }
    }

    private void simulateFalling() {
        // Increment fall velocity every second
        yVelocity += acceleration;
        // Make the particle fall
        yPosition = yPosition + yVelocity;

        // todo: investigate why we need to - 50 from displayHeight this to work
        if (yPosition > mainApp.displayHeight - 50) {
            yPosition = mainApp.displayHeight - 50;
            //yVelocity = 0;
            falling = false;
        }
    }

    // todo: seems to be inconsistent
    /**
     * Make an explosion before collapsing
     */
    public void collapse(){
        this.radius = radius * 2;
    }

    public String getType(){
        return type;
    }

    public float getXPosition(){
        return xPosition;
    }

    public float getYPosition() {
        return yPosition;
    }

    public void setYPosition(float yPosition) {
        this.yPosition = yPosition;
    }

    public float getRadius(){
        return radius;
    }

    public float getYVelocity(){
        return yVelocity;
    }

    public void setYVelocity(float yVelocity){
        this.yVelocity = yVelocity;
    }

    public boolean getFalling(){
        return falling;
    }

    public void setFalling(boolean falling){
        this.falling = falling;
    }

    public float getAcceleration(){
        return acceleration;
    }
}