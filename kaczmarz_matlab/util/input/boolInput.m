function bool = boolInput(prompt)
%BOOLPROMPT Prompts for a boolean input from the user.
    if ~exist('prompt', 'var'), prompt = 'Accept?'; end
    prompt = [prompt ' (y / n) '];
    
    answer = input(prompt, 's');
    while ~strcmp(answer, 'y') && ~strcmp(answer, 'n')
         answer = input(prompt, 's');
    end
        
    bool = strcmp(answer, 'y');
end