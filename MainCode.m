numMixers  = 0;
numAlcohols = 0;

%% stores all the alcohols in a cell array
% format: alcohols{1,1}{n,1}
fidalc = fopen('alcohols.txt', 'r');
alcoholList = textscan(fidalc, '%s', 'delimiter', '\n');

%% stores all the mixers in a cell array
% format: mixers{1,1}{n,1}
fidmix = fopen('mixers.txt', 'r');
mixerList = textscan(fidmix, '%s', 'delimiter', '\n');

%% prompt the user for type of shot
% 0 is only alcohol
% 1 for mixed
fprintf('\b\b\b\b\b\b\b\b\b');
shotType = input('Enter 0 for only alcohol, 1 for mixed: ');
fprintf('\n');

%% magic
if (shotType == 0)  % alcohol only
    maxIngredients = 4;
    numAlcohols = randi(maxIngredients, 1);
    
    for i = 1:numAlcohols
        alcohol = randi(length(alcoholList{1,1}), 1);
        alcohols{i} = alcoholList{1,1}{alcohol,1};
    end
    
    fprintf('Shot Ingredients:\n');
    for i = 1:numAlcohols
        fprintf('%s\n', alcohols{i});
    end
    
    fprintf('\n\n');
    
elseif(shotType == 1)
    maxIngredients = 5;
    numAlcohols = randi(maxIngredients, 1);
    
    for i = 1:numAlcohols
        alcohol = randi(length(alcoholList{1,1}), 1);
        alcohols{i} = alcoholList{1,1}{alcohol,1};
    end
    
    if (numAlcohols ~= maxIngredients)
        numMixers = randi(maxIngredients - numAlcohols, 1);
        
        for i = 1:numMixers
            mixer = randi(length(mixerList{1,1}), 1);
            mixers{i} = mixerList{1,1}{mixer,1};
        end
    end
    
    fprintf('Shot Ingredients:\n');
    for i = 1:numAlcohols
        fprintf('%s\n', alcohols{i});
    end
    
    if (numMixers > 0)
        for i = 1:numMixers
            fprintf('%s\n', mixers{i});
        end
    end
    
    fprintf('\n\n');
    
end




