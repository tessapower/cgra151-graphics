import java.awt.*;
import java.util.Random;
import java.util.function.IntConsumer;
import java.util.ArrayList;
import java.util.Iterator;

public class GameWorld {
    private final IntConsumer gameOverNotifier;
    private final GameState gameState;

    // private final GeometeroidsGenerator geometeroids;

    // private final HeadsUpDisplay hud;

    private List<Bullet> bullets = new ArrayList<>();
    private int bulletsCooldown = 0;

    private Player playerOne;

    public GameWorld(IntConsumer gameOverNotifier, GameState gameState) {
        this.gameOverNotifier = gameOverNotifier;
        this.gameState = gameState;

        // HUD
        // hud = new HeadsUpDisplay(this);

        // Player
        playerOne = new Player();

        // Geometeroids Generator
        // geometeroids = new GeometeroidsGenerator(this);
    }

    public void update(int frameCount) {
        // hud.update();
        playerOne.update(frameCount);

        for (Iterator<Bullet> it = bullets.iterator(); it.hasNext(); ) {
            var bullet = it.next();
            bullet.update();
            if (bullet.isOffScreen()) {
                it.remove();
            }
        }

        // geometeroids.update(int frameCount);
        handleCollisions();

        bulletsCooldown--;
        bulletsCooldown = Math.max(bulletsCooldown, 0);

        background(0);
        // hud.draw();
        playerOne.draw();
        bullets.forEach(b -> b.draw());
        // geometeroids.draw();
    }

    public void handleKeyPressed(int keyCode) {
        switch(keyCode) {
            case KeyEvent.VK_LEFT:
                playerOne.turnLeft();
                break;
            case KeyEvent.VK_RIGHT:
                playerOne.turnRight();
                break;
            case KeyEvent.VK_UP:
                playerOne.accelerate();
                break;
            case KeyEvent.VK_SPACE:
                if (bulletsCooldown == 0) {
                    bullets.add(playerOne.fire());
                    bulletsCooldown = 5;
                }
                break;
        }
    }

    public void handleKeyReleased(int keyCode) {
        switch(keyCode) {
            case KeyEvent.VK_UP:
                playerOne.decelerate();
                break;
            // case KeyEvent.VK_LEFT:
            //     playerOne.stopTurningLeft();
            //     break;
            // case KeyEvent.VK_RIGHT:
            //     playerOne.stopTurningRight();
            //     break;
        }
    }

    public void handleCollisions() {
        // Check for collisions between player and Geometeroids
        // for (Geometeroid geometeroid : geometeroids.asList()) {
        //     if (playerOne.collidesWith(geometeroid)) {
        //         playerOne.loseALife();
        //
        //         if (playerOne.isDead()) {
        //              gameOverNotifier.accept(gameState.score());
        //         }
        //     }
        // }

        // Check for collisions between player bullets and Geometeroids
        // for (Iterator<Bullet> bulletIterator = bullets.iterator(); it.hasNext(); ) {
        //     var bullet = bulletIterator.next();
        //     for (Iterator<Geometeroid> geomIterator = geometeroids.asList().iterator(); geomIt.hasNext(); ) {
        //         var geometeroid = geomIterator.next();
        //         // TODO: Create bullet class with overlap detection
        //         if (geometeroid.collidesWith(bullet)) {
        //             bulletIterator.remove();
        //             // TODO: add new geometeroids to the spawning system
        //             geometeroid.hit();

        //             if (geometeroid.isDestroyed()) {
        //                 explosions.add(new Explosion(geometeroid.location()));

        //                 geomIterator.remove();
        //             }

        //             break;
        //         }
        //     }
        // }
    }
}
