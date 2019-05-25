import $ from 'jquery';
import 'select2';

const initSelect2 = () => {
  $('#cocktail_doses_attributes_0_ingredient_id').select2({
    placeholder: 'Select an ingredient',
    allowClear: true
  });
};

export { initSelect2 };
