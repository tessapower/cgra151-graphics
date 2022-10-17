import java.awt.*;
import java.util.Random;
import java.util.function.IntConsumer;
import java.util.ArrayList;
import java.util.Iterator;

public class GameWorld {
    private final IntConsumer gameOverNotifier;
    private final GameState gameState;

    private final List<Explosion> explosions = new ArrayList<>();
    private final List<Geometeroid> geometeroids = new ArrayList<>();

    private final HeadsUpDisplay hud;

    private List<Bullet> bullets = new ArrayList<>();
    private int bulletsCooldown = 0;

    private Player player;

    public GameWorld(IntConsumer gameOverNotifier, GameState gameState) {
        this.gameOverNotifier = gameOverNotifier;
        this.gameState = gameState;

        // HUD
        hud = new HeadsUpDisplay();

        // Player
        player = new Player();

        // Geometeroids
        for (int i = 0; i < 10; i++) {
            geometeroids.add(new Geometeroid());
        }
    }

    public void update() {
        // Let everything update
        player.update();

        bullets.forEach(Bullet::update);
        bullets.removeIf(Bullet::isOffScreen);

        geometeroids.forEach(Geometeroid::update);

        explosions.forEach(Explosion::update);
        explosions.removeIf(Explosion::isDone);

        handleCollisions();

        bulletsCooldown--;
        bulletsCooldown = Math.max(bulletsCooldown, 0);

        // Draw everything to the screen
        background(Colors.BACKGROUND);

        player.draw();
        bullets.forEach(b -> b.draw());
        geometeroids.forEach(Geometeroid::draw);

        // Explosions!!
        explosions.forEach(Explosion::draw);

        hud.draw();
    }

    public void handleKeyPressed(int keyCode) {
        switch(keyCode) {
            case KeyEvent.VK_LEFT:
                player.turnLeft();
                break;
            case KeyEvent.VK_RIGHT:
                player.turnRight();
                break;
            case KeyEvent.VK_UP:
                player.accelerate();
                break;
            case KeyEvent.VK_SPACE:
                if (bulletsCooldown == 0) {
                    bullets.add(player.fire());
                    bulletsCooldown = 5;
                }
                break;
        }
    }

    public void handleKeyReleased(int keyCode) {
        if (keyCode == KeyEvent.VK_UP) {
            player.decelerate();
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
        //             if (geometeroid.isDestroyed()) {
        //                 explosions.add(geometeroid.explode());

        //                 geomIterator.remove();
        //             } else {
        //                 // TODO: add new geometeroids to the spawning system
        //                 geometeroids.split(geometeroid);
        //                 explosions.add(new Explosion(geometeroid.position(), geometeroid.getColor()));
        //             }
        //             break;
        //         }
        //     }
        // }
    }
}
