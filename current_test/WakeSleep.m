 % UP-DOWN ALGORITHM
 % 辛顿大神的用于微调 非监督学习的DBN神经网络的WakeSleep 伪码，注意是伪码！！！
 % the data and all biases are row vectors.
 % the generative model is: lab <--> top <--> pen --> hid --> vis
 % the number of units in layer foo is numfoo
 % weight matrices have names fromlayer tolayer
 % "rec" is for recognition biases and "gen" is for generative
 % biases.
 % for simplicity, the same learning rate, r, is used everywhere.

 % PERFORM A BOTTOM-UP PASS TO GET WAKE/POSITIVE PHASE
 % PROBABILITIES AND SAMPLE STATES
wakehidprobs = logistic(data*vishid + hidrecbiases);
wakehidstates = wakehidprobs > rand(1, numhid);
wakepenprobs = logistic(wakehidstates*hidpen + penrecbiases);
wakepenstates = wakepenprobs > rand(1, numpen);
wakeopprobs = logistic(wakepenstates*pentop + targets*labtop +topbiases);
wakeopstates = wakeopprobs > rand(1, numtop);
% POSITIVE PHASE STATISTICS FOR CONTRASTIVE DIVERGENCE
poslabtopstatistics = targets' * waketopstates;
pospentopstatistics = wakepenstates' * waketopstates;
 % PERFORM numCDiters GIBBS SAMPLING ITERATIONS USING THE TOP LEVEL
 % UNDIRECTED ASSOCIATIVE MEMORY
negtopstates = waketopstates; % to initialize loop
for iter=1:numCDiters
negpenprobs = logistic(negtopstates*pentop' + pengenbiases);
negpenstates = negpenprobs > rand(1, numpen);
neglabprobs = softmax(negtopstates*labtop' + labgenbiases);
negtopprobs = logistic(negpenstates*pentop+neglabprobs*labtop+topbiases);
negtopstates = negtopprobs > rand(1, numtop);
end
 % NEGATIVE PHASE STATISTICS FOR CONTRASTIVE DIVERGENCE
negpentopstatistics = negpenstates'*negtopstates;
neglabtopstatistics = neglabprobs'*negtopstates;
% STARTING FROM THE END OF THE GIBBS SAMPLING RUN, PERFORM A
% TOP-DOWN GENERATIVE PASS TO GET SLEEP/NEGATIVE PHASE
% PROBABILITIES AND SAMPLE STATES
sleeppenstates = negpenstates;
sleephidprobs = logistic(sleeppenstates*penhid + hidgenbiases);
sleephidstates = sleephidprobs > rand(1, numhid);
sleepvisprobs = logistic(sleephidstates*hidvis + visgenbiases);
 % PREDICTIONS
psleeppenstates = logistic(sleephidstates*hidpen + penrecbiases);
psleephidstates = logistic(sleepvisprobs*vishid + hidrecbiases);
pvisprobs = logistic(wakehidstates*hidvis + visgenbiases);
phidprobs = logistic(wakepenstates*penhid + hidgenbiases);
 % UPDATES TO GENERATIVE PARAMETERS
hidvis = hidvis + r*poshidstates'*(data-pvisprobs);
A Fast Learning Algorithm for Deep Belief Nets 1553
visgenbiases = visgenbiases + r*(data - pvisprobs);
penhid = penhid + r*wakepenstates'*(wakehidstates-phidprobs);
hidgenbiases = hidgenbiases + r*(wakehidstates - phidprobs);
 % UPDATES TO TOP LEVEL ASSOCIATIVE MEMORY PARAMETERS
labtop = labtop + r*(poslabtopstatistics-neglabtopstatistics);
labgenbiases = labgenbiases + r*(targets - neglabprobs);
pentop = pentop + r*(pospentopstatistics - negpentopstatistics);
pengenbiases = pengenbiases + r*(wakepenstates - negpenstates);
topbiases = topbiases + r*(waketopstates - negtopstates);
%UPDATES TO RECOGNITION/INFERENCE APPROXIMATION PARAMETERS
hidpen = hidpen + r*(sleephidstates'*(sleeppenstates-psleeppenstates));
penrecbiases = penrecbiases + r*(sleeppenstates-psleeppenstates);
vishid = vishid + r*(sleepvisprobs'*(sleephidstates-psleephidstates));
hidrecbiases = hidrecbiases + r*(sleephidstates-psleephidstates);