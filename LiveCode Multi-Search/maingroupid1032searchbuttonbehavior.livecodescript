script "LiveCodeMultiSearchMainGroupid1032SearchButtonBehavior"
script "LiveCodeMultiSearchMainGroupid1032SearchButtonBehavior"

on mouseUp pMouseButton
   
   local tSearch
   local tRep
   local tExtension
   local tTerm
   local tMultiTerm
   
   repeat with tRep = 1 to the number of buttons of grp "extensions"
      if the hilite of button tRep of grp "extensions" is true then
         
         put "+extension:" & the short Name of button tRep of grp "extensions" after tExtension
         
      end if  
      
   end repeat
   
   local tSearchGist
   local tSearchLCForum
   local tSearchNabbleForum
   local tSearchStackOverflow
   local tSearchLCLessons
   local tSearchGitHub
   local tSearchLCDict
   local tSearchLCWiki
   
   put URLEncode(fld "Search") into tSearch
   
   put char 1 to -1 of fld "Search" into tTerm
   put tTerm into tMultiTerm
   replace space with "+" in tMultiTerm 
   
   --grt the hilited buttons of the Navigation bar and TabLock bar
   local tTabToCheck
   
   
   set the itemDel to comma
   
   -- put the hilitedItems  of widget "TabLock"
   
   if the hilitedItems of widget "TabLock" contains 1 then
   else
      --LC Forum
      put "http://forums.livecode.com/search.php?keywords=" & tMultiTerm into tSearchLCForum
      set the url of widget "Browser LC Forum" to tSearchLCForum
   end if
   
   if the hilitedItems of widget "TabLock" contains  2 then
   else
      --Nabble
      put "http://runtime-revolution.278305.n4.nabble.com/template/NamlServlet.jtp?macro=search_page&node=278305&query=" & tTerm into tSearchNabbleForum
      set the url of widget "Browser Nabble Forum" to tSearchNabbleForum
   end if
   
   if the hilitedItems of widget "TabLock" contains  3 then
   else 
      --StackOverflow
      put "https://stackoverflow.com/search?q=%5Blivecode%5D+" & tTerm into tSearchStackOverflow
      set the url of widget "Browser StackOverflow" to tSearchStackOverflow
   end if
   
   if the hilitedItems of widget "TabLock" contains  4 then
   else
      --LC Dictionary
      put "http://2108.co.uk/LCDict/api.html?search=" & tTerm into tSearchLCDict
      set the url of widget "Browser LC Dictionary" to tSearchLCDict
   end if
   
   if the hilitedItems of widget "TabLock" contains  5 then
   else  
      --LC Lessons
      put "http://lessons.livecode.com/searches?&text=" & tTerm & "&commit=Search" into tSearchLCLessons
      set the url of widget "Browser LC Lessons" to tSearchLCLessons
   end if
   
   if the hilitedItems of widget "TabLock" contains  6 then
   else  
      --GitHub
      put "https://github.com/search?q=livecode " & tTerm into tSearchGitHub
      set the url of widget "Browser GitHub" to tSearchGitHub
   end if
   
   if the hilitedItems of widget "TabLock" contains  7 then
   else  
      --Gist
      put "https://gist.github.com/search?q=" & tTerm & tExtension & "&ref=opensearch" into tSearchGist
      set the url of widget "Browser GitHub Gist" to tSearchGist
   end if
   
   if the hilitedItems of widget "TabLock" contains  8 then
   else  
      --LC Wiki
      put "http://livecode.wikia.com/wiki/Special:Search?query=" & tMultiTerm into tSearchLCWiki
      set the url of widget "Browser LC Wiki" to tSearchLCWiki
   end if   
   
   --     --LC Dictionary -- local by 
   --     do "displayEntryListGrep(" & quote & fld "Search" & quote & ")" \
         --           in widget "Browser LC Dictionary"
   --     -- don't need this code if using the above method.  The search field
   --     -- does not get populated, but the search is executed immediately
   --     -- requires the preload in the preOpenStack/emptyURLs handler
   --     --put "http://2108.co.uk/LCDict/api.html?search=" & fld "Search" into tSearchLCDict
   --     --set the url of widget "Browser LC Dictionary" to tSearchLCDict
   
 end mouseUp

