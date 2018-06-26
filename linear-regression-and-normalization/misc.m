function [] = graphIt(data, xIndex,xLabel,yIndex,yLabel,sp) 
    
    %default position if none exists
    if exist('sp','var')    
        
        subplot(sp(1),sp(2),sp(3))
 
    else
        figure        
 
    end
    %figure ('Position',[0,0,300,300])
    xlabel(xLabel)
    ylabel(yLabel)
    %get the mean of x and set xlim to x-mean and x+mean
    xdata = data(:,xIndex);
    xmin = mean(xdata)-std(xdata);
    xmax = mean(xdata)+std(xdata);
    
    
    xlim([xmin xmax]);    
    
    ydata = data(:,yIndex);
    ymin = mean(ydata)-std(ydata);
    ymax = mean(ydata)+std(ydata);
    
    
    
   ylim([ymin ymax ]);
    scatter(data(:,xIndex),data(:,yIndex))
     %default position if none exists
    if exist('sp','var')    
        
        
        title(xLabel + ' vs ' + yLabel)
    else
        
        legend(xLabel + ' vs ' + yLabel)
    end
    
end

