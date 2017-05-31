@echo off
:: populate dynamic_content with possibly dangerous content
set /p dynamic_content= <data.txt
:: double qoutes, so %dynamic_content% can be used safely between quotes
set "dynamic_content=%dynamic_content:"=""%"
:: this is now safe, but all quotes are doubled
echo "%dynamic_content%"
:: manually escape first ^ then <>|&()
:: variable will be expanded outside of quotes twice (**), therefore three carets...
set "dynamic_content=%dynamic_content:^=^^^^%"
set "dynamic_content=%dynamic_content:<=^^^<%"
set "dynamic_content=%dynamic_content:>=^^^>%"
set "dynamic_content=%dynamic_content:|=^^^|%"
set "dynamic_content=%dynamic_content:&=^^^&%"
set "dynamic_content=%dynamic_content:(=^^^(%"
set "dynamic_content=%dynamic_content:)=^^^)%"
:: replace "" with escaped quote ^" (must be done outside of quotes, this is the first expansion, mentioned at (**) )
set dynamic_content=%dynamic_content:""=^^^"%
:: now %dynamic_content% can be used safely outside of qoutes (this usage is the second expansion, mentioned at (**) )
echo %dynamic_content%
:: compare
type data.txt

