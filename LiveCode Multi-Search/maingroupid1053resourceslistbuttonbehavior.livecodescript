script "LiveCodeMultiSearchMainGroupid1053ResourcesListButtonBehavior"
on menuPick pItemName
set the visible of widget "Browser Resources List" to true
set the url of widget "Browser Resources List" to pItemName
   set the backcolor of  graphic "ResourcesBG" to empty
end menuPick


on mouseDown
   set the backcolor of graphic "ResourcesBG" to blue
end mouseDown

on mouseUp
   set the backcolor of  graphic "ResourcesBG" to empty
end mouseUp

on mouseLeave
   set the backcolor of  graphic "ResourcesBG" to empty
end mouseLeave
