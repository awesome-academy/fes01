$( document ).ready(function() {
  var a = 0;
  $(".add-answer").click(function() {
    nestedForm = $(".list-answers").last();
    newNestedForm = nestedForm.clone();
    formsOnPage = $(".list-answers").length;
    $(newNestedForm).find("input").each (function(){
      oldId = $(this).attr("id");
      if(oldId){
        newId = oldId.replace(new RegExp(/_[0-9]+_/), "_" + (formsOnPage + 1).toString() + "_");
        $(this).attr("id", newId);
        }
      oldName = $(this).attr("name");
      newName = oldName.replace(new RegExp(/\[[0-9]+\]/), "[" + (formsOnPage + 1).toString() + "]");
      $(this).attr("name", newName);
      });
    $(".list-answers-area").append(newNestedForm);
  })
})
