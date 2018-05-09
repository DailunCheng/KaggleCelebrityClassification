1. Install MATLAB R2018a with Computer vision toolbox and Neural Network toolbox. Preferably install Parallel Computing toolbox to use compatible CUDA GPU
2. Run trainClassifier.m and it will bring up a nice window about the progress, wait until it finishes and MATLAB will store the network in memory as "netTransfer", also we have a backup as newModel.mat
3. Run testClassifer.m and the output predictionNew.csv will be the result for the competition.
(4) Run checkClassification to randomly choose 4 pair of the prediction with its images in the test/validation set for validation