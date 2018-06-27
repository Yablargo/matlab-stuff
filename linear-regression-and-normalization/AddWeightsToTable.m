function [table] = AddWeightsToTable(table,uniqueNames,weights,oldField,newField)
 
    len = length(uniqueNames)
    for index = 1:len
        %get the name fo the unique index
        name = cell2mat(uniqueNames(index))
        % find matching indexes in neighborhood list
        uniqueNames(index)
        n = table2array(table(:,oldField));
        matchIndexes = find(strcmp(n,name))
         %get houses that match
        table(matchIndexes,newField) = {weights(index)};
        
    end    
end