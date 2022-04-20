# GML-Net

*[This project was implemented in September 2020]*

<p align="justify">
The GML-Net is a convolutional neural network (CNN) that is based on U-Net architecture with an encoder derived from the ResNet family and BottleNeck blocks that provide reading and aggregation of feature maps from a cross-section of various scales. Architecture of GML-Net is presented in the picture below:
</p>

<p align="center">
  <img width=75% height=75% src="GML-Net Architecture.svg"/>
</p>

<p align="justify">
The GML-Net was developed to address the problem of detecting buildings in RGB aerial images. It was trained on <i>Inria Aerial Image Labeling Dataset</i> (https://project.inria.fr/aerialimagelabeling) which consist of 180 color image tiles of size 5000×5000, covering a surface of 1500 m × 1500 m each (at a 30 cm resolution) of 5 cities: Austin, Chicago, Kitsap County, Western Tyrol and Vienna. Each 5000x5000 image was divided into 1444 overlapping samples with resolution 256x256 for which GML-Net generated the predictions of masks. The resulting 1444 predictions were joined into 5000x5000 final mask using Hann 2D windows - weight matrices which focus on central part of 256x256 sample reducing impact of possible weak predictions on the edges.

1444 overlaping samples             |  Hann 2D windows
:-------------------------:|:-------------------------:
![](/Images/1444_samples.png)  |  ![](/Images/2D_Hann_windows.png)
  
<p align="justify">
Effective network learning of GML-Net was ensured by loss function defined as a weighted sum of Binary Cross-Entropy Loss (BCE), Dice Loss (DL) and Lovász hinge Loss (LHL) according to formula:
</p>

<p align="center">
  <b>LF = 0.3 * BCE + 0.4 * DL + 0.3 * LHL</b>
</p>
 
The GML-Net achived 96.23% of Overall Acuurency (1.02% behind the State of Art) and 74.42% of Intersecion over Union (6.64% behind SoA) - detailed leaderboard of <i>Inria Aerial Image Labeling Dataset</i> contest is available at: https://project.inria.fr/aerialimagelabeling/leaderboard.
</p>

INRIA ground truth mask             |  Mask generated by GML-Net
:-------------------------:|:-------------------------:
![](/Images/Ground_truth_mask.png)  |  ![](/Images/GML_Net_mask_prediction.png)

The GML-Net was developed as a part of diploma thesis at "Deep Neural Networks - Applications in Digital Media" postgraduate studies at Warsaw University of Technology (https://deeplearning.ire.pw.edu.pl).
