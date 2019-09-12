import java.util.*;
    
    private List<Particle> particles;
    private int counter;
    private int choice;
    private ReactionData reactionData;

    public void setup () {
        particles = new ArrayList<Particle>();
        counter = 0;
        choice = 0;
        reactionData = new ReactionData();
        size(800,600);

        /* EXAMPLE OF HOW TO USE A CLASS THROUGH A PUBLIC METHOD */
        System.out.println(reactionData.getReaction("Blue", "Green"));
    }

    public void keyPressed(){
        if(keyCode == UP){
            choice++;
        }
        if(keyCode == DOWN){
            choice--;
        }
    }

    public void draw() {
        background(1);

        if(mousePressed){
            counter++;

            if(choice == 0){
                fill(5,40,233);
            }
            if(choice == 1){
                fill(3,200,133);
            }
            if(counter == 2){
                particles.add(new Particle(this, mouseX, mouseY, choice));
            }
        }

        if(counter == 3){
            counter = 0;
        }

        for(Particle particle :particles) {
            particle.render(choice);
            particle.collision();
        }
    }
