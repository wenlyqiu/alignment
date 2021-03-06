% perform alignment procedure multiple times to investigate effect on
% constellations at receivers

superman = 256;

constellationPri{1} = zeros(3,superman);
constellationPri{2} = zeros(2,superman);
dataTxPri{1} = zeros(3,superman);
dataTxPri{2} = zeros(2,superman);

dataRxPri{1} = zeros(3,superman);
dataRxPri{2} = zeros(2,superman);


constellationPub{1} = zeros(3,superman);
constellationPub{2} = zeros(2,superman);

dataTxPub{1} = zeros(3,superman);
dataTxPub{2} = zeros(2,superman);

dataRxPub{1} = zeros(3,superman);
dataRxPub{2} = zeros(2,superman);

constellationInt{1} = zeros(2,superman);
constellationInt{2} = zeros(3,superman);

transmissions{1} = zeros(3,superman);
transmissions{2} = zeros(2,superman);

for batman = 1:superman
    
    alignment;
    
    transmissions{1}(:,batman) = transmittedMessage{1}.';
    transmissions{2}(:,batman) = transmittedMessage{2}.';
    
    if ~isempty(decodedPri{1})
        constellationPri{1}(:,batman) = equalisedPri{1}.';
        dataTxPri{1}(:,batman) = privateCodeword(1,1:3).';
        dataRxPri{1}(:,batman) = dataPri{1}.';
    end
    
    if ~isempty(decodedPub{1})
        constellationPub{1}(:,batman) = equalisedPub{1}.';
        dataTxPub{1}(:,batman) = publicCodeword(1,1:3).';
        dataRxPub{1}(:,batman) = dataPub{1}.';
    end
    
    if ~isempty(decodedPri{2})
        constellationPri{2}(:,batman) = equalisedPri{2}.';
        dataTxPri{2}(:,batman) = privateCodeword(2,1:2).';
        dataRxPri{2}(:,batman) = dataPri{2}.';
    end
    
    if ~isempty(decodedPub{2})
        constellationPub{2}(:,batman) = equalisedPub{2}.';
        dataTxPub{2}(:,batman) = publicCodeword(2,1:2).';
        dataRxPub{2}(:,batman) = dataPub{2}.';
    end
    
    if ~isempty(decodedInt{1})
        constellationInt{1}(:,batman) = equalisedInt{1}.';
    end
    
    if ~isempty(decodedInt{2})
        constellationInt{2}(:,batman) = equalisedInt{2}.';
    end
    
end

%% Create plots of the constellations found


subplot(6,3,1);
    axis square;
    scatter(real(constellationPub{1}(1,:)),imag(constellationPub{1}(1,:)),'.');
    hold on;
    scatter(real(codebookPub{1}{1}),imag(codebookPub{1}{1}),'o','r');
    hold off;
    title(['User 1 Public Stream 1 (M=' num2str(2^codebookIndexPub{1}(1)) ')']);
    
subplot(6,3,2);
    axis square;
    scatter(real(constellationPub{1}(2,:)),imag(constellationPub{1}(2,:)),'.');
    hold on;
    scatter(real(codebookPub{1}{2}),imag(codebookPub{1}{2}),'o','r');
    hold off;
    title(['User 1 Public Stream 2 (M=' num2str(2^codebookIndexPub{1}(2)) ')']);   
    
subplot(6,3,3);
    axis square;
    scatter(real(constellationPub{1}(3,:)),imag(constellationPub{1}(3,:)),'.');
    hold on;
    scatter(real(codebookPub{1}{3}),imag(codebookPub{1}{3}),'o','r');
    hold off;
    title(['User 1 Public Stream 3 (M=' num2str(2^codebookIndexPub{1}(3)) ')']);

    
subplot(6,3,4);
    axis square;
    scatter(real(constellationPri{1}(1,:)),imag(constellationPri{1}(1,:)),'.');
    hold on;
    scatter(real(codebookPri{1}{1}),imag(codebookPri{1}{1}),'o','r');
    hold off;
    title(['User 1 Private Stream 1 (M=' num2str(2^codebookIndexPri{1}(1)) ')']);

subplot(6,3,5);
    axis square
    scatter(real(constellationPri{1}(2,:)),imag(constellationPri{1}(2,:)),'.');
    hold on;
    scatter(real(codebookPri{1}{2}),imag(codebookPri{1}{2}),'o','r');
    hold off;
    title(['User 1 Private Stream 2 (M=' num2str(2^codebookIndexPri{1}(2)) ')']);  

