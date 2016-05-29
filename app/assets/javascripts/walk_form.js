$(document).on('ready page:load', function() {

  //after form partials are added
  if ($('#map_walk-new').length > 0) {

    $('button.plot_walk').on('click', function(e){
      console.log('button click!');
      var waypoints = [];
      $('input.address').each(function (index){
        waypoints.push({address: $(this).val(), order: index});
      });
        console.log(waypoints);

          $.ajax({
            dataType: 'json',
            url: '/walks/new',
            method: 'GET',
            data: {waypoints: waypoints},
            success: function(return_data){
              console.log('returned json file: ' + return_data);
              // plot_waypoints_array(return_data, map_show);
              // initPathMap(return_data, map_show);
              initPathMap(return_data, map_new)
            }
        });
    });

  // on clicking 'submit', query for all waypoint partial forms (input.order hidden field), insert index value into hidden field, trigger submit on the form
  $('input.walk_submit').on('click', function(e) {
    e.preventDefault();

    $('input.order').each(function(index) {
      $(this).val(index);
    });
    $('form#new_walk').trigger('submit');
  });
}
});
