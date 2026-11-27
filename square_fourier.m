%[text] Zadanie 1
%[text] # Szereg Fouriera fali prostokątnej
%[text] Przebieg prostokątny o amplitudzie A i okresie T można
%[text] zapisać jako sumę nieparzystych harmonicznych:
%[text] $x(t) = \\frac{4A}{\\pi} \\sum\_{k=1}^{N} \\frac{\\sin\\big((2k-1)\\omega t\\big)}{2k-1}, \\qquad \\omega = \\frac{2\\pi}{T}\n$
%[text] 
A = 1;
T = 2;
N = 100 %[control:dropdown:1a46]{"position":[5,8]} %[output:35631c57]
showIdeal = true; %[control:checkbox:8467]{"position":[13,17]}

w = 2*pi/T;
t = linspace(0, 3*T, 3000);
x = zeros(size(t));
for k = 1:N %[output:group:04be7547]
    harm = 2*k - 1 %[output:250a3e30] %[output:361edd5f] %[output:4645186f] %[output:895f8252] %[output:601fd13c] %[output:3e2e5e81] %[output:60312339] %[output:05284b36] %[output:7509027e] %[output:0bec9e49] %[output:2e38c592] %[output:5cb5d4a8] %[output:1bf5004f] %[output:30130f67] %[output:65ff589e] %[output:25f52668] %[output:04c6bded] %[output:9ea4007d] %[output:855865c9] %[output:17f7bf94] %[output:24eeb27a] %[output:246e83ba] %[output:63df751a] %[output:04593a21] %[output:5b908515] %[output:70c6e68b] %[output:58d066cf] %[output:02468623] %[output:7b40e0a7] %[output:994733e4] %[output:10ae7ccd] %[output:3db8046b] %[output:92e26bf0] %[output:6a3c0134] %[output:0c68c880] %[output:602e2657] %[output:7a30bd54] %[output:7d41d8dd] %[output:0d11f422] %[output:39dfadf1] %[output:8b89c071] %[output:8d6db285] %[output:768b5cc5] %[output:735f59e2] %[output:17ff79a8] %[output:44d4f9ce] %[output:84564995] %[output:72d092f7] %[output:2ccd29b0] %[output:57abd0cc] %[output:1348ad38] %[output:8a3e74e2] %[output:3ea8ba58] %[output:5ac98c07] %[output:5683567d] %[output:2906595e] %[output:37f60f72] %[output:7275a695] %[output:8664a875] %[output:1010e9ad] %[output:925a40cf] %[output:60c233db] %[output:9e5b20db] %[output:8dfc1328] %[output:11b125aa] %[output:1452a8be] %[output:1b78e54a] %[output:3c34c32d] %[output:992a94a7] %[output:6a66b8e9] %[output:3a3cd06a] %[output:2fc27b14] %[output:63cbf4b9] %[output:2998fbeb] %[output:201796be] %[output:6725e43b] %[output:30233dda] %[output:172d1310] %[output:444dbe4d] %[output:491f803f] %[output:43c1948d] %[output:58159b24] %[output:1f69aa2b] %[output:35101c40] %[output:3485132b] %[output:6b537875] %[output:31923bcf] %[output:31d54188] %[output:6745cd80] %[output:5609e653] %[output:943a6735] %[output:77859705] %[output:182a6e4a] %[output:20ba4943] %[output:7dcab740] %[output:3755582c] %[output:18e0716b] %[output:4c9906e0] %[output:088b5b1c] %[output:11682a71]
    x = x + sin([2*k-1]*w*t) / harm;
end %[output:group:04be7547]
x = 4*A/pi * x;

plot(t, x, 'LineWidth', 1.5) %[output:37f199e8]
if showIdeal %[output:group:8f1f622c]
    A*sign(sin(w*t)) %[output:7c84ccbf]
    hold on %[output:37f199e8]
    plot(t, A*sign(sin(w*t)), 'r--', 'LineWidth', 1.2) %[output:37f199e8]
    hold off %[output:37f199e8]
end %[output:group:8f1f622c]
grid on, ylim([-1.5 1.5]) %[output:37f199e8]
xlabel('t [s]'), ylabel('x(t)') %[output:37f199e8]
title(sprintf('N = %d', N)) %[output:37f199e8]
%[text] Wraz ze wzrostem liczby harmonicznych N przebieg coraz dokładniej odwzorowuje kształt fali prostokątnej (zbocza stają się bardziej strome, a „półki” bardziej płaskie). W pobliżu skoków przebiegu widoczny jest efekt Gibbsa – charakterystyczne przeregulowania („uszy”), które zwężają się wraz ze wzrostem N, ale nie zanikają całkowicie.
%[text] 
%[text] Zadanie 2
%[text] $f(x) = e^{-x}, \\qquad g(x) = \\frac{1}{1 + x}$
x = (0:0.25:3)';
F = exp(-x);
G = 1./(1+x);
Difference = G-F;
T = table( x, F, G, Difference, 'VariableNames', {'x', 'F', 'G', 'Difference'})

[maxDiff, idx] = max(T.Difference);
xAtMaxDiff = T.x(idx);
fprintf('Największa różnica G - F wynosi %.4f dla x = %.2f\n', maxDiff, xAtMaxDiff);

hold on
plot(x, F,'-o', 'LineWidth', 1.5)
plot(x, G, '-s', 'LineWidth', 1.5)
hold off 
grid on
xlabel('x'), ylabel('Wartość funkcji')
title('Porównanie f(x) = e^{-x} oraz g(x) = 1/(1+x)')
legend('f(x) = e^{-x}', 'g(x) = 1/(1+x)', 'Location', 'best')
%[text] Dla x = 0 obie funkcje są równe (f(0) = g(0) = 1). Dla x \> 0 większe wartości przyjmuje funkcja g(x) = 1/(1+x) (różnica g(x) - f(x) jest dodatnia na całym przedziale (0, 3\]), ponieważ e^{-x} maleje szybciej niż 1/(1+x). Największa różnica występuje dla x = 1.00 i wynosi około 0.1321.