subplot(6,3,6);
    axis square
    scatter(real(constellationPri{1}(3,:)),imag(constellationPri{1}(3,:)),'.');
        hold on;
    scatter(real(codebookPri{1}{3}),imag(codebookPri{1}{3}),'o','r');
    hold off;
    title(['User 1 Private Stream 3 (M=' num2str(2^codebookIndexPri{1}(3)) ')']);
    
    
subplot(6,3,7);
    axis square;
    scatter(real(constellationPub{2}(1,:)),imag(constellationPub{2}(1,:)),'.');
    hold on;
    scatter(real(codebookPub{2}{1}),imag(codebookPub{2}{1}),'o','r');
    hold off;
    title(['User 2 Public Stream 1 (M=' num2str(2^codebookIndexPub{2}(1)) ')']);
    
subplot(6,3,8);
    axis square;
    scatter(real(constellationPub{2}(2,:)),imag(constellationPub{2}(2,:)),'.');
    hold on;
    scatter(real(codebookPub{2}{2}),imag(codebookPub{2}{2}),'o','r');
    hold off;
    title(['User 2 Public Stream 2 (M=' num2str(2^codebookIndexPub{2}(2)) ')']);
    
    
subplot(6,3,10);
    axis square;
    scatter(real(constellationPri{2}(1,:)),imag(constellationPri{2}(1,:)),'.');
        hold on;
    scatter(real(codebookPri{2}{1}),imag(codebookPri{2}{1}),'o','r');
    hold off;
    title(['User 2 Private Stream 1 (M=' num2str(2^codebookIndexPri{2}(1)) ')']);
    
subplot(6,3,11);
    axis square;
    scatter(real(constellationPri{2}(2,:)),imag(constellationPri{2}(2,:)),'.');
    hold on;
    scatter(real(codebookPri{2}{2}),imag(codebookPri{2}{2}),'o','r');
    hold off;
    title(['User 2 Private Stream 2 (M=' num2str(2^codebookIndexPri{2}(2)) ')']);
        
    
subplot(6,3,13);
    axis square;
    scatter(real(constellationInt{1}(1,:)),imag(constellationInt{1}(1,:)),'.');
    hold on;
    scatter(real(codebookPub{2}{1}),imag(codebookPub{2}{1}),'o','r');
    hold off;
    title(['User 1 Decoded Interference Stream 1']);    

subplot(6,3,14);
    axis square;
    scatter(real(constellationInt{1}(2,:)),imag(constellationInt{1}(2,:)),'.');
    hold on;
    scatter(real(codebookPub{2}{2}),imag(codebookPub{2}{2}),'o','r');
    hold off;
    title(['User 2 Decoded Interference Stream 2']); 
    
    
    subplot(6,3,16);
    axis square;
    scatter(real(constellationInt{2}(1,:)),imag(constellationInt{2}(1,:)),'.');
    hold on;
    scatter(real(codebookPub{1}{1}),imag(codebookPub{1}{1}),'o','r');
    hold off;
    title(['User 2 Decoded Interference Stream 1']); 
    
    subplot(6,3,17);
    axis square;
    scatter(real(constellationInt{2}(2,:)),imag(constellationInt{2}(2,:)),'.');
    hold on;
    scatter(real(codebookPub{1}{2}),imag(codebookPub{1}{2}),'o','r');
    hold off;
    title(['User 2 Decoded Interference Stream 2']); 
    


%% Send an email to IFTTT to notify Mobile user.
    
%matlabmail('trigger@recipe.ifttt.com','#matlab','#matlab','chris@celeritas.org.uk','aUgme2nt');

%% Calculate the BER for each user

BER = [0 0 0 0];
for batman = 1:superman
   
    for stream = 1:3
        if dataRxPub{1}(stream, batman) ~= dataTxPub{1}(stream,batman)
            BER(1) = (BER(1) + 1);
        end
        if dataRxPri{1}(stream,batman) ~= dataTxPri{1}(stream,batman)
            BER(2) = (BER(2) + 1);
        end
    end
    for stream = 1:2
        if dataRxPub{2}(stream, batman) ~= dataTxPub{2}(stream,batman)
            BER(3) = (BER(3) + 1);
        end
        if dataRxPri{2}(stream,batman) ~= dataTxPri{2}(stream,batman)
            BER(4) = (BER(4) + 1);
        end
    end
end

BER(1) = BER(1)/(3*superman);
BER(2) = BER(2)/(3*superman);
BER(3) = BER(3)/(2*superman);
BER(4) = BER(4)/(2*superman);

display(['User 1 Public BER: ', num2str(BER(1))]);
display(['User 1 Private BER: ', num2str(BER(2))]);
display(['User 2 Public BER: ', num2str(BER(3))]);
display(['User 2 Private BER: ', num2str(BER(4))]);

    