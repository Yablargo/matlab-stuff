function [] = graphIt(data, xIndex,xLabel,yIndex,yLabel) 
        
    figure ('Position',[0,0,300,300])
    xlabel(xLabel)
    ylabel(yLabel)
    %get the mean of x and set xlim to x-mean and x+mean
    xdata = data(:,xIndex);
    xmin = mean(xdata)-std(xdata);
    xmax = mean(xdata)+std(xdata);
    
    xmin
    xmax
    
    xlim([xmin xmax]);    
    
    ydata = data(:,yIndex);
    ymin = mean(ydata)-std(ydata);
    ymax = mean(ydata)+std(ydata);
    
    
    
   ylim([ymin ymax ]);
    scatter(data(:,xIndex),data(:,yIndex))
    legend(xLabel + ' vs ' + yLabel)
end

