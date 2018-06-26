function [result_data] = fillTable(source_data,fieldLabels)
    %preallocate rows and columns
    sz = size(source_data)
    sz(2) = length(fieldLabels)
    
    %set columns to length of nf, keep rows as length of tables
    %Now, smartly build the arrays so i can use above later..
    result_data = zeros(sz);
    index = 1;
    for fld = fieldLabels            
        result_data(:,index) = table2array(source_data(:,char(fld)));
        index =  index+1;
        %fld    
        %numeric_data
    end
   
end