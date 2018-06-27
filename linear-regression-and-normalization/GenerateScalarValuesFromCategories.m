 function [oUniqueNames,oWeights,t] = GenerateScalarValuesFromCategories(table,oldFieldName,newFieldName,sqFootName,priceName)
 
    oUniqueNames = table2array(unique(table(:,oldFieldName)))
    len = length(oUniqueNames)
    oWeights = zeros(len,1);
    %we group entries by neighborhood, and use the neighborhood price per square foot to set a multiplier in the neighborhood value
    %first get a simplified data set of the 'price per square foot' -- do I need this?
    squareFootage = table2array([table(:,sqFootName) table(:,priceName)])
    %array of the unique value we are looking for
    n = table2array(table(:,oldFieldName));
    
    
    %create a new value to store neighborhood value mean multiplier
    addvars(table,zeros(length(n),1));
    %rename the table property
    table.Properties.VariableNames(1) = {newFieldName};
    %get rid of the old table property!
    
    
    for index = 1:len
        %get the name fo the unique index
        name = cell2mat(oUniqueNames(index))
        % find matching indexes in neighborhood list
        matchIndexes = find(strcmp(n,name));
        
        %get houses that match
        houses = squareFootage(matchIndexes,:);
        %calculate dollar per square foot of each
        dollarPrSqFt = houses(:,2)./(houses(:,1));
        meanCostPrSqFt = mean(dollarPrSqFt)
        %replace the neighborhood value in the weighting array
        oWeights(index) = meanCostPrSqFt;                  
    end
    
    
    %replace all values of this particular name with the scalar in the table
    t = AddWeightsToTable(table,oUniqueNames,oWeights, oldFieldName,newFieldName);
%create a new table row for neighborhood mean multiplier
 end