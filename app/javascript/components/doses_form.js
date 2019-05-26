let current_id = 0;
export const initDosesForm = () => $(".fa-plus").click(function() {
  nextElement($('.form-doses .form-dose:last-child'));
});

function nextElement(element) {
  const newElement = $(element).clone(true);
  current_id += 1;


  const change_id = (e, attribute) => {
    const array = $(e, newElement).attr(attribute).split("_");
    array[3] = current_id;
    $(e, newElement).attr(attribute, array.join("_"));
  };

  change_id('label', 'for');
  change_id('select', 'id');
  change_id('select', 'data-select2-id');
  change_id('span .select2-selection__rendered', 'id');
  change_id('span .select2-selection--single', 'aria-labelledby');

  const arr_id_quantity_select_name = $('select', newElement).attr("name").split("");
  arr_id_quantity_select_name[27] = current_id;
  $('select', newElement).attr("name", arr_id_quantity_select_name.join(""));

  change_id('label', 'for');
  change_id('input', 'id');

  const arr_id_quantity_input_name = $('input', newElement).attr("name").split("");
  arr_id_quantity_input_name[27] = current_id;
  $('input', newElement).attr("name", arr_id_quantity_input_name.join(""));

  newElement.appendTo('.form-doses');
};
