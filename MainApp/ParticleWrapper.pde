import processing.core.PApplet;

public class Particle {
    /* Constant String representations of all the particle types */
    public static final String PARTICLE_TYPE_RED = "particleTypeRed";
    public static final String PARTICLE_TYPE_GREEN = "particleTypeGreen";
    public static final String PARTICLE_TYPE_BLUE = "particleTypeBlue";

    private PApplet mainApp;
    private ReactionData reactionData;

    private float radius;
    private float xPosition;
    private float yPosition;
    private float xVelocity;
    private float yVelocity;

    Particle(PApplet mainApp, float xPosition, float yPosition, int choiceColor) {
        reactionData = new ReactionData();
        this.mainApp = mainApp;
        this.radius = 5;
        this.xPosition = xPosition;
        this.yPosition = yPosition;
        this.xVelocity = (float) 0.98;
        this.yVelocity = 0;

        mainApp.fill(255, choiceColor, 30);
    }

    public void render(int choice) {

        float particleDiameter = radius * 2;

        if (choice == 0) {
            mainApp.fill(choice, 255, 28);
        }
        if (choice == 1) {
            mainApp.fill(0, 100, 10);
        }

        mainApp.ellipse(xPosition, yPosition, particleDiameter, particleDiameter);
        yVelocity += .098;

        yPosition = yPosition + yVelocity;
        //x=x+velocityX;
    }

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
