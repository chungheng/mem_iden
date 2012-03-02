function clkstr = clockstr
clktemp = fix(clock);
clkstr  = num2str(clktemp(1));
for i = 2:6
    clkstr = [clkstr, '_', num2str(clktemp(i))];
end
