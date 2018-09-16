%% Prep test sheet (pts) 


% random word arrangement generator: index

index=randperm(full_plate, j);
index=index';

% test sheet: deutsch + answers 
global collect_deutsch collect_english
for k=1:j 
  deutsch_element=deutsch{index(k,1),1};
  english_element=english{index(k,1),1};
  
  collect_deutsch{k,1}={deutsch_element};
  collect_english{k,1}={english_element};    
end



