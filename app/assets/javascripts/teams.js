$(document).ready(function() {
  loadLinks();

  function loadLinks() {
    $.ajax({
      method: "GET",
      url: "/api/v1/teams",
      dataType: "JSON",
      success: function(response){
        response.map(function(team){
          $('#team-names-list').append(createLink(team));
        });
      }
    });
  }

  function createLink(team) {
     return (
        "</h2><a data-team-id='"+ team[0] + "' data-team-name='" + team[1] + "'>" + team[1] + "</a></h2><br>");
  }
});
