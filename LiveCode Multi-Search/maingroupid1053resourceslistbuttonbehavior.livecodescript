script "LiveCodeMultiSearchMainGroupid1053ResourcesListButtonBehavior"
on menuPick pItemName

   local tMenuHistory
   local tNBSelected

   --close any open browsers
   put the hilitedItemNames of widget "NavigationBar" of card "Main" of stack "LiveCode Multi-Search" into tNBSelected

   if tNBSelected is not empty then
      put "Browser " & tNBSelected into tNBSelected
      set the visible of widget tNBSelected of card "Main" of stack "LiveCode Multi-Search" to false
   end if

   --remove hilited button for navigation bar
   set the hilitedItemNames of widget "NavigationBar" of card "Main" of stack "LiveCode Multi-Search" to empty

   --check which item in the button list is selected and retrieve the corresponding custom property value
   put the menuhistory of btn "Resources List" into tMenuHistory
   set the url of widget "Browser Resources List" to item 2 of line tMenuHistory of the cpResources of stack "LiveCode Multi-Search"

   set the visible of widget "Browser Resources List" of card "Main" of stack "LiveCode Multi-Search" to true

end menuPick
