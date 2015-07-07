
printf ("-----------------------------------------------------\n");
filename = "C:\\Octave\\entrada.dat";
printf (filename);
printf("\n");

M= csvread(filename);

printf ("-----------------------------------------------------\n");

[nRows, nCols] = size(M);

mOutput = M(:,end);
mInput = M(:,1:end-1);

mData = [mInput mOutput];


[mTrain,mTest,mVali] = subset(mData',1);

[mTrainInputN, cMeanInput,cStdInput] = prestd(mTrain(1:end-1,:));


mMinMaxElements = min_max(mTrainInputN);

nHiddenNeurons = 1;
nOutputNeurons = 1;

MLPnet = newff(nMinMaxElements,[nHiddenNeurons, nOutputNeurons]), {"tansig","purelin"},"trainlm","","mse");


saveMLPStruct(MLPnet,"MLP3test.txt");

#MLPnet.IW{1,1}(:) = 1.5;
#MLPnet.LW{2,1}(:) = 0.5;
#MLPnet.b{1,1}(:) = 1.5;
#MLPnet.b{2,1}(:) = 0.5;

## define validation data new, for matlab compatibility
VV.P = mValiInput;
VV.T = mValliOutput;

## standardize also the validate data
VV.P = trastd(VV.P,cMeanInput,cStdInput);

[net] = train(MLPnet,mTrainInputN,mTrainOutput,[],[],VV);

# make preparations for net test and test MLPnet
#  standardise input & output test data
[mTestInputN] = trastd(mTestInput,cMeanInput,cStdInput);

[simOut] = sim(net,mTestInputN);
simOut

printf ("-----------------------------------------------------\n");



printf ("\n\nFim\n");