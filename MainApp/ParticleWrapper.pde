import processing.core.PApplet;

public class Particle {
    /* Constant String representations of all the particle types */
    public static final String PARTICLE_TYPE_RED = "particleTypeRed";
    public static final String PARTICLE_TYPE_GREEN = "particleTypeGreen";
    public static final String PARTICLE_TYPE_BLUE = "particleTypeBlue";

    private final ReactionData reactionData = new ReactionData();
    private final PApplet mainApp;

    private String particleType;
    private float xPosition;
    private float yPosition;
    private float radius;
    private float xVelocity;
    private float yVelocity;

    Particle(PApplet mainApp, String particleType, float xPosition, float yPosition) {
        this.mainApp = mainApp;
        this.particleType = particleType;
        this.xPosition = xPosition;
        this.yPosition = yPosition;

        // Different particleTypes may have different properties
        if(particleType.equalsIgnoreCase(PARTICLE_TYPE_RED)){
            this.radius = 5;
            this.xVelocity = (float) 1.5;
            this.yVelocity = (float) 0;
        }
        if(particleType.equalsIgnoreCase(PARTICLE_TYPE_GREEN)){
            this.radius = 5;
            this.xVelocity = (float) 1;
            this.yVelocity = (float) 0;
        }
        if(particleType.equalsIgnoreCase(PARTICLE_TYPE_BLUE)){
            this.radius = 5;
            this.xVelocity = (float) 0.5;
            this.yVelocity = (float) 0;
        }
    }

    public void render(String particleType) {
        final float particleDiameter = radius * 2;

        // Set the selected particleType to it's appropriate color
        if (particleType.equalsIgnoreCase(PARTICLE_TYPE_RED)) {
            mainApp.fill(255, 0, 0);
        }
        if (particleType.equalsIgnoreCase(PARTICLE_TYPE_GREEN)) {
            mainApp.fill(0, 255, 0);
        }
        if (particleType.equalsIgnoreCase(PARTICLE_TYPE_BLUE)) {
            mainApp.fill(0, 0, 255);
        }

        // Draw the selected particleType
        mainApp.ellipse(xPosition, yPosition, particleDiameter, particleDiameter);

        // Increment fall velocity every second
        yVelocity += .098;
        // Make the particle fall
        yPosition = yPosition + yVelocity;
    }

    // todo: Liam, this needs to be refactored
    public void collision() {
        if (yPosition > 550) {
            yPosition = 550;
            yVelocity = 0;
            yVelocity *= -1;
        }

        if (xPosition < 50) {
            xPosition = 50;
            xVelocity = (float) .5;
            xVelocity *= -1;
        }

        if (xPosition > 650) {
            xPosition = 650;
            xVelocity -= .5;
            xVelocity *= -1;
        }
    }

    private void react(String particleType1, String particleType2){
        String reaction = reactionData.getReaction(particleType1, particleType2);

        if(reaction.equalsIgnoreCase(ReactionData.REACTION_TYPE_STACK)){

        }
        if(reaction.equalsIgnoreCase(ReactionData.REACTION_TYPE_COLLAPSE)){

        }
        if(reaction.equalsIgnoreCase(ReactionData.REACTION_TYPE_EXPLODE)){

        }
        if(reaction.equalsIgnoreCase(ReactionData.REACTION_TYPE_REPEL)){

        }
    }
}
