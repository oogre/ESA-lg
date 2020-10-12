 
// declarer une variable police
PFont SavateFont;
PFont CourierFont;

// importer la librairie PDF
import processing.pdf.*;
// importer la librairie son
import processing.sound.*;

// declarer variables sound
SoundFile moncri;
SoundFile bip;
Amplitude amp;
AudioIn in;

  float a = 0;
  float b = 0;


void setup(){
  
smooth();                         // Anti aliasing the renders
 // frameRate(20);
  
  // Load a soundfile from the /data folder of the sketch and play it back
  moncri = new SoundFile(this, "cri_mort.mp3");
  bip = new SoundFile(this, "start.wav");
  
  
// Create an Input stream which is routed into the Amplitude analyzer
  amp = new Amplitude(this);
//  in = new AudioIn(this, 0);
 // in.start();
  amp.input(moncri);



beginRecord(PDF, "still_alive_OE.pdf");
SavateFont = createFont("savate-regular.otf", 48);
CourierFont = createFont("CourierStd.otf", 24);
textFont(SavateFont);
size(421,596);
background(#D6FFAE);

}


void draw(){
  
 int fort = int(amp.analyze()*2000);
 float less = map(fort, 0, 800, 1, 1.3);
 //println("fort = "+fort);
  println("less = "+less);
  stroke(255);
 strokeWeight(random(1));
 
  noFill();
  stroke(255,0,0);
 // ellipse(width/2,height/2,fort,fort);
  ellipse(random(fort/2),fort/2,fort/10,fort/10);
  
  pushMatrix();
  //scale(4);
  translate(50*fort, random(height/2));
rotate(PI/fort);
beginShape();
vertex(20, 20);
vertex(40, 20);
vertex(40, 40);
vertex(60, 40);
vertex(60, 60);
vertex(20, 60);
endShape(CLOSE);
popMatrix();



pushMatrix();
translate(width/2+50,height/2+50);


rotate(PI/4+fort);
beginShape();
vertex(0, 10);
vertex(85, 30);
vertex(85, 70);
vertex(50, 90);
vertex(15, 70);
vertex(15, 30);
endShape(CLOSE);
popMatrix();
}

void keyPressed() {
  
  
  if (key == 'a') {
  background(#D6FFAE);
  moncri.play();
  bip.play();
  
 
  }
  
  
  if (key == 'b') {
  
  bip.play(); 
  //stopper le cri
 moncri.stop();
 


  
  a = random(10,30);
  b = random(20,40);
  
  fill(255,0,0);
  textFont(SavateFont,80);
  textLeading(70);
text("Aaaaaaaaaaahhhhhh", a, b, a+300,b+300);
textFont(SavateFont,24);
text("Still alive poster", a, b+530);
textFont(CourierFont,14);
String date = day()+" / "+month()+" / "+year()+" -- "+hour()+":"+minute()+":"+second();
text(date,a, b+550); 


text("by Olivier Evrard", a, b+230);
// stopper le pdf

   endRecord();

 //delay(3000);
  }
  
  
   if (key == 'c') {
     bip.play();
   delay(300);
   exit();
   }

 }
