script "LiveCodeMultiSearchMainGroupid1053ResourcesListButtonBehavior"
on menuPick pItemName
   
   local tMenuHistory
   
   set the visible of widget "Browser Resources List" to true
   
   --check which item in the button list is selected and retrieve the corresponding custom property value
   put the menuhistory of btn "Resources List" into tMenuHistory
   set the url of widget "Browser Resources List" to item 2 of line tMenuHistory of the cpResources of stack "LiveCode Multi-Search"
   
   set the backcolor of  graphic "ResourcesBG" to empty
   
end menuPick


on mouseDown
   set the backcolor of graphic "ResourcesBG" to "10,94,244"
   set the textcolor of btn "Resources List" to white
end mouseDown

on mouseUp
   set the backcolor of  graphic "ResourcesBG" to empty
   set the textcolor of btn "Resources List" to black
end mouseUp

on mouseLeave
   set the backcolor of  graphic "ResourcesBG" to empty
   set the textcolor of btn "Resources List" to black
end mouseLeave
