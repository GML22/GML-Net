# GML-Net
<p align="justify">
The GML-Net is a convolutional neural network (CNN) that is based on U-Net architecture with an encoder derived from the ResNet family and BottleNeck blocks that provide reading and aggregation of feature maps from a cross-section of various scales. Effective network learning is ensured by loss function defined as a weighted sum of Binary Cross-Entropy Loss, Dice Loss and Lovász hinge Loss.
</p>

<p align="center">
  <img width=75% height=75% src="/Images/GML-Net Architecture.svg"/>
</p>

<p align="justify">
The GML-Net was developed to address the problem of detecting buildings in RGB aerial images. It was trained on <i>Inria Aerial Image Labeling Dataset</i> (https://project.inria.fr/aerialimagelabeling) achiving 96.23% of Overall Acuurency (1.02% behind State of Art) and 74.42% of Intersecion over Union (6.64% behind SoA) - https://project.inria.fr/aerialimagelabeling/leaderboard.
</p>

<p float="left" align="center">
  <img width=30% height=30% src="/Images/Ground_truth_mask.png" rel="shortcut icon"/>
  <img width=30% height=30% src="/Images/GML_Net_mask_prediction.png" rel="shortcut icon"/>
</p>

Solarized dark             |  Solarized Ocean
:-------------------------:|:-------------------------:
![](/Images/Ground_truth_mask.png)  |  ![](/Images/GML_Net_mask_prediction.png)