%[appendix]{"version":"1.0"}
%---
%[metadata:styles]
%   data: {"normal":{"fontFamily":"n"}}
%---
%[metadata:view]
%   data: {"layout":"onright"}
%---
%[control:dropdown:1a46]
%   data: {"defaultValue":"5","itemLabels":["1","2","5","20","100"],"items":["1","2","5","20","100"],"label":"N","run":"Section"}
%---
%[control:checkbox:8467]
%   data: {"defaultValue":true,"label":"showIdeal","run":"Section"}
%---
%[output:35631c57]
%   data: {"dataType":"textualVariable","outputData":{"name":"N","value":"100"}}
%---
%[output:250a3e30]
%   data: {"dataType":"textualVariable","outputData":{"name":"harm","value":"1"}}
%---
%[output:361edd5f]
%   data: {"dataType":"textualVariable","outputData":{"name":"harm","value":"3"}}
%---
%[output:4645186f]
%   data: {"dataType":"textualVariable","outputData":{"name":"harm","value":"5"}}
%---
%[output:895f8252]
%   data: {"dataType":"textualVariable","outputData":{"name":"harm","value":"7"}}
%---
%[output:601fd13c]
%   data: {"dataType":"textualVariable","outputData":{"name":"harm","value":"9"}}
%---
%[output:3e2e5e81]
%   data: {"dataType":"textualVariable","outputData":{"name":"harm","value":"11"}}
%---
%[output:60312339]
%   data: {"dataType":"textualVariable","outputData":{"name":"harm","value":"13"}}
%---
%[output:05284b36]
%   data: {"dataType":"textualVariable","outputData":{"name":"harm","value":"15"}}
%---
%[output:7509027e]
%   data: {"dataType":"textualVariable","outputData":{"name":"harm","value":"17"}}
%---
%[output:0bec9e49]
%   data: {"dataType":"textualVariable","outputData":{"name":"harm","value":"19"}}
%---
%[output:2e38c592]
%   data: {"dataType":"textualVariable","outputData":{"name":"harm","value":"21"}}
%---
%[output:5cb5d4a8]
%   data: {"dataType":"textualVariable","outputData":{"name":"harm","value":"23"}}
%---
%[output:1bf5004f]
%   data: {"dataType":"textualVariable","outputData":{"name":"harm","value":"25"}}
%---
%[output:30130f67]
%   data: {"dataType":"textualVariable","outputData":{"name":"harm","value":"27"}}
%---
%[output:65ff589e]
%   data: {"dataType":"textualVariable","outputData":{"name":"harm","value":"29"}}
%---
%[output:25f52668]
%   data: {"dataType":"textualVariable","outputData":{"name":"harm","value":"31"}}
%---
%[output:04c6bded]
%   data: {"dataType":"textualVariable","outputData":{"name":"harm","value":"33"}}
%---
%[output:9ea4007d]
%   data: {"dataType":"textualVariable","outputData":{"name":"harm","value":"35"}}
%---
%[output:855865c9]
%   data: {"dataType":"textualVariable","outputData":{"name":"harm","value":"37"}}
%---
%[output:17f7bf94]
%   data: {"dataType":"textualVariable","outputData":{"name":"harm","value":"39"}}
%---
%[output:24eeb27a]
%   data: {"dataType":"textualVariable","outputData":{"name":"harm","value":"41"}}
%---
%[output:246e83ba]
%   data: {"dataType":"textualVariable","outputData":{"name":"harm","value":"43"}}
%---
%[output:63df751a]
%   data: {"dataType":"textualVariable","outputData":{"name":"harm","value":"45"}}
%---
%[output:04593a21]
%   data: {"dataType":"textualVariable","outputData":{"name":"harm","value":"47"}}
%---
%[output:5b908515]
%   data: {"dataType":"textualVariable","outputData":{"name":"harm","value":"49"}}
%---
%[output:70c6e68b]
%   data: {"dataType":"textualVariable","outputData":{"name":"harm","value":"51"}}
%---
%[output:58d066cf]
%   data: {"dataType":"textualVariable","outputData":{"name":"harm","value":"53"}}
%---
%[output:02468623]
%   data: {"dataType":"textualVariable","outputData":{"name":"harm","value":"55"}}
%---
%[output:7b40e0a7]
%   data: {"dataType":"textualVariable","outputData":{"name":"harm","value":"57"}}
%---
%[output:994733e4]
%   data: {"dataType":"textualVariable","outputData":{"name":"harm","value":"59"}}
%---
%[output:10ae7ccd]
%   data: {"dataType":"textualVariable","outputData":{"name":"harm","value":"61"}}
%---
%[output:3db8046b]
%   data: {"dataType":"textualVariable","outputData":{"name":"harm","value":"63"}}
%---
%[output:92e26bf0]
%   data: {"dataType":"textualVariable","outputData":{"name":"harm","value":"65"}}
%---
%[output:6a3c0134]
%   data: {"dataType":"textualVariable","outputData":{"name":"harm","value":"67"}}
%---
%[output:0c68c880]
%   data: {"dataType":"textualVariable","outputData":{"name":"harm","value":"69"}}
%---
%[output:602e2657]
%   data: {"dataType":"textualVariable","outputData":{"name":"harm","value":"71"}}
%---
%[output:7a30bd54]
%   data: {"dataType":"textualVariable","outputData":{"name":"harm","value":"73"}}
%---
%[output:7d41d8dd]
%   data: {"dataType":"textualVariable","outputData":{"name":"harm","value":"75"}}
%---
%[output:0d11f422]
%   data: {"dataType":"textualVariable","outputData":{"name":"harm","value":"77"}}
%---
%[output:39dfadf1]
%   data: {"dataType":"textualVariable","outputData":{"name":"harm","value":"79"}}
%---
%[output:8b89c071]
%   data: {"dataType":"textualVariable","outputData":{"name":"harm","value":"81"}}
%---
%[output:8d6db285]
%   data: {"dataType":"textualVariable","outputData":{"name":"harm","value":"83"}}
%---
%[output:768b5cc5]
%   data: {"dataType":"textualVariable","outputData":{"name":"harm","value":"85"}}
%---
%[output:735f59e2]
%   data: {"dataType":"textualVariable","outputData":{"name":"harm","value":"87"}}
%---
%[output:17ff79a8]
%   data: {"dataType":"textualVariable","outputData":{"name":"harm","value":"89"}}
%---
%[output:44d4f9ce]
%   data: {"dataType":"textualVariable","outputData":{"name":"harm","value":"91"}}
%---
%[output:84564995]
%   data: {"dataType":"textualVariable","outputData":{"name":"harm","value":"93"}}
%---
%[output:72d092f7]
%   data: {"dataType":"textualVariable","outputData":{"name":"harm","value":"95"}}
%---
%[output:2ccd29b0]
%   data: {"dataType":"textualVariable","outputData":{"name":"harm","value":"97"}}
%---
%[output:57abd0cc]
%   data: {"dataType":"textualVariable","outputData":{"name":"harm","value":"99"}}
%---
%[output:1348ad38]
%   data: {"dataType":"textualVariable","outputData":{"name":"harm","value":"101"}}
%---
%[output:8a3e74e2]
%   data: {"dataType":"textualVariable","outputData":{"name":"harm","value":"103"}}
%---
%[output:3ea8ba58]
%   data: {"dataType":"textualVariable","outputData":{"name":"harm","value":"105"}}
%---
%[output:5ac98c07]
%   data: {"dataType":"textualVariable","outputData":{"name":"harm","value":"107"}}
%---
%[output:5683567d]
%   data: {"dataType":"textualVariable","outputData":{"name":"harm","value":"109"}}
%---
%[output:2906595e]
%   data: {"dataType":"textualVariable","outputData":{"name":"harm","value":"111"}}
%---
%[output:37f60f72]
%   data: {"dataType":"textualVariable","outputData":{"name":"harm","value":"113"}}
%---
%[output:7275a695]
%   data: {"dataType":"textualVariable","outputData":{"name":"harm","value":"115"}}
%---
%[output:8664a875]
%   data: {"dataType":"textualVariable","outputData":{"name":"harm","value":"117"}}
%---
%[output:1010e9ad]
%   data: {"dataType":"textualVariable","outputData":{"name":"harm","value":"119"}}
%---
%[output:925a40cf]
%   data: {"dataType":"textualVariable","outputData":{"name":"harm","value":"121"}}
%---
%[output:60c233db]
%   data: {"dataType":"textualVariable","outputData":{"name":"harm","value":"123"}}
%---
%[output:9e5b20db]
%   data: {"dataType":"textualVariable","outputData":{"name":"harm","value":"125"}}
%---
%[output:8dfc1328]
%   data: {"dataType":"textualVariable","outputData":{"name":"harm","value":"127"}}
%---
%[output:11b125aa]
%   data: {"dataType":"textualVariable","outputData":{"name":"harm","value":"129"}}
%---
%[output:1452a8be]
%   data: {"dataType":"textualVariable","outputData":{"name":"harm","value":"131"}}
%---
%[output:1b78e54a]
%   data: {"dataType":"textualVariable","outputData":{"name":"harm","value":"133"}}
%---
%[output:3c34c32d]
%   data: {"dataType":"textualVariable","outputData":{"name":"harm","value":"135"}}
%---
%[output:992a94a7]
%   data: {"dataType":"textualVariable","outputData":{"name":"harm","value":"137"}}
%---
%[output:6a66b8e9]
%   data: {"dataType":"textualVariable","outputData":{"name":"harm","value":"139"}}
%---
%[output:3a3cd06a]
%   data: {"dataType":"textualVariable","outputData":{"name":"harm","value":"141"}}
%---
%[output:2fc27b14]
%   data: {"dataType":"textualVariable","outputData":{"name":"harm","value":"143"}}
%---
%[output:63cbf4b9]
%   data: {"dataType":"textualVariable","outputData":{"name":"harm","value":"145"}}
%---
%[output:2998fbeb]
%   data: {"dataType":"textualVariable","outputData":{"name":"harm","value":"147"}}
%---
%[output:201796be]
%   data: {"dataType":"textualVariable","outputData":{"name":"harm","value":"149"}}
%---
%[output:6725e43b]
%   data: {"dataType":"textualVariable","outputData":{"name":"harm","value":"151"}}
%---
%[output:30233dda]
%   data: {"dataType":"textualVariable","outputData":{"name":"harm","value":"153"}}
%---
%[output:172d1310]
%   data: {"dataType":"textualVariable","outputData":{"name":"harm","value":"155"}}
%---
%[output:444dbe4d]
%   data: {"dataType":"textualVariable","outputData":{"name":"harm","value":"157"}}
%---
%[output:491f803f]
%   data: {"dataType":"textualVariable","outputData":{"name":"harm","value":"159"}}
%---
%[output:43c1948d]
%   data: {"dataType":"textualVariable","outputData":{"name":"harm","value":"161"}}
%---
%[output:58159b24]
%   data: {"dataType":"textualVariable","outputData":{"name":"harm","value":"163"}}
%---
%[output:1f69aa2b]
%   data: {"dataType":"textualVariable","outputData":{"name":"harm","value":"165"}}
%---
%[output:35101c40]
%   data: {"dataType":"textualVariable","outputData":{"name":"harm","value":"167"}}
%---
%[output:3485132b]
%   data: {"dataType":"textualVariable","outputData":{"name":"harm","value":"169"}}
%---
%[output:6b537875]
%   data: {"dataType":"textualVariable","outputData":{"name":"harm","value":"171"}}
%---
%[output:31923bcf]
%   data: {"dataType":"textualVariable","outputData":{"name":"harm","value":"173"}}
%---
%[output:31d54188]
%   data: {"dataType":"textualVariable","outputData":{"name":"harm","value":"175"}}
%---
%[output:6745cd80]
%   data: {"dataType":"textualVariable","outputData":{"name":"harm","value":"177"}}
%---
%[output:5609e653]
%   data: {"dataType":"textualVariable","outputData":{"name":"harm","value":"179"}}
%---
%[output:943a6735]
%   data: {"dataType":"textualVariable","outputData":{"name":"harm","value":"181"}}
%---
%[output:77859705]
%   data: {"dataType":"textualVariable","outputData":{"name":"harm","value":"183"}}
%---
%[output:182a6e4a]
%   data: {"dataType":"textualVariable","outputData":{"name":"harm","value":"185"}}
%---
%[output:20ba4943]
%   data: {"dataType":"textualVariable","outputData":{"name":"harm","value":"187"}}
%---
%[output:7dcab740]
%   data: {"dataType":"textualVariable","outputData":{"name":"harm","value":"189"}}
%---
%[output:3755582c]
%   data: {"dataType":"textualVariable","outputData":{"name":"harm","value":"191"}}
%---
%[output:18e0716b]
%   data: {"dataType":"textualVariable","outputData":{"name":"harm","value":"193"}}
%---
%[output:4c9906e0]
%   data: {"dataType":"textualVariable","outputData":{"name":"harm","value":"195"}}
%---
%[output:088b5b1c]
%   data: {"dataType":"textualVariable","outputData":{"name":"harm","value":"197"}}
%---
%[output:11682a71]
%   data: {"dataType":"textualVariable","outputData":{"name":"harm","value":"199"}}
%---
%[output:7c84ccbf]
%   data: {"dataType":"matrix","outputData":{"columns":3000,"name":"ans","rows":1,"type":"double","value":[["0","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1"]]}}
%---
%[output:37f199e8]
%   data: {"dataType":"image","outputData":{"dataUri":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAn0AAAF\/CAYAAAA8U39bAAAQAElEQVR4AezdD5RU5X3\/8a8JnKIFCzSCIOwPCG0RCktOS1izBqNBIc1PURNSd9tfsDHZQKAxCrLR1laLR8MftaYSkfrnZ+pv14Zqg55EQTTVsKckNJU\/1dgUMWXXRKAFRI6SExp\/+7nwDHeH+XNn5s7M\/fPm8Oz9\/9zneT3PzP3OnXvvvO89\/iGAAAIIIIAAAggkXuB9xj8EEEAAgZQLUH0EEEiDAEFfGlqZOiKAAAIIIIBA6gUI+lLfBQoDsBQBBBBAAAEEkiFA0JeMdqQWCCCAAAIIVEuAfBMiQNCXkIakGggggAACCCCAQCEBgr5COixDAIHCAixFAAEEEIiNAEFfbJqKgiKAAAIIIIAAAuULVCvoK79EbIkAAggggAACCCAQugBBX+ikZIgAAmELHDlyxFpbW23cuHHW2NhoO3fu7LMLTWu+lm\/atKnPsmpOaF\/a5wUXXGD79u07ZVeap2VaR0njmnfKir0zlixZ4tVP6ykp797ZMf9P8RFAIEoCBH1Rag3KggACRQXefvtte+SRR4quV+0VFGguXrw47260\/OKLL7bu7u7MOhqfO3dunwDRBbRPPPFEZj2NtLW1GYGfJEgIIBCWAEFfWJLkU5IAKyNQiYACpHoGRGvWrLE5c+aYAtB89VBgquVNTU22Y8cO27Jli40ePdoLAlesWJHZTPOVBg0aZOvXr7fdu3fblVde6S1ftmxZnwDRm8kfBBBAoEwBgr4y4dgMAQTqK\/DQQw+ZzpKVUgoFivrqtFDS18iF8tXXsP6gLdf+9RXu1q1bvUUzZsywgQMH2rBhw6ylpcWb97Of\/SxT9meeecabN2nSJBs7dqw3Pm\/ePFMQeOjQIdu7d683jz8IJFCAKtVYgKCvxuDsDgEEwhHQ2bFHH300nMzKyGXp0qWmlGtTBWoK2LRs\/PjxGnjJjb\/xxhv2zjvveIGfAkAtHDlypBccanz48OE2ePBg70yi8tI8EgIIIFCpAEFfpYJsjwAC4QsUyFFffSpplc7Ozpp\/\/fnrv\/7r3tew8+fPVxHKSgoIgwZzu3btKmsfbIQAAghkCxD0ZYswjQACkRdwX3\/qxohiX7X6KzNz5kzvmjldN5cvdXR0ZM64+bd147feeqtNnjzZTTJEAAEEYiMQt6AvNrAUFAEEqiegoGvBggXeDnRTx8aNG71x\/iCAAAII5Bcg6MtvwxIEEIiwgL7i1d2wKuLq1au96980XiiFcSNHofyDLtP1erpuL8j67jrAIOumZx1qigAC5QgQ9JWjxjYIIFB3Ad0Ne\/PNN9e9HLkKoIBOgZ2W+a\/Jc+PnnHOOnXHGGd7XyLqBQ+vphg5317Cu99N1f7qDV3lpOQkBBBCoVICgr1JBto+UAIVJl4CegacUtVorIJ02bZpXrBdffNG7S1ePcdGNJ5qpQE+PcdH47NmzNbCXX37ZXn\/9dW\/cPeNPgSNBn0fCHwQQCEGAoC8ERLJAAIH6CChwuvHGG71n2gUpQRg3cgTZj9ZxN5vo0TJTpkwxBae68URfSfsf9aL5SnqQsx74rGcI6jpF5aEzmQogNU5CAIHAAqyYR4CgLw8MsxFAIB4CuqlDP3cWtdKqXM8++6z3KxyubAr41q1b5z2o2c1T4Ko7hnWNopun4dq1a01BqsZJCCCAQBgCqQj69BuYeiq+hsXQtE5jY6Pp07Y\/FXtKf7F8WY4AAuULuMBIj1lZtWrVKRlpnpYpFQyUTtmyshl6Vp\/2+cILL\/QJ5FyuOkunZVpHSeOa55b7h\/46aN1a1sNfDsYRQCC5AokP+nQdzaJFi+ytt94K1Iq6gForut\/A1Juvkj6J68CjZSQEEEAAAQQQQCBuAokO+vR4Bl0ro+toijRMZrHurps0aZKNHTs2M48RBBBAAAEEEEAg7gKJDfoU8LW1tXm\/jalrY4I2lII+\/511QbdjPQQQQACBuAtQfgSSLZDYoE\/Xw+hrWV1zE7QJ9VXw1q1b7dVXX+1zTd+SJUuCZsF6CCCAAAIIIIBAJAUSG\/SVo63r+fRA1AkTJmR+n1OPW1AgGORGjp6eHiMl04B2pV3pA\/QB+kCy+kA5cULctyHo87WgHrGwfft20110brbutNOzshT8Kbn52UO9Gdxwww2mu4RJM3CYgQGvA\/oAfYA+EOU+0NLS4p2oyT6eF5iO\/SKCvgBNqCfi6+eQdL1fvtUV9P3gBz+wlStXmu70JXWU5XDttdd6xDiW5+f6HY6V+TlHDbEMxxJHHPV6ikpSf9Qx2zvgpOgPQV\/IjT19+nTvyfu6a5jUVLKF\/NQkGuJXup8zkx+O5fs5Rw0DWTaFsy\/tL6kJx3D6CI7hOup9Mk2JoM\/X2rrjVw9k1tA323Stn6abm5s1ICGAAAIIIIAAArETIOjzNZn7hL1s2TLTnbxapF\/oWLx4selnnnTNn+aVkFgVAQQQQAABBBCIhECqg741a9aYfnJNgZ1aQ7+4oesNpk2b5n0tqbN+c+bMsQULFvS5uUPrkqojcPbZZ9tnP\/tZ07A6e0hHrvLDMZy2xhLHygXCy4H+GJ5lGnNKRdCnZ\/bprtzsM3V6hl+u+bp7V8\/4c0nrpbFz1KPOekObN29ePXadqH3iGF5zYhmOJY44hiNALpUIpCLoqwSIbRGopgB5I4AAAgggUCsBgr5aSbMfBBBAAAEEEEDgVIGazSHoqxk1O0IAAQQQQAABBOonQNBXP3v2jAACCBQWYCkCCCAQogBBX4iYZIUAAggggAACCERVgKAvqi1TuFwsRQABBBBAAAEEShIg6CuJi5URQAABBBCIigDlQKA0AYK+0rxYGwEEEEAAAQQQiKUAQV8sm41CI1BYgKUIIIAAAghkCxD0ZYswjQACCCCAAAIIxF\/glBoQ9J1CwgwEEEAAAQQQQCB5AgR9yWtTaoQAAggUFmApAgikUoCgL5XNTqURQAABBBBAIG0CBH1pa\/HC9WUpAggggAACCCRUgKAvoQ1LtRBAAAEEEChPgK2SKkDQl9SWpV4IIIAAAggggIBPgKDPh8EoAggUFmApAggggEB8BQj64tt2lBwBBBBAAAEEEAgsEFLQF3h\/rIgAAggggAACCCBQBwGCvjqgs0sEEEAgkQJUCgEEIi1A0Bfp5qFwCCCAAAIIIIBAOAIEfeE4kkthAZYigAACCCCAQJ0FCPrq3ADsHgEEEEAAgXQIUMt6CxD01bsF2D8CCCCAAAIIIFADAYK+GiCzCwQQKCzAUgQQQACB6gsQ9FXfmD0ggECMBda9tD\/GpafoCCCAwEmBiAd9JwvKGAIIlCZw\/w8O2RX37yxtI9buI9C59U27dt0uu2XTf\/WZz0TpAj87fMwufaTH1r2EZel6bIFAOAIEfeE4kktIAve88HNTsBJSdqnNRgfYtT88ZF2vHTIFLqmFqLDim3cd9HL40RtHvSF\/yhfQGVP1y4WdPy49E7bICMjwqR8fyUwzgkApAgR9pWixblUFNu86ZMs3\/NQUrGz5KW9qVcUmcwQQiKXAlWt3emeeeY+MZfPVvdAEfSE1wa\/O+IAdvmS5\/fTowJByJJsAAqyCQFUF9hzgDF9Vgcm8ZAHXJ7teO34WuuQM2CDVAgR9ITX\/Hd9\/2xT4LXqMry5CIiUbBBBAAAGfgAv4fLMY9QT4E1SAoC+oFOtVXaD7IGdVqoG858C71ciWPBFAAAEEYiZA0BezBktLcQkA09LS1a0nuUdHwH+Wyj8enRJSEgSSL0DQl\/w2poYIIIAAAggggIClNOij5RFItoAe65DsGlI7BBBAAIFSBQj6ShVjfQQQQACBZAjErBZ8LR6zBotgcQn6Qm4UXpQhg5IdAhEQ4MxpBBqBIiCAQMUCBH0VEx7PgBsPjjsk5G+iqqGHXieqQjWqjD7A8bquDrZsq5MzuSKAQCEBgr4COjt37rQZM2aYhgVWO2URB9lTSIrO0EFg+YbXi67HCqUL6KfY5Fv6luneonPrzw236vQBnmdanqv6ZHlbslV5AsnbiqAvT5vu27fPFi1aZG+99VaeNfLP5oWZ36bQEg6whXQqW4ZtZX5sjUAUBPQBLgrloAzxFSDoy9F2mzZtsqamJuvu7s6xtPgsvTA5yBZ38q9BoOzXCH+cs6ilmer1q9+BzrcV8ysTkG\/n1jcryyRlW8tMyVXbP+7mMUSgmABBX5aQAr62tjZbunSprV27NmtpsEm9GBd28nNswbTM9ObPATaoVnnr6YOIAj\/1zfJySM9WMrrsGy+lp8J1qqn6o177ddp9rHZLn4xVc0W6sAR9Wc0zc+ZM2717t82fPz9rSZDJk+voIDv0+u\/ZpatfMvfmtnnXoVReI6Q3LJdkoCQTBcZTb\/tn0\/CkHGPVElBgrWAmu0+qPdQ+1dpv1PJVXV1S0KH6a6h+qP6opOVRK3fSyiNjmbv3SbWB2kJJy5JW30L1cfXVUPVX0nukkl6v9MlCeiwrRYCgrxStEtZt7tlmSvbCP9nmB79tHSs7bflND9vC+ffZpZ+5+5S08ItrTGlqbxCkF3mutPCOp235jf\/XS50rH\/OG\/ul881xeeoN1yc3TNi4Vysstc0O3ffbQK\/\/Sf\/TqovooaRvVW0kGSjLZ84\/P2OgdWzyn5p5tfXSPHfulHTt2jFSmgTAbDr+ZsZWvkryz+6TaQ22jfqkD8NTePqikcbWvxpX8\/U\/tmt1vcs3TOsvv\/yfvw4\/yUiq3DyovJa8\/9b4WvDL1nlFXni5pnvandZRUJiXVTUMlb37v61B1dq9LDbue21bwQxn9sbLXY74+2azXfu\/7pNpAfVEfTKb29kH1Pw2V3Ljaz5\/UloWS1198\/c\/1PQ1dn9E6LikvN66hppU07pKmlZSHkstHQze9\/MT7tNbzJ3\/Z+4z39sepn+801VX1V9KHNCWdQJBdc6+TS3pt0x9L6489PT3mTzJNYyLoq1KrP7XueislrV67wJT0SU8v8lzJXnjB2r\/2J15qWdriDf3T+ea5vPRJ2iU3T9u4VCgvt8wN3fbZQ5W\/YccPvLqoPi4FsfA3xcGDh7xrKnVdJam7ZIv+P3nJtj3YWlIfVBvpoKI2VFJ7qH01rnT+o\/dk+pzaNbvf5JqndRTcKx+Xyu2DyktJfbDhyb\/3AjTl5fLVUOVs+PrX+pRT5VLdNHRJ09mpuWe7qpw30Q9L74d+s0t\/+HigPulvALWnkuZp2PLd+\/u8t6gvFErqL0rqG0rqLy5pWknLXVJeblxDTStp3CVNK2Xno7w0T8Nm32tF67rk+l\/2UH3xyd5jhuqZL2kdl\/TavuJf15f8vuBvj7SNP\/DAA97TOPREDqXW1tZ81ImeT9BXpebdPGqqlZMKFWfPmcNDz7OcMmqbapdzyJDBNmLEiKSlmtWn8X2\/8Jpoz5lnl9RnvI3y\/Ck1L\/UTJfXbPFl6s7VOqWnPb5ztbZvrT7XKSX+s7PU4c\/+rXnMVax9vpTx\/ukY1ltSf1a+0vzzZebO1TjnJ2zjPn2qW09VHnvTJnaiFsQAAEABJREFU4H3y6quvto6Ojky69tpr87ResmcT9FWpfS+be5f506IvfsNc6lzRYcu\/+pBp2PXAE97Qja9uOddcap81JjOuee23\/4nZ975n3U887SWNKzVs\/+c+05qnpPU0fPJLHzKXlI8b3\/bn5xXcTtsqKR8ljStpXPkoKa\/scp5\/zeWmermkuimpzjLwu\/jH\/U3Rr19\/GzBgAKlMg38Z32RDr3vepl7T0acfOm+1g5LaRG2jpPZS26k9XVIbu6QzaGp7l9QXgiT1W\/WTfClIHlpH+9VQqeXer\/Z5bSjv7HKqPtpGSePZSXVW\/ZXk0jVqqr8LZsYP3H2RKdEfK3s99uvf3zNdft68gn2yZdrZptT8wcHm+qEbZvdBta1L6hdK2dOap76hPpIraXm+pLyyl7l5\/ryy8y9Uzux+qGn1RSXVuWHoAM8p+4\/6qJL8tEye9MngfXLMmDHeUzmampq84fTp08VYp1S\/3RL0VdFeL169ebk3BwVZSnqDeGrhh7yDVvussd5Q8zSu9V3Knj5\/\/GBTcss1ruT2o3F\/0nr+aY375wXdTtsoaXsljbuk6exyatqfVDcl1Vn1P3DXhaahXJRPFZuArH0Crr3lrqQ2UJuobZT8bebG1T75ktq+lknl8O9P0y5pvht3Q9XBP65pf1KdVX8l9UklubT3ftjysTFaRQH1SXnLXf1RSe2ipHZp731\/9CfXnrmG6gNKbpnGXdI8N17KMNd2QeZpnXzJXx83rvoqqc4yUF\/UUC7Kp4pNQNYpEyDoq1KDt\/ceOPSi1QtZbzJ6c6vSrmKZrTzkIh856RNuLCsSk0LLWwcQectd0zEpek2LKZv23kBDVjXd8YmdJXmw58C7farXfuI9sr3XW+59FjJheo3KRa9ZBYG8R9IpwhAg6AtDsTcPXYSrr4Cae47fhao3st7Z\/A8g4N7cAqzKKmUK6GyBnMvcPHWb6WDLQbZ6za6+2PzBIdXbQQJzbv3wiATWiirVWoCgr4C4ntm3fft2mzx5coG1Tl3U3vsJ9tS5lcxJ\/rbtvZ\/2dSDIBM\/dx4Pn5Ne8+jWUq3yrv6dk7UFnWJJVo\/rWZuEl7d51pp0TZ3nX7Cmwrm+J4rV3fXBr\/uDgeBWa0kZOgKCvCk3SzCfYslRHD8l9AXNZmbERAgggkDCB88cT9CWsSWteHYK+mpOzw3wCOiOVbxnzEUAAAQQQQKAyAYK+yvzYukoCew4erVLOicz2lEqd37PNe8yIvi4\/ZSEzAgnoQ0gzX6cFsip1pYahp5e6CesjgEAIAgR9ISCSRTgCDXmeTxVO7unN5d6rzk1v5SusOdedVQiYY3MF0ro+LcciZhURaObSoSJCaV9cvP4EfcWNSlrj\/N4XJQeKksgyK3OzQYYi1BGC6VA5yQyBugno2NJ1\/hzvhpiFlyytWznYcXwFCPpCbjsOsCGDkl1ZAvqd0rI2ZKNEClApBBBAQAIEfVIgIYAAAghUVWD1xuXedaatr2yo6n7IHAEE8gsQ9OW3ScESqogAAggggAACaREg6EtLS1NPBBAoS2Dodc9711CVtTEbIRAHAcqYGgGCvtQ0NRVFAAEEEEAAgTQLEPSlufWpOwKFBVK\/tIHnyaW+DwCAQJIECPqS1JrUBQEEqibws8PHqpY3GSOAAAK1ECgv6KtFyWK2j8vm3uVd97N5VGPMSk5xEUAAAQTiItDy8gbvLujVG1fEpciUM0ICBH0RagyKYuaC5y6CZ7oDApEXoIAIIBAvAYK+eLUXpUUAAQQQQAABBMoSIOgri42NCguwFIHkCBy4+yLv67Tk1IiaIIBAWgUI+tLa8tQ70QJdo6d615jq6\/JEV5TKIYBAdAUoWeQECPpCapI9B456OTUMHeAN+YMAAggggAACCERJgKAvSq1BWRBIhwC1RAABBBCogwBBX0joT6673rvup7lne0g5kg0CCCCAAAIIIBCeQLSCvvDqRU4xFSB4jmnDUWwEiggsvKTdu860Y+KsImuyuJCAu4Roz4F3C63GMgRyChD05WRhJgIIIIBAvQTYLwIIVEeAoK86ruSKAAIIIIAAAghESoCgL1LNQWG6zxzuITQcftMb9v3DVFCB5u5t3jWm+ro86DashwACCCCQbAGCvmS3L7VDAAEEEEAgWQLUpmwBgr6y6dgQAQQQQACB2groRpih1z1vujGmtntmb0kQIOhLQitSBwQQkAAJAQQQQKCAAEFfARwWIYAAAgiEI7B643LvOtPWVzaEkyG5IIBAyQLpCPpKZmEDBBBAAAEEEEAgWQIEfclqT2qDAAIhC+j6KaWQsyW7OgiwSwTSLkDQl\/YeQP0RQAABBBBAIBUCBH2paGYqWViApQgggAACCCRfgKAv+W1MDRFAAAEEEiKgG2EO3H2R6caYhFQpOtVIQUkI+kJq5Mvm3mW67qdrVGNIOZINAggggAACCCAQngBBX3iW5BSCwMJZ7V7w3DlxVgi5kQUCoQiQCQIIIJAIAYK+RDQjlUAAAQQQQAABBAoLEPQV9im8lKUIIIAAAggggEBMBAj6YtJQFBOBUgS6Rk\/1vibXtaalbMe6pwroonmlU5cwB4HjAvxFIC4CiQ76Nm3aZOPGjcukNWvWFG2XnTt3WmNjY2Ybt31ra6sdOXKk6PasgAACCCCAAAIIRFEgsUGfAr7Fixfb+vXrbffu3d7wvvvus2KB3969e712cttpW6WOjg4bOHCgt4w\/CAQTYC0EEHACew4c9UZHDx3gDfmDAAK1F0hk0Ldv3z5btmyZXXzxxTZ58mRPVcMFCxZYZ2enabk3M8efXbt22aRJk2zs2LE5luaf9eS6601fATX3bM+\/EksQQAABBBBAIF0CEaptIoM+na07dOiQzZ49uw91c3Ozaf6OHTv6zPdPKOgbOXIkZ\/X8KDUcX71huRc8t7yyoYZ7ZVcIIFBtgUU8jqnaxOSPQFGBxAZ9qvnw4cM1OCUpsDtlZu8MnQHcunWrvfrqq32u6VuyZEnvUv4jgAACoQqQGQIIIFBTgUQGffkEFQQOHjw432JzZwgnTJjgXQeoa\/m2bNliCgSD3sjxRk+P9fjSsWPHjBTcwF3vs3vfEdwq6Dv+Tk7\/C97\/sq1wLN8un2X2fKZLM3Z9ErfS3PzHZY07x7QNUxX0FWtcXfe3fft2W7VqVWbVYcOG2c0332wK\/pQyC\/KM\/MPjj9uMGTMy6bbbbrPu7u7SUorX1xuZaI8ePYpZBf3gd1561vuaXNea\/vznP8eyTMv9+\/erO3oJx8rex3htV+bnjiPv9r43qkPK081jWNz2gQceyByXdYzWiRw5pi2lKuhzZ\/JKbWSdIRw0aJDl+1rYn9+nP\/Up052+Ll199dU2YsQIUkCDfv36mf4NGDAAs4BmufrX4MFDxOils846C8syLYcMOfnNAI6VvY\/x2i7dL9druz\/vkWW9n+lY7I7LGl577bXe+2Pa\/iQy6FOQpoZUkKdhdho\/fnz2rNCmzxk1ypqamjJpzJgxpgCGNCCQg534pwMEZsHMcjnJ7wRlIPdceTBvgPXr198x4tj7QaySPuEg+\/UGLZXkk\/ZtvzXlk96D1xde0k6fLKFP6ljsPzZPnz7ddclUDRMb9A0ePPiUM3NdXV2m+VOmTMnZyHq2nx7GrKF\/BRc86u5f\/3zGEaiPAHtFAAEEEECgdIFEBn26Dq+lpcVWrFhhLoDTL23o4cyar+W5qNynAD3jT3fyah1tp4c8+5\/5p\/kkBBBAAIHgAvfyOKbgWKyJQBCBMtZJZNAnh\/nz59vatWutra3Ne\/zKnDlzTA9n1nwtV9Kvc+gn1xTYaVq\/uKHv+qdNm+Z9Pauzfm47\/80dWpeEAAIIIIAAAgjESSCxQZ8aYebMmZlHr+jxK\/6AT8s1rbt1ddeupl1SgKf1XdJ6bhlDBBBIl8DQ6573rqGKUa0pKgIIIJBTINFBX84aMxMBBBBAAAEEEEihAEFfmhqduiKAAAIIIIBAagUI+lLb9FQcAQQQQCCNAtQ5vQIEfSG1\/WVz7\/Ku++ka1RhSjmSDQPkCew4ezWzcMHRAZpwRBBCIt0DrKxu8X9tZvXF5vCtC6esiQNBXF3Z2mk9g0ax2L3junDgr3yrMr5oAGSOAAAIIJFmAoC\/JrUvdEECgIoHRQ06eJd1z4OTZ04oyZWMEEECgTgKBgr46lY3dIoAAAnUXOHD3Rd7XaXUvCAVAAAEEKhQg6KsQkM0RiKKAri3V8+V0rWkUy0eZYilAoRFAIOYCBH0xb0CKjwACCCCAAAIIBBEg6AuixDqFBViKAAIIIIAAApEXIOgLqYm2PdjqXffTcHhvSDmSDQIIIIAAAvERoKTRFyDoi34bpaqE925Y7gXPLa9sSFW9qSwCSRfgcUxJb2HqFwcBgr44tBJlRCDWAhQeAQQQQCAKAgR9UWgFyoAAAggggAACCFRZoK5BX5XrRvYIpFaguWe79zX5k+uuT60BFUcAAQQQ6CtA0NfXgykEEEAAgdoKsDcEEKiRAEFfjaDZDQIIIIAAApUKdEycZXrw+sJL2ivNiu1TKEDQl8JGj02VKSgCCCCAAAIIhCZA0BcC5Z4DR0PIhSwQQACB5ArwOKbktm21a0b+4QkQ9IVn6eU0eugAb8gfBBBAAAEEEEAgSgIEfVFqDcqCAAIlCNRmVV0\/pVSbvbEXBBBAoHoCBH3VsyVnBBBAAAEEEEAgMgKJDPoio0tBEEAAAQQQCFGggUuIQtRMX1YEfelrc2qMAAIIpEEgkXVseWWD9+D19sduTWT9qFR1BQj6QvKdek2H9+yk7jPPDilHskEAAQQQQAABBMITIOgLz5KcQhBYNKvdC547J84KIbc8WTAbAQQQQACBFAoQ9KWw0akyAggggAACaRdIY\/0J+tLY6tQZAQQQQAABBFInQNCXuianwmkQ6BrV6H1Nftncu9JQ3ZDr2De7A3df5F0433cuUwgggED8BAj64tdmlBgBBBBAAAEEEChZgKCvBDJWRQABBBBAAAEE4ipA0BdSy217sNX7Cmj04TdDypFsEEAAAQQiKECREIitQF2Cvvfee8\/efPNN27Rpk61du9Zuuukmb6hpzdfy2IpS8IoE7t2w3Aue9QDSijJiYwQQiJQAj2OKVHNQmJQK1DToO3z4sBfcnXfeefaRj3zE2tra7Gtf+5o99thj3lDTmv\/Rj37UHn74YTty5EhKm4Vqx1KAQiOAAAIIIBBhgZoEff\/zP\/9jTz75pF100UX2N3\/zN\/bhD3\/Y7r33Xvv+979v\/\/Iv\/2L\/8R\/\/4Q01vWrVKmtsbLTly5fbxz72MfvmN79pv\/zlLyNMSNEQQAABBBBAAIHjAlH+W\/WgT2frdAbvnnvusdtvv93+9V\/\/1b7+9a\/bH\/zBH9g555xjQ4cOtfe\/\/\/3eUNNXXnmlrV692nbu3Gl\/+Zd\/aQ8++KDNnz8\/yoaUDYHICTT3bPe+Jn9y3fWRKxsFQgABBBCoj0DVg75f\/flCjzEAABAASURBVOpXds0119jGjRvtkksusf79+weqqda79NJL7fnnn\/e2D7QRKyGAAAKRFaBgCCCAQH0Fqh70nXnmmd71ezqbV05VtZ2u8ytnW7ZBAAEEEEAgSQKdE2d5D17XjTFJqhd1qY1A1YM+fzV0I4eu1fu3f\/s3\/+w+4y+99JJ99rOftf379\/eZX8sJ3UU8btw4c2nNmjVV3T2ZI4AAAggggAAC1RaoadB39OhR++53v+s9riVXxXTDx7PPPmv\/+Z\/\/afV6bIsCvsWLF9v69ett9+7d3vC+++4zAr9cLcY8BBBAIJgAj2Mq6sQKCFRdoOpBn+68veGGG7yzZk1NTdbd3e09qsWdRfMPf+u3fssLrn7nd37HBg0aVPXKZ+9g3759tmzZMrv44ott8uTJ3mINFyxYYJ2dnabl3kz+IIAAAggggAACMROoetCnGzIWLlxo8+bNs8svv9wGDhxoeg7fVVddZdlJd\/l+4xvfMD225fTTT6855d69e+3QoUM2e\/bsPvtubm725u\/YsaPPfCYQqIkAO6mrwNDrnveuoaprIdg5AgggEIJA1YM+lXHMmDHe41duueUW+6M\/+iPTmT89viU7ffWrX\/UCLt38oe1qnRT0aZ\/Dhw\/X4JS0a9euU+YxAwEEEEAAAQQQqLZAGPlXPejTdXrvvvuuV1YFc+3t7fa7v\/u73nTQP\/qKOOi61VhPQeDgwYMDZf1GT4\/1+NKxY8eMFNzAIWMW3CyXlXPUMNdy5gXzlZ9LmAUzy+eEY2V+zhXH8hz9x2WNO8e0Dase9B04cMDmzp1ruhlCD2ouBVjra7srrriilM1qvm7D0AH2vs\/8b7tn8GBrX\/lXNmPGjEy67bbbvOsYdS0jqbuohd7Y1IC66Qev4l75jA4dPChGL+Vbh\/nFfd988+eeof7813\/tL9p\/62NavB5RKBev7XDaScdF9UelKLRrXMrwwAMPZI7LOkZf9fkv29EJc+z\/vfxL23PgqDhTkaoe9J111ll21113eQ9n1vP2\/uzP\/sx+\/OMf5\/1ptV\/84hf2ox\/9yJYsWWK\/\/\/u\/722n7evZGvraV9f6FSpDzzXX2D1Dhtidt7ZbR0dHJl199dU2YsQIUkCDfv36ecwDBgzALKBZrv410HcjVK7lzAv2mvSf4f\/AB86iT1bQJ39++Jj32v7tEYNxrMDxT3a\/YAfuvsjWPHcnjiU46ljsPzYvXPaN3qDvMlu+4adev0zLn6oHfYL87d\/+bfuHf\/gHu+OOO2zLli32yU9+0iZMmGBNTU19Im\/9Ju+5557rnRnUs\/z0c23aTtsrn2onfY2rfSjI0zA7jR8\/PnvWKdPTp0\/36qW6Kel6RgUw9Uhx3KceOKoL59dN+aTFsfxRKbMLntVBo1KmeJbjdBF6SabxrMOASLyWPMTeP\/3694tEeeLaluqHduJfXOtQj3LrWKxjskujRo06oZiuQU2CPpHqlzUU7Ok5eM8995zpMSg6C6ifaTvY+1WUnss3evRo+9M\/\/VPT8qefftr72TZtp+1rkRT06ZN99g0bXV1dpvlTpkypRTHYBwIIIIAAAmEJkA8CGYGaBX1uj6eddpqNHTvW+\/r2qaeess2bN9vOnTvt+9\/\/vj3++ON23XXXectPO+00t0nNhsOGDbOWlhZbsWKFKTjVjlU2XVeo+VqueSQEEEiPgL5KU0pPjakpAggkVaCmQZ\/uwj18+HBBS53x2759uxVbr2AmFSycP3++rV27NvMA6Tlz5nhnJTW\/gmzZFIGaCnSNavSeLXfZ3Lvy75clCCCAAAKpEqhp0KevcVtbW+3b3\/626VEu2dL79+83Pcj5K1\/5iunuzezltZqeOXOm9xNs+hk2JQK+WsmzHwQQQAABBBColsD7cmRctVm6eFPXxi1evNi7dk9Bnnams3v6qvcTn\/iEPfvss3bhhRfW5WfYVBZSfQVGDxngFSBNt9B7FeYPAggggAACVRaoadCnhzM\/\/PDDpl\/e0DV8CvIee+yxzNk93cjxne98x\/7iL\/7C6vEzbFW2JnsEEEAgRgIUFQEEkiZQ06BPeP3797cvfOELtn79ehs6dKjddNNN9vzzz5t+kq2Wj2dRWUjRE1i9cbn3DKrWVzZEr3CUCAEEyhZYOKvdu860c+KssvNgQwQQqEyg5kGfivvGG2\/YqlWr7LXXXrMPfOADpkBw5cqVprN8ua710zak6AhQEgQQQAABBBCIn0BNgz7dvfu3f\/u3Nnv2bO8RLfod3hdeeMGeeeYZmzhxoukGjk9\/+tP2k5\/8JH6SlBgBBBBAAIH0CFDTGArUNOjT3buPPvqo6Zct9Ey+trY279q9c845x3Stn36xQw9G1oOb3U0eMTSlyAjUXaCl9+txPVtu9YbldS8LBUAAAQQQiIZATYM+fY2rhy9\/61vfsuyfVtMvb\/zhH\/6hd9bv\/PPPN93RGw0iSoEAAiUJsDICCCCAQCQFahr0DRkyxC6\/\/HLvGr58Gjrrd+uttxq\/fpFPiPkIIIAAAmkV0I0w+n3yRbPa00pAvSsQqGXQV0Ex2RQBBBBAAAEEEECgEgGCvkr02BYBBBBAIJCAri\/VdaYtr2wItD4rIYBA+AIEfeGbkiMCdRdwv2gyeujxXzipe4EoAAIIIIBA3QUI+ureBBTACTBEIIoCun5KKYplo0wIIIBAKQIEfaVosS4CCCCAAAIIVFOAvKsoQNBXRVyyRgABBBBAAAEEoiJA0BeVlqAcCCBQWKAOSxt810R2HzxahxKwSwT6CrgHr9\/Lg9f7wjAVSICgLxATKyGAAAIIIIAAAvEWSELQF+8WoPR9BBZe0m66aL5j4qw+85lAAAEEEEAAgcoECPoq82NrBBBAAIFICFAIBBAoJkDQV0yI5QgggAACCCCAQAIECPoS0IhUobBAGpd29n49rq\/JF81qT2P1Q62zfkVCKdRMyQwBBBCogwBBXx3Q2SUCCCCAAAII1FSAnfUKEPT1IvAfAQQQQAABBBBIugBBX9JbmPohgEBhAZYigAACKREg6EtJQ8elmqs3LjddP9X6yoa4FJlyIoBAAIGFs44\/jknXmwZYnVXyCHSfeba3pOHwXm\/IHwRKESDoy6\/FEgQQQAABBBBAIDECBH2JaUoqggACCCAQvgA5IpAcAYK+5LQlNUEgI8Dvc2YoGEEAAQQQOCFA0HcCggECpQqwPgIIIIAAAnESIOiLU2tRVgQQQACBVAtsHtXo\/T75ZXPvSrVDhCofq6IQ9MWquSgsAggggAACZnsOHIUBgZIFCPpKJmMDBBBAIIAAq\/QReHLd9d7jmJp7tveZz0RpAg1DB5S2AWsj4BMg6PNhMIoAAggggAACCCRVgKCv9i3LHhFAIEYCQ6973ruGKkZFpqgIIIBATgGCvpwszEQAAQQQQKCaAuSNQO0FCPpqb84eEUAAAQQQQACBmgsQ9NWcnB0iUFiApQgggAACCFRDgKCvGqrkiQACCCCAQBUEdPfzgbsvMt0NXYXsU5PlngPvZuoa0TuiM+ULcyTRQd+mTZts3LhxmbRmzZqidjt37rTGxsbMNm771tZWO3LkSNHtWaEygYWXtHsXzXdMnFVZRmyNAAIIIIAAAn0EEhv0KeBbvHixrV+\/3nbv3u0N77vvPisW+O3du9cDcttpW6WOjg4bOHCgt4w\/CCCAQN0E2DECCCBQpkAig759+\/bZsmXL7OKLL7bJkyd7NBouWLDAOjs7Tcu9mTn+7Nq1yyZNmmRjx47NsZRZCCCQNgF9laaUtnpTXwQQSJ5AIoM+na07dOiQzZ49u0+LNTc3m+bv2LGjz3z\/hIK+kSNHxvGsnr8ajKdcoLP363E9X27RrPaUS1B9BBBAAAEnkNigTxUcPny4BqckBXanzOydoTOAW7dutVdffbXPNX1LlizpXcp\/BBBAAAEEoi5A+RDIL5DIoC9fdRUEDh48ON9ic2cIJ0yY4F0HqGv5tmzZYgoEuZEjLxsLEEAAAQQQQCAGAqkK+oq1h6772759u61atSqz6rBhw+zmm282BX9KmQV5Rnp6esyfjh07ZqTgBo4Vs+BmuaxyOeZaj3mFnZ2jhseO\/ZLXcgXvZzJUos8V7nPFfGToUrF1WX7S2n9c1rgzTNsw1kFfrserFLo7153JK7WRdYZw0KBBlu9rYX9+OiM4Y8YMc+m2226z7u5uUkCDO5+81XTR\/Nwd38EsoFmu\/uV\/vFCu5cwL\/pp0r++DBw\/RJyvok5fNvct7HNMzv\/FBHCtwPHTwoOuSOJbg+MADD2SOyzo+33PP1zOOaRp5n1l8q+vOzOlrWJfmz59vCtJUKwV5Gman8ePHZ88KbXrlypWmx7u4dPXVV9uIESNIAQ369evntcXpAwZgFtAsV\/8a0OsnSHnmWs68YK\/Js846S4xeGjJkMH2ygj7pIfb+GTRoII4VOA7sPQFhJ\/7xOh4RuC\/pWOyOyxp+6lOfOqGYrkGsz\/TlayoFfbp2L\/vMXFdXl2n+lClTcm6qZ\/vpYcwa+ldwwaPu\/vXPzzU+ffp0a2pqyqQxY8aYDsCkAYEcFKQ4V8yCmeVywrF8u2xP1x\/79esfqA9nbx+b6d4PCtUs60nHfjhWYN3vxAdj6\/1XzfZKWt46FvuPzaNGndMrmL7\/iQz6dB1eS0uLrVixwlwAp6+C9XBmzdfyXE3tOoSe8ac7ebWOttNDnv3P\/NN8EgJRFmh5ZYP3Nfm9G5ZHuZixKNueM8\/2yjn68JvekD8IIIBAXAUSGfSpMfQ179q1a62trc17\/MqcOXNMD2fWfC1X0vV\/+sk1BXaa1i9u6LTvtGnTvDN1OuvntvPf3KF1U5SoKgIIIFCRwJ4DRyvano0RQCAcgcQGfeKZOXNm5tEruubPH\/BpuaZ1t66uDdS0SwrwtL5LWs8tY4gAAgggUL5Aw9DTy9+YLa1rVKN3Q4xujKktB3tLgkCig74kNBB1QAABBBBAAAEEwhAg6AtDkTwQSLEAVUcgiMCT6673rjNt7t4WZHXWQQCBKggQ9FUBlSwRQAABBBBAAIGoCVQx6ItaVSkPAgggULrA1Gs6vGuouk\/cxVt6DmyBAAIIREOAoC8a7UApTgi4i7y52+8ECAME4i5A+RFAIDICBH2RaQoKggACCCCAAAIIVE+AoK96tuRcWIClCCCAAAIlCjT3bPduiNGNMSVuyuoIGEEfnQABBBBAAAEE6iTAbmspQNBXS232VVRg4SVLvYvmOyfNKrouKyCAAAIIIIBAcAGCvuBWrIkAAjUUYFcIIIAAAuEKEPSF60luCCCAAAIIIIBAJAViGPRF0pFCIRApgc6Js7yvyRfNao9UueJYmG0PtnoXzo8+\/GYci0+ZEUAAgYwAQV+GghEEkiPAcw6T05bUJI8AsxFAoGQBgr6SydgAgfgIjB4yID6FpaQIIIAAAlUVIOirKi+Z10GAXSKAAAIIIIBADgGCvhwozKqfwOqNK7zrp1pe3lC\/QrBnBE4INAw9eaZpT4g1AAAQAElEQVS0+8DRE3MZlCNw2dy7vOtMu0ZPLWdztkGgRAFWzyVA0JdLhXkIIIAAAggggEDCBAj6EtagVAcBBAoLsBQBBBBIqwBBX1pbnnonWqD1lQ3e1+SrNy5PdD2pHAIIIIBAcAGCvowVIwgggAACCCCAQHIFCPqS27bUDAEEEECgVIGIr981qtG7IUY3xkS8qBQvggIEfRFsFIqEAAIIIIAAAgiELUDQF7Yo+SVVgHohgEAFAk+uu967zrS5e1sFubApAghUIkDQV4ke2yKAAAIIIIBAigTiXVWCvni3H6VHAIEqC0y9psO7hmrPmcOrvCeyRwABBKorQNBXXV9yRwCBlAhQTQQQQCDqAgR9UW+hlJXPnU1pOPxmympOdRFAAAEEEKiuAEFfdX3NjB0ggAACCCAQjkDD0NMzGe05cDQzzggCQQQI+oIosQ4CCCCAAAKVCIS0re5+PnD3Raa7oUPKkmxSJEDQl6LGjkNVlzfN8y6aX37evDgUlzIigAACCCAQGwGCvtg0FQVNqADVQgABBBBAoCYCBH01YWYnCCAQV4FtD7Z6DxVuOLw3rlWg3AggkEegYeiAPEtqPbs2+yPoq40ze0GgpgIdE2d5X5MvvKS9pvtlZwgggEAcBNJ6EwxBXxx6J2VEAIHUClBxBBBAICwBgr6wJMkHAQQQQAABBBCIsABBX4Qbp3DRkr1Up9437zqU7EpSOwQQQKACgc6tP69g6\/RuquNL59Z0\/gAAQV96+30ka96+5RHvovn2f37Eul47GMkyRr1QCpa7XiNgDrudNu+iP5ZrurDzx3bZ3Lu860y7Rk8tNxu2yxJQ8GJZ85gsLpBmN4K+4v2DNeokkOYXZiXk3Qd5Sn8lfvm2VSBNn8ynU3g+fbKwT7lL6Y\/lyqV3O4K+Am2\/c+dOmzFjhmlYYDUWIRApgT0H3lV5SFUQ4CBbBVSyRACBmgkQ9OWh3rdvny1atMjeeuutPGswu9oCHGDLF255ZYP3NfnqjcvLz4QtEUAg0gKcQS2vedLl1teIoK+vhze1adMma2pqsu7ubm+aP\/UR0Ndpab3YtlxxBcqYlatXfDsunC9ulL2G+qP6ZfZ8pisXkOvyDa9XnlHKctA1pimrcqa6BH0ZiuMjCvja2tps6dKltnbt2uMz+Vs3gY4fcndaKfgKSnQgKGUb1g0uoABm865DwTeI8Jq1KJr6YnZQMnpIun4BIWxn3Qgz9LrnvRtjlLf6pIakYALZ\/THYVslZi6Avqy1nzpxpu3fvtvnz52ctYbIWAg1ZBwSd7Zt62z+bXqg62OogUotyxGkfMpGNPr0u3\/DTOBU9lmW97BsvZfpjLCtQg0K7\/igr9c8a7DK1u5Dv0Ou\/l+mTmk4tRp6Kqz\/qGHL8WJLu90iCvjydJL2zo1dzvYkpmNEBRElvcJeufsmOBzmve0ON6xOvS3qBu3G94F3Knqe83TINNa2kcZc0reSmNdS0ksaVNK6kcZeypzXfzVM5NO2SppU0raE\/qS5Kmqeh6qokA72JKclFy6PXeskskeuP6ovyV1soqV2U1E7+pLZRUvsqaVxJ45Uk15\/8eeSa519ezrjK6pK\/Xm5cdVaShUxcf1RZXA94ct313nWm5\/dsc7MYhijg+qTs1Qbqj0pqFyW1lWtDDf3Trk9ovpKb1lBtqKFL2dOar3lKGlfSuJLGXdK0kpvWUNO59pc9T9NK2kZJ4y6pHqqfkuZp6JK\/P8pH+wuRPJZZEfSF3Gw9PT3mT8eOHTNScAPXHLoRQQcJpdUbTt6M4F60OgOoF\/jmB79tLUtbvTT6yk+YS82fvzIzbhdeaC655V3\/5yumN0e9KWjokqaVuudcldlmT+N5puTy0FDTShpX0njXRy\/38vTn5caX3\/Swl5\/W0\/oqh4YuaVpJ0xq6tOfLX+39BP9TL+mNTG9cqreSDNo7bzUZZSc951CW9L3gfS+flRwLpdE7tlj71z7nJdcX1f\/8ybWn2ldJ02pP1z+yh\/7+p\/XzJdef3PJFX3va1H+z89O064Nu3aBDbauyuqQ+6FLD9QtM9XT1vvf+L+Xsj+qfDYePPww3nzPzg\/XV7L7of6+Us2uDXH1S\/c6lPXffn\/nArDZWcm2scTvxvpndx7Kn1Y80T8n\/vprdDxfOvy\/n+6jKozxcUj7+ecrTXy6VzU1r6O9\/2s71RQ2dhVz8yb0\/ZlumYTqVQZ8ewdLY2Gjjxo3LpDVr1oTS3q2trd5jXvSoF6XbbrvNuyFEN4WQuota7PjV8et9dIDQGQGl5p7tBdtG65SaiuU5+vBeCzvPUvPT+uWWU35C233GB4qa0y8L98s9Z55ty5vmmYYyzU4NZfQVtW12Pv5ptbvWKTX588ger3c5G04Effv376dPdhfuc4Vek\/Lzt23DW2+W\/F6lfqXt\/Plkj2udUpNr4+y83HSp+Wl9vRbc9rmGWqfUVKycufaTlHmpDPomT55s27dv967d0\/V7SmFdw7dy5Urr6OjIpKuvvtpGjBhBCmjw1PRP2dRrOuzSuXdl0sJZS\/O+3rpGTT25Xtt9trA3aVsNs9Pyrz5sSprf9cfXWvMHB5+SWqad7c3r\/NLt3rpav3NFZ2Y817Sb1\/mlO7xtXb4uL03bBR\/rk4fKoKRtXdK0yq6keZpeft5n89ZdCxb12mj9fOmej30x7L6XuvxkvPy8eeLOmbpGNWb6oL8d1H5Kbp5rU81TUr9Qahg6wJQ07pL6ktYJ2veUt9LoD03w8vL3PZenXXBBpg\/mylvzlIdLmlZSpZWHyqikaZf02nT1Czr89w9dnLo+FOYxYMiQwY7fG3ZOmpWz\/2W3h9rSnzZ\/dI7XV9SmLqmdXXL9oJTh5jzvq8oz+z0waL6df\/BFr5zKQ8mVVZXXuOqUXddi04Vez8o3ySmVQV81G3T69One4170yBelMWPG2IABA0gBDfr16+edUVEw5096cetAtrrlXHvySx\/y0rY\/P88O3HWhPfWt62z1mgW2+v75XvKmT4y7eRq233G1KbnxpxZ+yLKT8te81Td+wltX67fccFVmPNe0f562dcnl5aa1nksqg5Kb1lDTKruSf1p1VF1dcvVX\/i1zm6zhitnmt\/KPq6\/T\/yp7\/eU9w9cbrKlPNn98qrXe0OKl9tv\/xLy+2Nsf\/W3ob1O1s5LrF65d3bSGbttS+p620bbKT31D4\/7k79Paf3bemqc8XNK0kvqf8lG+SppW0nimrr31dgbnX3O5dU9pytsn9RqnT5bfJ\/v166+XdSapf+o1L3MFVno\/cG3h2kf9T23pT0+tuMLUhv6kdnbJ9YNShupjbvtcw1LycuuqzCqjy0\/jSpk+2Pter\/opufpqqNeikvqjkmzkpCSzDGDKRsIL+lIGR3VrI6BgT0GOXuQ6kOkge\/74waakZa4U\/nE3L0lD1c8l1V1JFu2zxppc9AaoYZLqHNW6qB38fVLuagsltYuWuxTVOoRRLldHDVVv1V9JfVKvV6X2WWPC2BV5FBGQs7wVGPn7o9pGqcjmiVmsurqkPqnU3vseqSQbGelsYWIqXEZFCPrKQGOT2gnoIKIXbu32GN89yUpv+PGtQTRLroOIK5nG773qXO9Dh5vHsK+Am5KVDrZpP8g6j2oN23sD6\/bewKZa+ScpX\/VJBX9p7pMEfQV6tJ7Zp2v\/dA1ggdVYVCUBvUB5MysNV4Gf3ErbirWDCsiXDyFBtY6vx2v4uEO1\/rZMG1GtrBObb5rfIwn6Etuto1YxylMrgdFZD7iu1X7ZDwK5BNJ8gM3lEeY82SqFmWca8kpzoEzQl4YeHtM66mu0mBa9rsVu\/fDJT\/4cEMJrClmm+WBRrqTc0vx1WrluQbaL5VnUIBWr8jo6W69+WeXdRDJ7gr5INguFQqB8AQ6w5dsV2zKtB4piLsWW6yBbbB2WI4BA9QUI+qpvzB4QQKC4QOTX4GvzyDcRBUQAgSICBH1FgFiMQNwEOBsVtxajvAgggEBtBKIf9NXGgb0ggAACCCCAAAKJFiDoS3TzUjkEEECg\/gINQ0+vuBBkcFyAywyOO\/C3PAGCvvLc2KoGAg1DB9RgL+wCAQQQQACBdAgQ9KWjnRNcS6qGAAIIIIBAeQJpO3NK0FdeP2ErBGIhwNnSWDQThUQAgUoFStz+xo8Osve981\/mf65piVnEcnWCvlg2W3IL3XDi2p+G3q92lZJbU2qGAAIIlC4w8sx+pW\/EFqcI\/K9fO2Jnbmy3j444dsqyJM8g6Ety68awbldMHmxtHx5sT7RNjmHpKXIEBShSxAT4MFdZgyjo03tky7SzTamy3Ng6bQIEfWlr8RjU94vTBxsHhsoaSgcDHRzmfuisyjJia3PX\/PCrEuV3BvVH\/VLMpecONPXL8nNiSwnoPfKeub+lURICJQmkN+griYmVEYiXwJ1XjLX7rzib4DmEZlt3zbl2y8wP2OKPjw4ht\/Rm4RzTK0DNEai\/AEFf\/duAEiBQFQHOqITHqjNU4eVGTlESoCwIpEmAoC9NrU1dEUAAAQQQQCC1AgR9qW16Kl5YgKUIIIAAAggkS4CgL1ntSW0QQAABBBBAICyBhOVD0JewBqU6CCCAAAIIIIBALgGCvlwqzEMAAQQKC7AUAQQQiJ0AQV\/smowCI4AAAggggAACpQsQ9JVuVngLliKAAAIIIIAAAhEUIOiLYKNQJAQQQACBeAtQegSiKEDQF8VWoUwIIIAAAggggEDIAgR9IYOSHQKFBViKAAIIIIBAfQQI+urjzl4RQAABBBBAIK0Cdao3QV+d4NktAggggAACCCBQSwGCvlpqsy8EEECgsABLEUAAgaoJEPRVjZaMEUAAAQQQQACB6AgQ9EWnLQqXhKUIIIAAAggggEAFAgR9FeCxKQIIIIAAArUUYF8IVCJA0FeJHtsigAACCCCAAAIxESDoi0lDUUwECguwFAEEEEAAgcICBH2FfViKAAIIIIAAAgjEQ6BIKQn6igCxGAEEEEAAAQQQSIIAQV8SWpE6IIAAAoUFWIoAAggYQR+dAAEEEEAAAQQQSIEAQV8KGrlgFVmIAAIIIIAAAqkQSEXQt3PnTpsxY4ZpWKxVtU5jY6ONGzeuT2ptbbUjR44U25zlCCCAAAIIxE6AAqdDIPFB3759+2zRokX21ltvBWrRvXv3euutX7\/edu\/enUkdHR02cOBAbxl\/EEAAAQQQQACBuAkkOujbtGmTNTU1WXd3d+B22bVrl02aNMnGjh0beBtWDE\/gzTfftEceecQ0DC\/X9OUkv3Ac02eXXWMss0XKm8axPLfsrXDMFmG6FIHEBn0K+Nra2mzp0qW2du3awCYK+kaOHMlZvcBi4a6oN7RvfvOb4WaawtxwDK\/RsQzHEkccwxEgl0oEyg76KtlpLbadOXOm99Xs\/PnzA+9OXwVv3brVXn311T7X8y1ZsiRwHqyIAAIIIIAAAghEUSCxQV852Lqe79ChQzZhwgQvYNQ1fVu2bDEFgtzIUY4os6mf+QAADDJJREFU2yCAQMIFqB4CCMRIgKDP11iTJ0+27du326pVqzJzhw0bZjfffLMp+FPKLMgz0tPTY6TyDRwrhuUbyg7Hyvxk6BKW4VjiiKN7TUVh6Ppj2oaxDvpyPV5lzZo1obfh8OHDbdCgQabr\/fJlPmrUKJs+fbrpjKAeD5P6NGOG95icUh3kJ2MNS92W9U+ayw\/Hkx6V9A0scayk\/4S9Lf0xvP6oY7aO3XqvTEuKddDnzszpa1iXSrmGL8xGVsdZuXKl6dEupA4cOjDgdUAfoA\/QB6LcB3TMDjMOiENesQ76wgbWHb96KLOG\/rx1rZ+mm5ubNcibFPjpETGkJu9ROTjgQB+gD9AH6ANR7QM6Zuc9oCd0AUGfr2Fdx1y2bJnpTl4t0lfIixcvtosvvth0ZlHzSAggUKkA2yOAAAII1Fog1UGfrv\/TT64psBO8fnFDp6KnTZvmnanSWb85c+bYggUL+tzcoXVJCCCAAAIIIIBAnAQiF\/RVA0\/P7NNdudln6nT9X675unvXXSOoodarRrnIEwEEEEAAAQQQqJVAKoK+WmGyHwQQQACBUATIBAEEqiBA0FcFVLJEAAEEEEAAAQSiJkDQF7UWoTyFBViKAAIIIIAAAmUJEPSVxXZyoyNHjngPZNZNH0oXXHBB5s7fk2sxVoqAfutYqZRtWPekgB45pL7oEn3ypE0pY7rBSzd6OUc9FFev91LyYN2+AnoqgvqjbqLru4SpIAJ6X3T90T\/Uaz7I9klap5K66HWs13MaDQn6Kug56jhtbW02cuRI0w0fSrrzd+7cuQR+ZbrqYPDEE0+UuTWbyU99cu3atX36pB45pCAGoWACsvrjP\/5j7859va537NjhbfjJT36S17YnUd6fFStWWHd3d3kbp3wrHW9+9rOf2ZVXXpl5batvKulmxZTzBK6+PnjodawN9LqW39KlS03vm2kIngn61PJlpkcffdRefvllmzdvXiYHdR5NELhIIXjSG5o+eemgEHwr1vQLyPDFF1\/0Dgr+g4D65ODBg62rq8u\/ekLHw6nWI488YpMmTTIFfspRj3O68cYb7dChQ6YDheaRShPQAZX3xdLM\/Gu\/88479sYbb9js2bP9sxkvUcD1wb\/+6782va61uV7nTU1N9swzz2gy0Ymgr4Lm3bVrl3dgGDt2bCaXYcOGmc726eCrg3BmASN5BeSkT1l6Q3vuuee8ZyTmXZkFeQX0BqbnTOqRQ7lWUn\/NNZ95pwrIUJYyPXUpc0oV0NkVPfReafTo0aVuzvq9AvplqPfee8+GDx\/eO8X\/cgR0rNGxuaWlxXSsdnnoda7Xu173bl5Sh6kJ+sJuQHUenWrXV7vqMNn5K4DRJ7Ps+UyfKiA\/veBeeOEFO+uss05dgTkVCehgoTNU48ePryifNG+soGXRokXehzydEUizRal113vlV77yFe\/DsC4zKHV71j8uoDP1b731li1cuNDctWi65lSXIhxfg7\/FBHRM1rFZ74W6FCaNjgR9xXpJGcvVocrYjE0QCF1AB9w77rjD9PWurgUKfQcJz1B+uuxAgZ4CZ33Fqw8pCa92qNXTZTA60Ooyg1AzLi+z2G7lztSvXr06c02ffi1Kvxqlr85jW7EaFtx9ANY3S\/LU9XxKaXIk6Kthh2NXCNRa4JZbbrEtW7bYzTff3OfrjFqXI677U4Cns9A6MNx5552mA6zOEMS1PrUut85C3XffffS\/EOD11WP2L0i5a9Eeeugh0weUEHaTiiz0IU7vja6yaXIk6HOtHuJQnyBCzI6saiGQwH3o8Q66aFl38vpv7EhgVWtSJRnqbGlnZyd38AYQVxCis8z6Sld2ATZhlRIF9KFElxjpTKq+uixx89SuLjPZOQCNz5gxw7tRJumOBH2u1UscqpOo4+i6Pr25ZW9+zjnn2BlnnJE9m2kEqi6g\/qivJAn4qk7NDgoIvP76697TDdQP3bVTOsOiR7boLn09r0\/XShbIgkUIhCqgm2B0qUuhTJO+jKCvghbWtXvZn7D0JrZ161bTpwYFhhVkz6YIlCyggE\/Xq+hRQuvXrzfOsJRM6H1NpqBZZ0r9W8tWH\/L4QOdXyT8+efJk09eR+mrcJV1qoLt3dX2fbtzy30GZPyeWqO+pTypp3IloXH1ST4zA0qnkH8pIVjpG61jt1pSj7urVMq3j5idxSNBXQavqqx5trjvT1Gk0rk+wGrplGichUCsBXaeigE8Xz+ugW6v9Jmk\/+rD2uc99znSG6uQF8mayVdCiZVonSXWmLtEWUH9Tv1P\/02vblVZ9Uq93\/7Ni3TKGuQVkpZuy3LFaa8k0LY4EfWrxMpM+EXznO9\/xtp4yZYp3G70+Qaxbt46L5j0V\/tRSQBfNP\/vss\/b22297Nxy4r9TcMPssQS3LFrd96QypzpQuXrzYe13LUK9tHXS1LG71obzxF1C\/U5\/UjTHqj0rqk3rN8wEvePvKSmayk6GSTBX4aVnwnOK5JkFfhe2mT2Du7j59hcFXFpWBOk\/dqVZZTunbWm9Y2V+nqU+6pH4q3\/TJlFfjbE9e2+U5+rfSB2U5zp8\/3z+b8YAC9MmAUEVWc\/3QvTfqfVO2RTZLxGKCvkQ0I5VAAAEEEKijALtGIBYCBH2xaCYKiQACCCCAAAIIVCZA0FeZH1sjUFiApQgggAACCEREgKAvIg1BMRBAAAEEEEAgmQJRqRVBX1RagnIggAACCCCAAAJVFCDoqyIuWSOAAAKFBViKAAII1E6AoK921uwJAQQQQAABBBComwBBX93oC++YpQgggAACCCCAQJgCBH1hapIXAggggAAC4QmQEwKhChD0hcpJZggggAACCCCAQDQFCPqi2S6UCoHCAiwtS+Ddd9+1tWvX2ubNmwtuv2nTJhs3bpyXGhsbbefOnQXX18IjR45Ya2urt422XbJkiWaTEEAAgcgIEPRFpikoCAIIVFtg165dtnr1ajt69GigXX3xi1+0lStX2qhRo4quP2DAAPvyl79st99+u\/3mb\/5m0fVZAQEEEKhUoNTtCfpKFWN9BBBIjcDv\/d7v2SWXXGJDhgwpWud+\/fpZU1OTXXTRRXbGGWcUXZ8VEEAAgVoLEPTVWpz9IYBAXQT0le2cOXPs7bfftra2Nrvgggts3759gcvy3nvv2VNPPWUXXnihffCDH7QJEyZYS0uL\/eQnPwmcR+1WZE8IIIDAqQIEfaeaMAcBBBIoMGnSJFu6dKnpa1h9bXvLLbfYoEGDAtf0mWeesRtuuMHOPfdcu\/POO+3GG2+0PXv22DXXXGPd3d2B82FFBBBAoF4CBH31kq\/TftktAmkVGDFihDU3N1v\/\/v1NX9vqjN3pp58emOO5556zqVOn2ooVK+zyyy+3efPmedf7\/eIXv7B\/\/\/d\/D5wPKyKAAAL1EiDoq5c8+0UAgVgJ6GaObdu22QMPPGD79+\/3yv6Rj3zEfvjDH9rMmTO9af4gEBMBiplSAYK+lDY81UYAgdIEPvOZz5ge3\/L1r3\/dpk+fbgr4\/uqv\/spef\/310jJibQQQQKBOAgR9dYJntwhEUoBC5RUYOXKkPfbYY6aveXVN4K\/92q\/ZI488Yp\/4xCfs6aefzrsdCxBAAIGoCBD0RaUlKAcCCERe4LTTTrOxY8dae3u7fe973zPd3HHOOefY448\/brq2L\/IVoIAIIJBqgaBBX6qRqDwCCKRb4PDhw95jXj7\/+c+bftXDaeghzKXcAey2Y4gAAgjUQ4Cgrx7q7BMBBOoioMe16GvZv\/u7vzM9t88fwBUq0JlnnmnTpk2zF1980b7whS\/Y3\/\/933vpS1\/6kr366qt21VVXmfItlEcyllELBBCIswBBX5xbj7IjgEBJAmPGjLFPf\/rT9oMf\/MD7iraUmzA+97nPmW7ceOONN+ymm27yks4APvTQQ\/bxj3+8pHKwMgIIIFAPAYK+eqgncJ9UCYE4COgZfXpAs87O\/ehHP7KJEycGLvb73\/9+74yeruV77bXXTOm73\/2udxfvaaedFjgfVkQAAQTqJUDQVy959osAAggggECyBKhNxAUI+iLeQBQPAQTqJ6CzgRs3brSDBw8WLcSxY8dsy5Yt9vzzz9s777xTdH1WQAABBGotQNBXa3H2h0AaBWJa5\/vvv9\/7vd2enp6iNTh69Kjpwc263u+\/\/\/u\/i67PCggggECtBf4\/AAAA\/\/9ISu4GAAAABklEQVQDAJPa7krPfeMuAAAAAElFTkSuQmCC","height":384,"width":637}}
%---
