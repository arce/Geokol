float coords[];
float bounds[];
int items[];
int sizes[];
int n = 0;
int m = 0;
float w = 640;
float h = 480;
float scaleFactor = 1;
Table data;

void setup() {
  size(640, 480);
  background(255);
  loadBNA("usa_states.bna");
  bounds = computeBounds();
  data = loadTable("usa_states.csv");
}

float[] computeBounds() {
  float bounds[] = {coords[0], coords[0], coords[1], coords[1]};
  for (int i=1; i<n; i++) {
    if (bounds[0] > coords[i*2]) bounds[0] = coords[i*2];
    if (bounds[1] < coords[i*2]) bounds[1] = coords[i*2];
    if (bounds[2] > coords[i*2+1]) bounds[2] = coords[i*2+1];
    if (bounds[3] < coords[i*2+1]) bounds[3] = coords[i*2+1];
  }
  return bounds;
}

void loadBNA(String filename) {
  String lines[] = loadStrings(filename);
  String tokens[];
  coords = new float[lines.length*2];
  sizes = new int[lines.length/2];
  items = new int[lines.length/2];
  for (int l=0; l<lines.length; l++) {
    tokens = splitTokens(lines[l], ",");
    if (tokens.length==3) {
      items[m] = n;
      sizes[m] = abs(int(tokens[2]));
      m++;
    } else {
      coords[n*2] = float(tokens[0]);
      coords[n*2+1] = float(tokens[1]);
      n++;
    }
  }
}

void draw() {
  background(255);
  int k = 0;
  translate(w/2, h/2);
  scale(scaleFactor);
  float minScale = Math.min(w/(bounds[1]-bounds[0]),h/(bounds[3]-bounds[2]));
  scale(minScale,-minScale);
  strokeWeight(1/minScale);
  translate(-bounds[0]-(bounds[1]-bounds[0])/2, -bounds[2]-(bounds[3]-bounds[2])/2);
  for (int i=0; i<m; i++) {
    beginShape();
    k = items[i];
    for (int j=0; j<sizes[i]; j++) {
      vertex(coords[k*2],coords[k*2+1]);
      k++;
    }
    endShape(CLOSE);
  }
}

void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  scaleFactor =  scaleFactor + e / 100;
  if (scaleFactor < 0.5) scaleFactor = 0.5;
  if (scaleFactor > 2.0) scaleFactor = 2.0;
}
