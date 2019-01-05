$( document ).ready(function() {
  URL = "/searches"
  getDataLesson(URL)
  function getDataLesson(URL) {
    var data = $.ajax({
      type: 'GET',
      url: URL,
      success: function(data){
        getLesson(data)
      }
    })
  }
  var listLession = []
  function getLesson(data){
    var lessons = data.data
    Object.keys(lessons).forEach(function(key){
      listLession.push(lessons[key].name)
    })
  }
  $("#search-exc").autocomplete({ source: listLession });
})
