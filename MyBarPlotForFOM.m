%% Generic Bar plot function to use in FOM plotting
function MyBarPlotForFOM(FOM_Data,FigureText,SpdRatBins,YaxisText,Legend)

    for i=1:3
        figure ('Name',FigureText{i},'NumberTitle','off')
        xdata = [1,2,3];
        PlotByBrakeBins = squeeze(FOM_Data(:,i,:));
        bar (xdata,PlotByBrakeBins,'grouped');
        set(gca,'xtick',[1:3],'xticklabel',SpdRatBins);
        ylabel(YaxisText);
        title(['PPV FOM UD data for ' FigureText{i}],'FontSize',20); 
        legend(Legend);
    end

end