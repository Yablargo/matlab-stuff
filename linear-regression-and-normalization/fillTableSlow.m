
function [result_data] = fillTableSlow(source_data,fieldLabels)
    %preallocate rows and columns
    %set columns to length of nf, keep rows as length of tables
    %Now, smartly build the arrays so i can use above later..
    result_data = [];
    for fld = fieldLabels            
        result_data = [result_data table2array(source_data(:,char(fld)))];
    end
    
end
