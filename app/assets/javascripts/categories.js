$(document).on('turbolinks:load', function() {
  // var data = [
  //   {'id': '1', 'parent': '#', 'text': 'Root node 1', 'state': {'opened': true}},
  //   {'id': '2', 'parent': '1', 'text': 'Child node 1'},
  //   {'id': '3', 'parent': '1', 'text': 'Child node 2'},
  //   {'id': '4', 'parent': '#', 'text': 'Root node 2'}
  // ];

  $('#jstree-categories').jstree({
    'core': {
      'check_callback': true,
      'data' : {
        'url': function(node) {
          return 'categories.json'; // GET /categories.json
        }
      }
    },
    'plugins': ['dnd']
  });

  $('#jstree-categories').on('move_node.jstree', function(e, obj) {
    // console.log(n.old_parent + ":" + n.old_position + " -> " + n.parent + ":" + n.position);
    var id = obj.node.id,
      parent_id = obj.node.parent,
      new_position = obj.position;

    var data = {'category': {'parent_id': parent_id, 'new_position': new_position}},
        url = '/categories/' + id + '.json';

    // PATCH
    $.ajax({
      'type': 'PATCH',
      'data': data,
      'url': url
    })
  });

  $('#create-category').on('click', function() {
    var jstree = $('#jstree-categories').jstree(true);
    var selected = jstree.get_selected();
    if(!selected.length) return false;

    selected = selected[0];

    // POST /categories.json
    $.ajax({
      'type': 'POST',
      'data': {'category': {'name': 'New node', 'parent_id': selected}},
      'url': '/categories.json',
      'success': function(res) {
        selected = jstree.create_node(selected, res);
        if (selected) jstree.edit(selected);
      }
    })
  });

  $('#rename-category').on('click', function() {
    var jstree = $('#jstree-categories').jstree(true);
    var selected = jstree.get_selected();
    if(!selected.length) return false;

    selected = selected[0];
    jstree.edit(selected);
    return false; // prevent reload page
  });

  $('#jstree-categories').on('rename_node.jstree', function(e, obj) {
    // console.log(obj.node.id + ": " + obj.old + " -> " + obj.next)
    var id = obj.node.id,
        renamed_name = obj.text,
        url = '/categories/' + id + '.json';

    // PATCH
    $.ajax({
      'type': 'PATCH',
      'data': {'category': {'name': renamed_name}},
      'url': url
    })
  });

  $('#delete-category').on('click', function() {
    var jstree = $('#jstree-categories').jstree(true);
    var selected = jstree.get_selected();
    if(!selected.length) return false;

    selected = selected[0];
    var id = selected,
        url = '/categories/' + id + '.json';

    // Delete
    $.ajax({
      'type': 'DELETE',
      'url': url,
      'success': function() {
        jstree.delete_node(selected);
      }
    })
  });
});
