let yoff = 0.0; // 2nd dimension of perlin noise

let r, g, b;

let l = 0;

let song;

let totalPts = 300;
let steps = totalPts + 1;

function setup() {
    createCanvas(710, 400);

    song = loadSound('assets/420.mp3');

    r = random(255);
    g = random(255);
    b = random(255);
    frameRate(30);

}

function draw() {
    background(31, 27, 60);

    strokeWeight(2);
    stroke(r, g, b);
    fill(r, g, b, 127);
    ellipse(360, 100, 200, 200);
    
    stroke(87, 32, 195);
    fill(255, 25, 183);
    beginShape();
    vertex(0, 172);
    vertex(46, 192);
    vertex(140, 168);
    vertex(203, 180);
    vertex(255, 171);
    vertex(303, 137);
    vertex(352, 150);
    vertex(388, 130);
    vertex(411, 111);
    vertex(483, 166);
    vertex(525, 146);
    vertex(548, 184);
    vertex(617, 196);
    vertex(669, 172);
    vertex(710, 188);
    vertex(711, 399);
    vertex(0, 399);
    vertex(0, 172);
    endShape();

    noStroke();
    fill(47, 28, 92);
    // We are going to draw a polygon out of the wave points
    beginShape();

    //let xoff = 0; // Option #1: 2D Noise
    let xoff = yoff; // Option #2: 1D Noise

    // Iterate over horizontal pixels
    for (let x = 0; x <= width; x += 10) {
        // Calculate a y value according to noise, map to

        // Option #1: 2D Noise
        let y = map(noise(xoff, yoff), 0, 1, 200, 300);

        // Option #2: 1D Noise
        // let y = map(noise(xoff), 0, 1, 200,300);

        // Set the vertex
        vertex(x, y);
        // Increment x dimension for noise
        xoff += 0.05;
    }
    // increment y dimension for noise
    yoff += 0.01;
    vertex(width, height);
    vertex(0, height);
    endShape(CLOSE);

    stroke(255);
    line(0, l, 710, l);
    l++;
    if (l > 400) {
        l = 1;
    }

    let rand = 0;
    for (let i = 1; i < steps; i++) {
        point((width / steps) * i, height / 2 + random(-rand, rand));
        rand += random(-30, 30);
    }

}

function mousePressed() {
    // Check if mouse is inside the circle
    let d = dist(mouseX, mouseY, 360, 200);
    if (d < 100) {
        // Pick new random color values
        r = random(255);
        g = random(255);
        b = random(255);
    }

    if (song.isPlaying()) {
        // .isPlaying() returns a boolean
        song.stop();
    } else {
        song.play();
    }
}
