%augimdsValidation = imageDatastore('images-val-pub', 'IncludeSubfolders', true, 'FileExtensions', '.jpg', 'LabelSource', 'foldernames');
imds = imageDatastore('images-val-pub', 'IncludeSubfolders', true, 'FileExtensions', '.jpg', 'LabelSource', 'foldernames');
%[imdsTrain,imdsValidation] = splitEachLabel(imds,0.7,'randomized');
net = alexnet;
inputSize = net.Layers(1).InputSize;
augimdsValidation = augmentedImageDatastore(inputSize(1:2),imds);



%[YPred,scores] = classify(netTransfer,augimdsValidation);
[data,info] = read(augimdsValidation);
idx = randperm(numel(info.Filename),4);
figure
for i = 1:4
    subplot(2,2,i)
    I = cell2mat(table2cell(data(idx(i),1)));
    imshow(I)
    label = YPred(idx(i));
    title(string(label));
end