script "LiveCodeMultiSearchStackBehavior"
--LiveCode Multi-Search - Andy piddock 11/2018


on preOpenStack

   put "V 1.0.6" into fld "Version" of card "Main" of stack "LiveCode Multi-Search"
   put empty into fld "Search" of card "Main" of stack "LiveCode Multi-Search"

   --setup Navigation Bar - segmented control widget
   local tNumberList
   local tNamesList
   local tLabelsList

   set the itemCount of widget "NavigationBar" of card "Main" of stack "LiveCode Multi-Search" to 8

   put "100,100,100,100,100,100,100,100" into tNumberList
   put "LC Forum,Nabble Forum,StackOverflow,LC Dictionary,LC Lessons,GitHub,GitHub Gist,LC Wiki" into tNamesList
   put "LC Forum,Nabble Forum,StackOverflow,LC Dictionary,LC Lessons,GitHub,GitHub Gist,LC Wiki" into tLabelsList

   set the width of widget "NavigationBar" of card "Main" of stack "LiveCode Multi-Search" to the number of items of tNamesList * 100

   set the itemMinExtents of widget "NavigationBar" of card "Main" of stack "LiveCode Multi-Search" to tNumberList
   set the itemNames of widget "NavigationBar" of card "Main" of stack "LiveCode Multi-Search" to tNamesList
   set the itemLabels of widget "NavigationBar" of card "Main" of stack "LiveCode Multi-Search"  to tLabelsList

   set the left of widget "NavigationBar" of card "Main" of stack "LiveCode Multi-Search" to the left of card "Main" of stack "LiveCode Multi-Search" +80

   emptyUrls

end preOpenStack


on openStack

   local tResources
   local tCpCount
   local tResourcesCount
   local tResourcesString
   local tFile
   local tResourcesList
   local tDocumentsFolder

   --set the itemDelimiter to "/"
   --get item 1 to -2 of the effective filename of this stack
   put specialFolderPath("Documents") into tDocumentsFolder
   put tDocumentsFolder & "/lcmsresources.txt" into tFile

   if there is a file tFile then--config file exists
      put url("file:" & tFile) into tResources

   else
     open file tFile
     put "LiveCode Super Site,http://livecodesupersite.com/" & return into tResourcesList
     put "LiveCode Cheat Sheets,https://livecode.com/resources/cheat-sheets/" & return after tResourcesList
     put "BYU LiveCode Gateway,http://livecode.byu.edu/" & return after tResourcesList
     put "Reactor Lab,http://reactorlab.net/" & return after tResourcesList
     put "LiveCode Learning,http://learninglivecode.blogspot.com/" & return after tResourcesList
     put "LiveCode Server Guide,https://activethought.net/livecode-server/introduction/" after tResourcesList

     write tResourcesList to file tFile
     close file tFile
     put url("file:" & tFile) into tResources
   end if

   --create resources button

   set the itemdel to comma

   --copy resources list from text file into a CP
   set the cpResources of stack "LiveCode Multi-Search" to tResources

   put the number of lines of the cpResources of stack "LiveCode Multi-Search" into tCpCount

   repeat with tResourcesCount = 1 to tCpCount

   put item 1 of line tResourcesCount of the cpResources of stack "LiveCode Multi-Search" & return after tResourcesString

   end repeat

   set the text of of btn "Resources List" of card "Main" of stack "LiveCode Multi-Search" to tResourcesString


end openStack

--empty browser urls
on emptyUrls


   local tControlCount
   local tControl
   local tBrowserWidgetNames

   --get number of controls of the current card and filter out those which are Browser widgets
   --and combine into a comma seperated items list

   put the number of controls of this card into tControlCount

   repeat with tControl = 1 to tControlCount

      if the name of control tControl contains "Browser" then
         put the name of control tControl & comma after tBrowserWidgetNames
      end if

   end repeat

   --remove trailing comma
   delete char -1 of tBrowserWidgetNames


   --hide Browser widgets
   repeat with tBrowserSelected = 1 to the number of items of tBrowserWidgetNames

      set the url of control item tBrowserSelected of tBrowserWidgetNames to empty

   end repeat


end emptyUrls

   on browserNavigateBegin pUrl
  -- set the visible of widget "Spinner" to true
   put "searching / loading...." into fld "Status"
end browserNavigateBegin

on browserNavigateComplete pUrl
  -- set the visible of widget "Spinner" to false
   put empty into fld "Status"
end browserNavigateComplete
