let img;
let vid;
let theta = 0;
let song;

function preload() {
    song = loadSound('assets/oh.mp3');
}


function setup() {
    createCanvas(710, 400, WEBGL);

    song.loop();

    vid = createVideo(['assets/oh.mp4']);
    vid.elt.muted = true;
    vid.loop();
    vid.hide();
    background(74);
}

function draw() {

    translate(0, 0, 0);

    push();
    //rotateZ(mouseX * 0.1);
    rotateX(mouseY * 0.1);
    rotateY(theta * 0.1);
    texture(vid);
    sphere(150);
    pop();

    theta += 0.05;
}

function mousePressed() {
    if (song.isPlaying()) {
        // .isPlaying() returns a boolean
        song.pause(); // .play() will resume from .pause() position
        background(255);
    } else {
        song.play();
        background(74);
    }
}

