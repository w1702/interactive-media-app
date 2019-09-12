import java.util.*;

    private List<Particle> particles;
    private int counter;
    private int choice;

    public void setup () {
        size(displayWidth, displayHeight);

        particles = new ArrayList<Particle>();
        counter = 0;
        choice = 0;
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

    public void keyPressed(){
        if(keyCode == UP){
            choice++;
        }
        if(keyCode == DOWN){
            choice--;
        }
    }

    // Sets the app to fullscreen if return true
    public boolean sketchFullScreen(){
        return false;
    }
