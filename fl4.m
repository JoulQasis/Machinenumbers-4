function [numbersSUM] = fl4(Machnumber1,Machnumber2)
len1 = length(Machnumber1);
len2 = length(Machnumber2);
cnt = 0 ;
charadd = 0;
if len1 == len2
    % Checking if all the numbers are 0s and 1s without the last index
    for i=1:len1-1
        if ((Machnumber1(i) == 0) || (Machnumber1(i) == 1)) && ((Machnumber2(i) == 0) || (Machnumber2(i) == 1))
            cnt = cnt+1;
        else
            disp("Machine number isnt correct!");
        end
    end
end
% Checking if the last index is a digit
if (cnt == len1-1) && (Machnumber1(end) == floor(Machnumber1(end))) && (Machnumber2(end) == floor(Machnumber2(end)))
    res=1;
else
    res=0;
end
%checking if the machine number is equal to zero
if Machnumber1(1:end-1) == all(zeros) & Machnumber2(1:end-1) == all(zeros)
    disp("Your answer is zero!!");
end

if res
    % checking if both of the numbers are positive
    if Machnumber1(1) == 0 && Machnumber2(1) == 0
        %Checking if the characteristics are euqal
        if Machnumber1(end) == Machnumber2(end)
            % Adding both of the vectors without the charactersitics
            numbersSum = Machnumber1(1:len1-1) + Machnumber2(1:len2-1);
            % checking all the numbers in the mantissa and correcting them
            for i=length(numbersSum):-1:1
                if numbersSum(i) >= 2
                    numbersSum(i) = numbersSum(i) - 2;
                    numbersSum(i-1) = numbersSum(i-1) + 1;
                end
            end
            disp(numbersSum);

            % checking if the first digit is a 1 if yes we add 0 at the
            % beginning for the sign if not we keep it normal.
            if  numbersSum(1) == 1
                numbersSum = [0,numbersSum,Machnumber1(end)];
            else
                numbersSum = [numbersSum,Machnumber1(end)];
            end
        end
        %if the charactersitics dont match
        if Machnumber1(end) ~= Machnumber2(end)
            % checking the difference between charactersitics
            diffchar1char2 = abs(Machnumber1(end) - Machnumber2(end));
            %checking which charactersitic is bigger
            if Machnumber1(end) > Machnumber2(end)
                %making the charactersitics equal
                for i= 1:diffchar1char2
                    Machnumber2(end) = Machnumber2(end) + 1;
                end
                %changing the machine number after chaning the charactersitics
                Machnumber2 = [zeros(1,i),Machnumber2(1:end-i-1),Machnumber2(end)];
                %checking which charactersitic is bigger
            else
                %making the charactersitics equal
                for i= 1:diffchar1char2
                    Machnumber1(end) = Machnumber1(end) + 1;
                end
                %changing the machine number after chaning the charactersitics
                Machnumber1 = [zeros(1,i),Machnumber1(1:end-i-1),Machnumber2(end)];
            end

            numbersSum = Machnumber1(1:len1-1) + Machnumber2(1:len2-1);
            % checking all the numbers in the mantissa and correcting them
            for i=length(numbersSum):-1:1
                if numbersSum(i) >= 2
                    numbersSum(i) = numbersSum(i) - 2;
                    numbersSum(i-1) = numbersSum(i-1) + 1;
                end
            end
            % checking if the first digit is a 1 if yes we add 0 at the
            % beginning for the sign if not we keep it normal.
            if  numbersSum(1) == 1
                numbersSum = [0,numbersSum,Machnumber1(end)];
            else
                numbersSum = [numbersSum,Machnumber1(end)];
            end
            disp(numbersSum);

        end
        % checking if one of the numbers is negative
    else
        if Machnumber1(end) == Machnumber2(end)
            %checking which number is bigger
            for i = 1:len1-1
                if Machnumber1(i) > Machnumber2(i)
                    rslt = 1;
                    break;
                elseif Machnumber1(i) < Machnumber2(i)
                    rslt = 0;
                    break;
                else

                end
            end
            %correction
            %if first machine number is bigger than the second
            if rslt
                %we subtract both of the numbers
                numbersSum = Machnumber1(1:len1-1) - Machnumber2(1:len2-1);
                for i=length(numbersSum):-1:1
                    %correction starts here
                    if numbersSum(i) < 0
                        numbersSum(i-1) = numbersSum(i - 1) - 1;
                        numbersSum(i) = numbersSum(i) + 2;
                    end
                end
                %the sum of both numbers after the correction
                numbersSum = [numbersSum,Machnumber1(end)];
                disp(numbersSum);
            %if second machine number is bigger than the first
            else
                %we subtract both of the numbers
                numbersSum = Machnumber2(1:len2-1) - Machnumber1(1:len1-1);
                for i=length(numbersSum):-1:1
                    if numbersSum(i) < 0
                        numbersSum(i-1) = numbersSum(i - 1) - 1;
                        numbersSum(i) = numbersSum(i) + 2;
                    end
                end
                %the sum of both numbers after the correction
                numbersSum = [numbersSum,Machnumber2(end)];
                disp(numbersSum);
            end
        end

        if Machnumber1(end) ~= Machnumber2(end)
            % checking the difference between charactersitics
            diffchar1char2 = abs(Machnumber1(end) - Machnumber2(end));
            %checking which charactersitic is bigger
            if Machnumber1(end) > Machnumber2(end)
                %making the charactersitics equal
                for i= 1:diffchar1char2
                    Machnumber2(end) = Machnumber2(end) + 1;
                end
                %changing the machine number after chaning the charactersitics
                Machnumber2 = [1,zeros(1,i-1),Machnumber2(1:end-i-1),Machnumber2(end)];
                %checking which charactersitic is bigger
            else
                %making the charactersitics equal
                for i= 1:diffchar1char2
                    Machnumber1(end) = Machnumber1(end) + 1;
                end
                %changing the machine number after chaning the charactersitics
                Machnumber1 = [1,zeros(1,i-1),Machnumber1(1:end-i-1),Machnumber2(end)];
            end

            numbersSum = Machnumber1(1:len1-1) + Machnumber2(1:len2-1);
            %checking which number is bigger
            for i = 1:len1-1
                if Machnumber1(i) > Machnumber2(i)
                    rslt = 1;
                    break;
                elseif Machnumber1(i) < Machnumber2(i)
                    rslt = 0;
                    break;
                else

                end
            end
            %if first machine number is bigger  than  the  second
            if rslt
                %we subtract both of the  numbers
                numbersSum = Machnumber1(1:len1-1) - Machnumber2(1:len2-1);
                for i=length(numbersSum):-1:1
                    %correction start here
                    if numbersSum(i) < 0
                        numbersSum(i-1) = numbersSum(i - 1) - 1;
                        numbersSum(i) = numbersSum(i) + 2;
                    end
                end
                %the sum of both numbers after the correction
                numbersSum = [numbersSum,Machnumber1(end)];
                disp(numbersSum);
            %if second machine number is bigger than the first
            else
                %we subtract both of the numbers
                numbersSum = Machnumber2(1:len2-1) - Machnumber1(1:len1-1);
                for i=length(numbersSum):-1:1
                    if numbersSum(i) < 0
                        numbersSum(i-1) = numbersSum(i - 1) - 1;
                        numbersSum(i) = numbersSum(i) + 2;
                    end
                end
                %the sum of both numbers after the correction
                numbersSum = [numbersSum,Machnumber2(end)];
                disp(numbersSum);
            end

        end

    end

end
numbersSUM = numbersSum;
end