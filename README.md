# GML-Net
<p align="justify">
The GML-Net is a convolutional neural network (CNN) that is based on U-Net architecture with an encoder derived from the ResNet family and BottleNeck blocks that provide reading and aggregation of feature maps from a cross-section of various scales.
</p>

<p align="center">
  <img width=75% height=75% src="GML-Net Architecture.svg"/>
</p>

<p align="justify">
The GML-Net was developed to address the problem of detecting buildings in RGB aerial images. It was trained on <i>Inria Aerial Image Labeling Dataset</i> (https://project.inria.fr/aerialimagelabeling) achiving 96.23% of Overall Acuurency (1.02% behind State of Art) and 74.42% of Intersecion over Union (6.64% behind SoA) - detailed leaderboard of <i>Inria Aerial Image Labeling Dataset</i> contest is available at: https://project.inria.fr/aerialimagelabeling/leaderboard.
</p>

INRIA ground truth mask             |  Mask generated by GML-Net
:-------------------------:|:-------------------------:
![](/Images/Ground_truth_mask.png)  |  ![](/Images/GML_Net_mask_prediction.png)

<p align="justify">
Effective network learning of GML-Net was ensured by loss function defined as a weighted sum of Binary Cross-Entropy Loss (BCE), Dice Loss (DL) and Lovász hinge Loss (LHL) according to formula:
</p>

<img src="https://latex.codecogs.com/svg.latex?\Large&space;x=\frac{-b\pm\sqrt{b^2-4ac}}{2a}" title="\Large x=\frac{-b\pm\sqrt{b^2-4ac}}{2a}" />
