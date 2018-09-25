script "LiveCodeMultiSearchMainGroupid1053ResourcesListButtonBehavior"
on menuPick pItemName
   set the visible of widget "Browser Resources List" to true
   set the url of widget "Browser Resources List" to pItemName
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
