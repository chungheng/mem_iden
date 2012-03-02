function [] = myPrintFig(fid,figpath,figname, isexp)


clktemp = fix(clock);
clockstr  = num2str(clktemp(1));
for i = 2:6
    clockstr = [clockstr, '_', num2str(clktemp(i))];
end

if strcmp(isexp, 'isexp')
    figfilename = [figpath, 'exp\\','[',clockstr,']', figname,'.png'];
elseif strcmp(isexp, 'notexp')
    figfilename = [figpath, figname, '.png'];
else
    error('USAGE: myPrintFig\(figpath,figname, \"isexp\" or \"notexp\"');
end

print(figure(fid),'-dpng','-r600',figfilename);
end