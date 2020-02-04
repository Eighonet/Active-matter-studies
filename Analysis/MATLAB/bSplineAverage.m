sizes = ["40 sm", "33.5 sm", "30 sm"];
colors = ["m", "b", "r", "g", "c", "k", "y"];
for i = 1:3
    for j = 1:3
    name = "..\averaged_curves\average-" + j + i + ".csv"
    dist = "average_dist" + (i+3*(j-1))
    T = readtable(name);
    D = T.time_value(1:1050);
    F = T.(dist)(1:1050);
    p = polyfit(D,F,5);
    f = polyval(p,D);  
    figure(i)
    loglog(D,f, colors(j))
    hold on
    legend({'Max','Mid','Min'},'Location','southwest')
    xlabel('Time') 
    ylabel('Distance') 
    title('Field size ' + sizes(i))
    end
    saveas(gcf,i + ".png")
   hold off
end