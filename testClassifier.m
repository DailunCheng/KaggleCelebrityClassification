
%classifer = load('netTransferA.mat');
jpgs = dir('images-val-pub/*.jpg');
fid = fopen('predictionsNew.csv','w');
fprintf(fid, 'image_label,celebrity_name\n');
i = 1;

imgs = imageDatastore('images-val-pub', 'IncludeSubfolders', true, 'FileExtensions', '.jpg', 'LabelSource', 'foldernames');
net = alexnet;
inputSize = net.Layers(1).InputSize;
augimdsValidation = augmentedImageDatastore(inputSize(1:2),imgs);
[YPred,scores] = classify(netTransfer,augimdsValidation);
for jpg = jpgs'
    fprintf(fid, '%s,%s\n',jpg.name, string(YPred(i)));
    %disp(string(YPred(i)))
    i = i + 1;
    %disp(i);
end
fclose(fid);