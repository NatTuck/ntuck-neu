+++
title = "Week 9: Camera"
weight = 9
+++

## HW08: CameraBot

 - Launch Sim
 - Show sensor cones
 - Launch starter code
 - Show image
 - Move robot around, show image changing

Strategy points:

 - You're supposed to use the camera data for mapping.
 - Especially good strategy: draw rays from bottom center of picture
   and just detect the ground. You can probably get away with color
   thresholding. You'll need some math to translate pixel locations to
   world locations.

## Image Processing with OpenCV

Note that the Debian package puts examples in /usr/share/doc/opencv-doc/examples

Show some example programs working on the brick wall image:

 - Edge Detection
 - Hough Lines
 - Connected Components
 
Livecode the genmat example.

