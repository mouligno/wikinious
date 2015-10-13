$(document).ready(function(){
  var editor = ace.edit("editor");
  editor.setTheme("ace/theme/github");

  var textarea = $('#article_content').hide();
  editor.getSession().setValue(textarea.val());
  editor.getSession().on('change', function(){
    textarea.val(editor.getSession().getValue());
  });
})
